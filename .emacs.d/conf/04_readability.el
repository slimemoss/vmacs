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
  :config
  (whitespace-mode 1))
