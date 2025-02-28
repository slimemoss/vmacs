(use-package company
  :ensure t
  :init (global-company-mode)
  :custom
  (company-idle-delay 0)
  (company-show-numbers nil)
  (company-minimum-prefix-length 1)
  (company-selection-wrap-around t))

(use-package company-box
  :ensure t
  :hook
  (company-mode . company-box-mode))
