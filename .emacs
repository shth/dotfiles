;; suggested config for org mode
;; ref: https://orgmode.org/worg/org-tutorials/org4beginners.html
;; -*- mode: elisp -*-

;; Disable the splash screen (to enable it agin, replace the t with 0)
(setq inhibit-splash-screen t)

;; Enable transient mark mode
(transient-mark-mode 1)

;;;;Org mode configuration
;; Enable Org mode
(require 'org)
;; Make Org mode work with files ending in .org
;; (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; The above is the default in recent emacsen

;; Make TAB work in org mode (should come before (require 'evil))
;; ref: https://github.com/Somelauw/evil-org-mode
(setq evil-want-C-i-jump nil)

;; Evil mode
;; ref: https://github.com/emacs-evil/evil#install
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)

;; Evil-org
;; ref: https://github.com/Somelauw/evil-org-mode
(add-to-list 'load-path "~/.emacs.d/plugins/evil-org")
(require 'evil-org)
(add-hook 'org-mode-hook 'evil-org-mode)
(evil-org-set-key-theme '(navigation insert textobjects additional calendar))
(require 'evil-org-agenda)
(evil-org-agenda-set-keys)

