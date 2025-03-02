(use-package flycheck
  :ensure t
  :custom
  (flycheck-disabled-checkers '(python-flake8)))

(use-package lsp-mode
  :ensure t
  :custom
  ;; lsp-doctor
  (gc-cons-threshold (* 100 (* 1024 1024)))
  (read-process-output-max (* 1024 1024))

  (lsp-session-file "/root/.emacs.d/persistent/.lsp-session-v1")
  :commands lsp)

(use-package lsp-ui
  :ensure t
  :bind
  (:map lsp-mode-map
	("C-c C-r" . lsp-ui-peek-find-references)
	("C-c C-j" . lsp-ui-peek-find-definitions))

  :custom
  (lsp-ui-peek-enable t)

  (lsp-ui-doc-enable t)
  (lsp-ui-doc-show-with-cursor t)
  (lsp-ui-doc-include-signature t)
  (lsp-ui-doc-position 'at-point)

  (lsp-ui-sideline-enable t)
  (lsp-ui-sideline-show-diagnostics t)
  (lsp-ui-sideline-show-hover nil)
  (lsp-ui-sideline-show-code-actions nil)
  (lsp-ui-sideline-ignore-duplicate nil))

(use-package popup
  :ensure t)
