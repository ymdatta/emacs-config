;;  (add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
;;  (load-theme 'midnight t)

;; Column numbers
(setq column-number-mode t)

;; Show paranthesis Mode
;; By default, there is a delay before showing
;; paranthesis. It can be deactivated by the
;; following line. It should be done before
;; activating show-paren mode.

(setq show-paren-delay 0) ;; How long to wait
(show-paren-mode t) ;; turn paren-mode on

;; whitespace mode

(setq inhibit-startup-message t)
(tool-bar-mode -1)

;; Display time on modeline
(display-time-mode 1)

;;Everytime yes or no option is changed to y or n.
(fset 'yes-or-no-p 'y-or-n-p)

;;set the coding systems the terminal uses
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
;; backwards compatibility as default-buffer-file-coding-system
;; is deprecated in 23.2.
(if (boundp 'buffer-file-coding-system)
    (setq-default buffer-file-coding-system 'utf-8)
  (setq default-buffer-file-coding-system 'utf-8))

;; Treat clipboard input as UTF-8 string first; compound text next, etc.
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

(use-package try
  :ensure t)

(use-package deadgrep
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
 'org-babel-load-languages '((C . t) (gnuplot . t)))
;; add additional languages with '((language . t)))

;; Change org-plot/gnuplot key
(local-set-key "\M-\C-g" 'org-plot/gnuplot)

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
