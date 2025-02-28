(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  :custom
  (dashboard-items '(
                     (bookmarks . 10)
                     (recents  . 20)
                     )))

(use-package recentf
  :ensure t
  :custom
  (recentf-save-file "~/.emacs.d/persistent/recentf")
  (recentf-max-saved-items 2000)
  :config
  (recentf-mode 1))

(use-package switch-buffer-functions
  :defer t
  :after recentf
  :preface
  (defun my-recentf-track-visited-file (_prev _curr)
    (and buffer-file-name
         (recentf-add-file buffer-file-name)))
  :init
  (add-hook 'switch-buffer-functions #'my-recentf-track-visited-file))

(use-package bookmark
  :ensure t
  :custom
  (bookmark-default-file "~/.emacs.d/persistent/bookmarks"))
