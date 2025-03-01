(use-package ivy
  :ensure t
  :custom
  (ivy-use-virtual-buffers t)
  (enable-recursive-minibuffers t)
  :config (ivy-mode 1))

(use-package ivy-rich
  :ensure t
  :after (counsel)
  :config (ivy-rich-mode 1))

(use-package ivy-prescient
  :ensure t
  :custom
  (ivy-prescient-retain-classic-highlighting t)
  (prescient-save-file "~/.emacs.d/persistent/prescient-save.el")
  :config
  (ivy-prescient-mode 1)
  (prescient-persist-mode 1))

(use-package counsel
  :ensure t
  :custom
  (counsel-find-file-ignore-regexp (regexp-opt '("~")))
  :bind
  ("M-x" . counsel-M-x)
  ("C-x d" . counsel-find-file)
  ("C-x C-f" . counsel-find-file))

;; 検索しやすく
(use-package swiper
  :ensure t
  :bind
  (("C-s" . swiper)
   ("C-r" . swiper)))

;; キーバインドの補完表示
(use-package which-key
  :ensure t
  :init (which-key-mode)
  :diminish which-key-mode)
