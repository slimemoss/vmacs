(use-package mozc
  :ensure t
  :custom
  (default-input-method "japanese-mozc")
  :bind
  ("C-;" . toggle-input-method)
  :custom-face
  (mozc-cand-overlay-focused-face ((t (:foreground "#282a36" :background "#ff79c6" :weight bold))))
  (mozc-cand-overlay-odd-face ((t (:foreground "#d1d1cd" :background "#3b3f51"))))
  (mozc-cand-overlay-even-face ((t (:foreground "#d1d1cd" :background "#3b3f51"))))
  (mozc-cand-overlay-footer-face ((t (:foreground "#d1d1cd" :background "#44475a"))))
  (mozc-cand-overlay-description-face ((t (:foreground "#8d8d8d" :slant italic))))
  (mozc-preedit-face ((t (:foreground "#d1d1cd" :background "#44475a"))))
  (mozc-preedit-selected-face ((t (:foreground "#282a36" :background "#ff79c6" :weight bold))))
  (mozc-cand-echo-area-focused-face ((t (:foreground "#282a36" :background "#ffb86c" :weight bold))))
  (mozc-cand-echo-area-candidate-face ((t (:foreground "#d1d1cd" :background "#3b3f51"))))
  (mozc-cand-echo-area-shortcut-face ((t (:foreground "#ff79c6" :weight bold))))
  (mozc-cand-echo-area-stats-face ((t (:foreground "#50fa7b"))))
  (mozc-cand-echo-area-annotation-face ((t (:foreground "#6272a4" :slant italic)))))

(use-package mozc-popup
  :ensure t
  :custom
  (mozc-candidate-style 'popup))
