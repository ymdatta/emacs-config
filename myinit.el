;;  (add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
;;  (load-theme 'midnight t)

;; Column numbers
(setq column-number-mode t)

;; whitespace mode
(require 'whitespace)

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

;;For org-babel
(org-babel-do-load-languages
 'org-babel-load-languages '((C . t)))

(use-package counsel
  :ensure t
  )

(use-package ivy
  :ensure t
  :diminish (ivy-mode)
  :bind (("C-x b" . ivy-switch-buffer))
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-display-style 'fancy))

(use-package swiper
  :ensure try
  :bind (("C-s" . swiper)
	 ("C-r" . swiper)
	 ("C-c C-r" . ivy-resume)
	 ("M-x" . counsel-M-x)
	 ("C-x C-f" . counsel-find-file))
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq ivy-display-style 'fancy)
    (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
  ))

(use-package flycheck
:ensure t
:init
(global-flycheck-mode t))

(require 'ox-beamer)

(use-package org-ref
   :ensure t)

(use-package ox-reveal
:ensure ox-reveal)

(setq org-reveal-root "http://cdn.jsdelivr.net/reveal.js/3.0.0/")
(setq org-reveal-mathjax t)

(use-package htmlize
 :ensure t)

(use-package spaceline 
   :demand t
   :init 
   (setq powerline-default-seperator 'arrow-fade)
   :config 
   (require 'spaceline-config))

(setq eclim-executable "/home/mohanadatta/.p2/pool/plugins/org.eclim_2.8.0/bin/eclim")

;; To automatically activate eclim for java source files
(require 'eclim)
(add-hook 'jave-mode-hook 'eclim-mode)

(require 'eclimd)

;; Setting style to linux - what 
;; the Linux developers use for kernel development
(setq c-default-style "linux")

;; automatically indent when press RET

(global-set-key (kbd "RET") 'newline-and-indent)

;; Package yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;; To display information about the Current Git repository,
;; 'M-x magit-status RET' is used. This is a basic command,
;; which is used a lot. So, this is given a global key
;; binding.

;; Taken from magit manual.

 (global-set-key (kbd "C-x g") 'magit-status)

(use-package ess
  :ensure t
)
