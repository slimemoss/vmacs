(use-package exec-path-from-shell
  :ensure t)

(use-package go-mode
  :ensure t
  :commands go-mode
  :hook
  (go-mode . lsp)
  :init
  (add-hook 'go-mode-hook (lambda () (setq tab-width 4)))
  (add-hook 'before-save-hook 'gofmt-before-save))

(exec-path-from-shell-copy-envs '("PATH" "GOROOT" "GOPATH"))
