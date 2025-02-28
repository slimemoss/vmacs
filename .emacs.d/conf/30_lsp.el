(use-package flycheck
  :ensure t
  :custom
  (flycheck-display-errors-delay 0)
  (flycheck-posframe-position 'point-bottom-left-corner)
  (flycheck-posframe-border-width 3))

(use-package lsp-mode
  :ensure t
  :custom
  (lsp-enable-snippet nil)
  (lsp-diagnostics-provider :flycheck)
  (lsp-eldoc-enable-hover nil)

  ;; python
  (lsp-pylsp-plugins-autopep8-enabled t)
  (lsp-pylsp-plugins-isort-enabled t)
  (lsp-pylsp-plugins-rope-autoimport-enabled t)
  (lsp-pylsp-plugins-flake8-ignore '("E501"))
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

  (lsp-ui-sideline-ignore-duplicate t)
  (lsp-ui-flycheck-enable t)
  (lsp-ui-sideline-enable nil))

(use-package popup
  :ensure t)
