# G
The G programming Language

# EXECUTE .G FILES

$ g.py exe file.g

OR

$ python3 g.py exe file.g

# HELLO WORLD:

import "std.g"

"Hello, World!" print

# MATH:

10 20 + print

30 10 - print

# PACKAGES:

The "import" is for importing a package, std.g is the default package but you can create more packages inside the ./packages/ folder

# IMPORT FILES:

you can import a file from the same folder as the main file with the "import" command.
example:

first.g (file):

import "std.g"

"Hello, World!\n" puts

second.g (file):

import "first.g"

"Hello, World 2!" puts

result:
Hello, World!

Hello, World 2!

# COMPILER

$ g.py com -r file.g

OR

$ python3 g.py com -r file.g
