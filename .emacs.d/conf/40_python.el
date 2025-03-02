(use-package lsp-pyright
  :ensure t
  :custom
  (lsp-pyright-langserver-command "pyright")
  :hook
  (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))  ; or lsp-deferred

(use-package python-mode
  :ensure t
  :hook
  (python-mode . lsp)
  :custom
  (lsp-pylsp-plugins-pydocstyle-enabled nil))

(use-package pyvenv
  :ensure t)

(use-package pyvenv-auto
  :ensure t
  :hook
  (python-mode . pyvenv-auto-run))

(use-package py-isort
  :ensure t
  :init
  (add-hook 'before-save-hook 'py-isort-before-save))

(use-package py-autopep8
  :ensure t
  :hook
  (python-mode . py-autopep8-mode))
