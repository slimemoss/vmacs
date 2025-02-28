;; disable bar
(scroll-bar-mode 0)
(menu-bar-mode 0)
(tool-bar-mode 0)

(display-time-mode 1)

(use-package svg-lib
  :ensure t)

(use-package doom-themes
  :ensure t
  :custom
  (doom-themes-enable-italic t)
  (doom-themes-enable-bold t)
  :config
  (load-theme 'doom-dracula t)
  (doom-themes-visual-bell-config)
  (doom-themes-neotree-config))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))
