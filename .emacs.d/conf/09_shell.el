(use-package aweshell
  :straight (aweshell :host github :repo "manateelazycat/aweshell")
  :bind (("C-x s" . aweshell-new))
  :custom
  (eshell-directory-name "~/.emacs.d/persistent/eshell"))
