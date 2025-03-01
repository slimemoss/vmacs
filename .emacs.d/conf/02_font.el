(set-face-attribute 'default nil
                    :family "PlemolJP"
                    :height 132)
(set-fontset-font (frame-parameter nil 'font)
                  'japanese-jisx0208
                  (cons "PlemolJP" "iso10646-1"))
(set-fontset-font (frame-parameter nil 'font)
                  'japanese-jisx0212
                  (cons "PlemolJP" "iso10646-1"))
(set-fontset-font (frame-parameter nil 'font)
                  'katakana-jisx0201
                  (cons "PlemolJP" "iso10646-1"))

(use-package all-the-icons
  :ensure t
  :init (if (not (file-exists-p "~/.local/share/fonts/all-the-icons.ttf"))
	    (all-the-icons-install-fonts t)))

(use-package all-the-icons-nerd-fonts
  :demand t
  :straight
  (all-the-icons-nerd-fonts :host github :repo "mohkale/all-the-icons-nerd-fonts")
  :after all-the-icons
  :init (if (not (file-exists-p "~/.local/share/fonts/NFM.ttf"))
	    (nerd-icons-install-fonts t))
  :config
  (all-the-icons-nerd-fonts-prefer))
