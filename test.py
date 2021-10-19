#!/usr/bin/env python3

import sys
import os
from os import path
import subprocess
import shlex
from typing import List, BinaryIO, Tuple, Optional
from dataclasses import dataclass

G_EXT = '.g'

def cmd_run_echoed(cmd, **kwargs):
    print("[CMD] %s" % " ".join(map(shlex.quote, cmd)))
    return subprocess.run(cmd, **kwargs)

def read_blob_field(f: BinaryIO, name: bytes) -> bytes:
    line = f.readline()
    field = b':b ' + name + b' '
    assert line.startswith(field)
    assert line.endswith(b'\n')
    size = int(line[len(field):-1])
    blob = f.read(size)
    assert f.read(1) == b'\n'
    return blob

def read_int_field(f: BinaryIO, name: bytes) -> int:
    line = f.readline()
    field = b':i ' + name + b' '
    assert line.startswith(field)
    assert line.endswith(b'\n')
    return int(line[len(field):-1])

def write_int_field(f: BinaryIO, name: bytes, value: int):
    f.write(b':i %s %d\n' % (name, value))

def write_blob_field(f: BinaryIO, name: bytes, blob: bytes):
    f.write(b':b %s %d\n' % (name, len(blob)))
    f.write(blob)
    f.write(b'\n')

@dataclass
class TestCase:
    argv: List[str]
    stdin: bytes
    returncode: int
    stdout: bytes
    stderr: bytes

DEFAULT_TEST_CASE=TestCase(argv=[], stdin=bytes(), returncode=0, stdout=bytes(), stderr=bytes())

def load_test_case(file_path: str) -> Optional[TestCase]:
    try:
        with open(file_path, "rb") as f:
            argv = []
            argc = read_int_field(f, b'argc')
            for index in range(argc):
                argv.append(read_blob_field(f, b'arg%d' % index).decode('utf-8'))
            stdin = read_blob_field(f, b'stdin')
            returncode = read_int_field(f, b'returncode')
            stdout = read_blob_field(f, b'stdout')
            stderr = read_blob_field(f, b'stderr')
            return TestCase(argv, stdin, returncode, stdout, stderr)
    except FileNotFoundError:
        return None

def save_test_case(file_path: str,
                   argv: List[str], stdin: bytes,
                   returncode: int, stdout: bytes, stderr: bytes):
    with open(file_path, "wb") as f:
        write_int_field(f, b'argc', len(argv))
        for index, arg in enumerate(argv):
            write_blob_field(f, b'arg%d' % index, arg.encode('utf-8'))
        write_blob_field(f, b'stdin', stdin)
        write_int_field(f, b'returncode', returncode)
        write_blob_field(f, b'stdout', stdout)
        write_blob_field(f, b'stderr', stderr)

@dataclass
class RunStats:
    sim_failed: int = 0
    com_failed: int = 0
    ignored: int = 0

def run_test_for_file(file_path: str, stats: RunStats = RunStats()):
    assert path.isfile(file_path)
    assert file_path.endswith(G_EXT)

    print('[INFO] Testing %s' % file_path)

    tc_path = file_path[:-len(G_EXT)] + ".txt"
    tc = load_test_case(tc_path)

    if tc is not None:
        sim = cmd_run_echoed([sys.executable, "./g.py", "sim", file_path, *tc.argv], input=tc.stdin, capture_output=True)
        if sim.returncode != tc.returncode or sim.stdout != tc.stdout or sim.stderr != tc.stderr:
            print("[ERROR] Unexpected simulation output")
            print("  Expected:")
            print("    return code: %s" % tc.returncode)
            print("    stdout: \n%s" % tc.stdout.decode("utf-8"))
            print("    stderr: \n%s" % tc.stderr.decode("utf-8"))
            print("  Actual:")
            print("    return code: %s" % sim.returncode)
            print("    stdout: \n%s" % sim.stdout.decode("utf-8"))
            print("    stderr: \n%s" % sim.stderr.decode("utf-8"))
            stats.sim_failed += 1

        com = cmd_run_echoed([sys.executable, "./g.py", "com", "-r", "-s", file_path, *tc.argv], input=tc.stdin, capture_output=True)
        if com.returncode != tc.returncode or com.stdout != tc.stdout or com.stderr != tc.stderr:
            print("[ERROR] Unexpected compilation output")
            print("  Expected:")
            print("    return code: %s" % tc.returncode)
            print("    stdout: \n%s" % tc.stdout.decode("utf-8"))
            print("    stderr: \n%s" % tc.stderr.decode("utf-8"))
            print("  Actual:")
            print("    return code: %s" % com.returncode)
            print("    stdout: \n%s" % com.stdout.decode("utf-8"))
            print("    stderr: \n%s" % com.stderr.decode("utf-8"))
            stats.com_failed += 1
    else:
        print('[WARNING] Could not find any input/output data for %s. Ignoring testing. Only checking if it compiles.' % file_path)
        com = cmd_run_echoed([sys.executable, "./g.py", "com", file_path])
        if com.returncode != 0:
            stats.com_failed += 1
        stats.ignored += 1

