(use-package web-mode
  :ensure t
  :init
  (add-to-list 'auto-mode-alist '("\\.ts\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))

  :custom
  (web-mode-attr-indent-offset nil)

  (web-mode-enable-auto-closing t)
  (web-mode-enable-auto-pairing t)

  (web-mode-auto-close-style 2)
  (web-mode-tag-auto-close-style 2)


  (web-mode-markup-indent-offset 2)
  (web-mode-css-indent-offset 2)
  (web-mode-code-indent-offset 2)

  :hook
  ((web-mode . lsp)))
