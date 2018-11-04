
(setq inhibit-startup-message t)
(tool-bar-mode -1)

;;Everytime yes or no option is changed to y or n.
(fset 'yes-or-no-p 'y-or-n-p)

(use-package try
  :ensure t)

(use-package which-key
  :ensure t
  :config (which-key-mode))

;; Org-mode stuff
(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda() (org-bullets-mode 1))))

;;  ido(interactively do things) mode
;;(setq ido-enable-flex-matching t)
;;(setq ido-everywhere t)
;;(ido-mode 1)
