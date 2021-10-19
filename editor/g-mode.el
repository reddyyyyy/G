
(defconst g-mode-syntax-table
  (with-syntax-table (copy-syntax-table)
    ;; C/C++ style comments
	(modify-syntax-entry ?/ ". 124b")
	(modify-syntax-entry ?* ". 23")
	(modify-syntax-entry ?\n "> b")
    ;; Chars are the same as strings
    (modify-syntax-entry ?' "\"")
    (syntax-table))
  "Syntax table for `g-mode'.")

(eval-and-compile
  (defconst g-keywords
    '("if" "elif" "else" "end" "while" "do" "macro" "include")))

(defconst g-highlights
  `((,(regexp-opt g-keywords 'symbols) . font-lock-keyword-face)))

;;;###autoload
(define-derived-mode g-mode prog-mode "g"
  "Major Mode for editing g source code."
  (setq font-lock-defaults '(g-highlights))
  (set-syntax-table g-mode-syntax-table))

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.g\\'" . g-mode))

(provide 'g-mode)

;;; g-mode.el ends here
