(setq package-enable-at-startup nil)

(setq package-user-dir "~/.emacs.d/persistent/elpa")

(when (boundp 'native-comp-eln-load-path)
  (startup-redirect-eln-cache
   (expand-file-name "~/.emacs.d/persistent/eln-cache")))

(with-eval-after-load 'comp
  (setopt native-comp-async-jobs-number 8
          native-comp-speed 1
          native-comp-always-compile t))

(with-eval-after-load 'warnings
  (setopt warning-suppress-types '((comp))))
