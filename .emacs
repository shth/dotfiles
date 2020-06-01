;; suggested config for org mode
;; ref: https://orgmode.org/worg/org-tutorials/org4beginners.html
;; -*- mode: elisp -*-

;; Disable the splash screen (to enable it agin, replace the t with 0)
(setq inhibit-splash-screen t)

;; Melpa
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
		                        (not (gnutls-available-p))))
              (proto (if no-ssl "http" "https")))
    (when no-ssl (warn "\
		       Your version of Emacs does not support SSL connections,
		       which is unsafe because it allows man-in-the-middle attacks.
		       There are two things you can do about this warning:
		       1. Install an Emacs version that does support SSL and be safe.
		       2. Remove this warning from your init file so you won't see it again."))
		         (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
			   ;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
			     ;; and `package-pinned-packages`. Most users will not need or want to do this.
			       ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
			         )
(package-initialize)
;; use-package init
(eval-when-compile
        (require 'use-package))

(use-package magit
	     :config
	     (setq magit-repository-directories `(("/mnt/c/Users/stephenhu/Documents" . 1) )))

;; Enable transient mark mode
(transient-mark-mode 1)

;; auto save settings
;; save every 20 characters typed (this is the minimum)
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Auto-Save-Control.html#Auto-Save-Control
(setq auto-save-interval 20)

;; backup settings
;; https://www.emacswiki.org/emacs/BackupDirectory
; https://www.gnu.org/software/emacs/manual/html_node/emacs/Backup-Copying.html#Backup-Copying
(setq backup-by-copying t      ; don't clobber symlinks
      backup-directory-alist `(("." . ,(concat user-emacs-directory "backups")))    ; don't litter my fs tree
      ; https://www.gnu.org/software/emacs/manual/html_node/emacs/Backup-Deletion.html#Backup-Deletion
      delete-old-versions t    ; Make emacs delete old versions silently (by default emacs will ask before deletion)
      kept-new-versions 6      ; how many versions from the latest one are kept
      kept-old-versions 2      ; how many versions from the first one are kept 
      ; https://www.gnu.org/software/emacs/manual/html_node/emacs/Backup-Names.html#Backup-Names
      version-control t)       ; use versioned backups
;; setup chrome browser for opening links
;; require BROWSER environment variable to work
;; ref: https://stackoverflow.com/questions/25261200/no-usable-browser-found-error-when-using-emacs-to-browse-hyperspec/25261294#25261294
(setq browse-url-generic-program 
     (executable-find (getenv "BROWSER"))
      browse-url-browser-function 'browse-url-generic)

;;;;Org mode configuration
;; Enable Org mode
(require 'org)
;; Make Org mode work with files ending in .org
;; (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; The above is the default in recent emacsen


;; Make TAB work in org mode (should come before (require 'evil))
;; ref: https://github.com/Somelauw/evil-org-mode
(setq evil-want-C-i-jump nil)

;; add timestamp for TODO items
;; ref: https://orgmode.org/manual/Closing-items.html
;; (setq org-log-done 'note)
(setq org-use-fast-todo-selection t)
(setq org-todo-keywords
            '((sequence "TODO" "IN_PROGRESS(!/@)" "BLOCKED(b@/!)" "|" "DONE(d@)" "CANCELED(c@)")))
;; custom key maps from:
;; https://orgmode.org/manual/Activation.html#Activation
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

;; active clean view on start up
;; https://www.evernote.com/u/0/client/web#?b=6227f2ba-1da1-4043-bea0-9a26361824e1&n=32979271-2279-4498-968b-4b7d2bd8fd2d&s=s500&search=v4&
(setq org-startup-indented t)

(setq org-directory "~/org-mode")
(setq org-default-notes-file (concat org-directory "/notes.org"))
;; make org-goto use completion
;; ref: https://emacs.stackexchange.com/questions/32617/how-to-jump-directly-to-an-org-headline/32638
(setq org-goto-interface 'outline-path-completion)
;; make org-goto completion show full paths
;; ref: https://emacs.stackexchange.com/questions/32617/how-to-jump-directly-to-an-org-headline/32638
(setq org-outline-path-complete-in-steps nil)


;; Evil mode
;; ref: https://github.com/emacs-evil/evil#install
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)

;; Evil-org
;; ref: https://github.com/Somelauw/evil-org-mode
;; (add-to-list 'load-path "~/.emacs.d/plugins/evil-org")
;; (require 'evil-org)
;; (add-hook 'org-mode-hook 'evil-org-mode)
;; (evil-org-set-key-theme '(navigation insert textobjects additional calendar))
;; (require 'evil-org-agenda)
;; (evil-org-agenda-set-keys)

;; neotree
(add-to-list 'load-path "~/.emacs.d/plugins/neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;; override evil bindings for neotree
(evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-quick-look)
(evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "g") 'neotree-refresh)
(evil-define-key 'normal neotree-mode-map (kbd "n") 'neotree-next-line)
(evil-define-key 'normal neotree-mode-map (kbd "p") 'neotree-previous-line)
(evil-define-key 'normal neotree-mode-map (kbd "A") 'neotree-stretch-toggle)
(evil-define-key 'normal neotree-mode-map (kbd "H") 'neotree-hidden-file-toggle)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (magit use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'magit-diff-edit-hunk-commit 'disabled nil)
