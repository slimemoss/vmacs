(use-package company-ansible
  :ensure t)

(use-package ansible
  :ensure t
  :init
  (add-to-list 'company-backends 'company-ansible))
