(use-package python-mode
  :ensure t
  :hook
  ((python-mode . lsp)))

(use-package pyvenv
  :ensure t)

(use-package pyvenv-auto
  :hook ((python-mode . pyvenv-auto-run)))

(use-package py-isort
  :ensure t
  :init
  (add-hook 'before-save-hook 'py-isort-before-save))

(use-package py-autopep8
  :ensure t
  :hook ((python-mode) . py-autopep8-mode))

(use-package pylsp-rope
  :ensure t
  :straight (fatebook :repo "sonofhypnos/pylsp-rope.el" :host github
                      :files ("pylsp-rope.el"))
  :commands fatebook-create-question)
