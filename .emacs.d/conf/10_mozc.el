(use-package mozc
  :ensure t
  :custom
  (default-input-method "japanese-mozc")
  (mozc-candidate-style 'echo-area)
  :bind
  ("C-;" . toggle-input-method))
