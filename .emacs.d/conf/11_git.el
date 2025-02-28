(use-package magit
  :ensure t
  :bind (("C-x m" . magit-status))
  :custom
  (magit-diff-refine-hunk 'all))
