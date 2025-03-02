;; 対応する括弧を光らせる
(show-paren-mode 1)

(use-package beacon
  :ensure t
  :custom
  (beacon-color "gray")
  (beacon-blink-when-focused t)
  :config
  (beacon-mode 1))

(use-package whitespace
  :ensure t
  :custom
  (whitespace-style '(face
                      tabs spaces trailing
		      empty space-after-tab))
  :hook
  (flycheck-mode . whitespace-mode))
