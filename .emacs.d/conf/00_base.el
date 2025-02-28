;; "yes or no" の選択を "y or n" にする
(fset 'yes-or-no-p 'y-or-n-p)

;; enable trash
(setq delete-by-moving-to-trash t)
(setq trash-directory "/work/.Trash")

;; warning
(setq warning-suppress-types '((comp)))
(setq warning-minimum-level :emergency)

;; sudo edit
(use-package sudo-edit
  :ensure t
  :defer t)

(use-package auto-package-update
  :ensure t
  :defer t)