def run_test_for_folder(folder: str):
    stats = RunStats()
    for entry in os.scandir(folder):
        if entry.is_file() and entry.path.endswith(G_EXT):
            run_test_for_file(entry.path, stats)
    print()
    print("Simulation failed: %d, Compilation failed: %d, Ignored: %d" % (stats.sim_failed, stats.com_failed, stats.ignored))
    if stats.sim_failed != 0 or stats.com_failed != 0:
        exit(1)

def update_input_for_file(file_path: str, argv: List[str]):
    assert file_path.endswith(G_EXT)
    tc_path = file_path[:-len(G_EXT)] + ".txt"
    tc = load_test_case(tc_path) or DEFAULT_TEST_CASE

    print("[INFO] Provide the stdin for the test case. Press ^D when you are done...")

    stdin = sys.stdin.buffer.read()

    print("[INFO] Saving input to %s" % tc_path)
    save_test_case(tc_path,
                   argv, stdin,
                   tc.returncode, tc.stdout, tc.stderr)

def update_output_for_file(file_path: str):
    tc_path = file_path[:-len(G_EXT)] + ".txt"
    tc = load_test_case(tc_path) or DEFAULT_TEST_CASE

    output = cmd_run_echoed([sys.executable, "./g.py", "sim", file_path, *tc.argv], input=tc.stdin, capture_output=True)
    print("[INFO] Saving output to %s" % tc_path)
    save_test_case(tc_path,
                   tc.argv, tc.stdin,
                   output.returncode, output.stdout, output.stderr)

def update_output_for_folder(folder: str):
    for entry in os.scandir(folder):
        if entry.is_file() and entry.path.endswith(G_EXT):
            update_output_for_file(entry.path)

def usage(exe_name: str):
    print("Usage: ./test.py [SUBCOMMAND]")
    print("  Run or update the tests. The default [SUBCOMMAND] is 'run'.")
    print()
    print("  SUBCOMMAND:")
    print("    run [TARGET]")
    print("      Run the test on the [TARGET]. The [TARGET] is either a *.g file or ")
    print("      folder with *.g files. The default [TARGET] is './tests/'.")
    print()
    print("    update [SUBSUBCOMMAND]")
    print("      Update the input or output of the tests.")
    print("      The default [SUBSUBCOMMAND] is 'output'")
    print()
    print("      SUBSUBCOMMAND:")
    print("        input <TARGET>")
    print("          Update the input of the <TARGET>. The <TARGET> can only be")
    print("          a *.g file.")
    print()
    print("        output [TARGET]")
    print("          Update the output of the [TARGET]. The [TARGET] is either a *.g")
    print("          file or folder with *.g files. The default [TARGET] is")
    print("          './tests/'")
    print()
    print("    help")
    print("      Print this message to stdout and exit with 0 code.")

if __name__ == '__main__':
    exe_name, *argv = sys.argv

    subcommand = "run"

    if len(argv) > 0:
        subcommand, *argv = argv

    if subcommand == 'update' or subcommand == 'record':
        subsubcommand = 'output'
        if len(argv) > 0:
            subsubcommand, *argv = argv

        if subsubcommand == 'output':
            target = './tests/'

            if len(argv) > 0:
                target, *argv = argv

            if path.isdir(target):
                update_output_for_folder(target)
            elif path.isfile(target):
                update_output_for_file(target)
            else:
                assert False, 'unreachable'
        elif subsubcommand == 'input':
            if len(argv) == 0:
                usage(exe_name)
                print("[ERROR] no file is provided for `%s %s` subcommand" % (subcommand, subsubcommand), file=sys.stderr)
                exit(1)
            file_path, *argv = argv
            update_input_for_file(file_path, argv)
        else:
            usage(exe_name)
            print("[ERROR] unknown subcommand `%s %s`. Available commands are `%s input` or `%s output`" % (subcommand, subsubcommand, subcommand, subcommand), file=sys.stderr)
            exit(1)
    elif subcommand == 'run' or subcommand == 'test':
        target = './tests/'

        if len(argv) > 0:
            target, *argv = argv

        if path.isdir(target):
            run_test_for_folder(target)
        elif path.isfile(target):
            run_test_for_file(target)
        else:
            assert False, 'unreachable'
    elif subcommand == 'help':
        usage(exe_name)
    else:
        usage(exe_name)
        print("[ERROR] unknown subcommand `%s`" % subcommand, file=sys.stderr)
        exit(1);
