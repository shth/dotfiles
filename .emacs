;; suggested config for org mode
;; ref: https://orgmode.org/worg/org-tutorials/org4beginners.html
;; -*- mode: elisp -*-

;; Disable the splash screen (to enable it agin, replace the t with 0)
(setq inhibit-splash-screen t)

;; Enable transient mark mode
(transient-mark-mode 1)

;; auto save settings
;; save every 20 characters typed (this is the minimum)
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Auto-Save-Control.html#Auto-Save-Control
(setq auto-save-interval 20
      auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save/" t))
      )

;; backup settings
;; https://www.emacswiki.org/emacs/BackupDirectory
; https://www.gnu.org/software/emacs/manual/html_node/emacs/Backup-Copying.html#Backup-Copying
(setq backup-by-copying t      ; don't clobber symlinks
      backup-directory-alist `((".*" . ,(concat user-emacs-directory "backups/")))    ; don't litter my fs tree
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
            '((sequence "TODO" "PENDING(p)" "NEXT(n)" "IN_PROGRESS(!/@)" "BLOCKED(b@/!)" "|" "DONE(d@)" "CANCELED(c@)")))
;; custom key maps from:
;; https://orgmode.org/manual/Activation.html#Activation
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

;; active clean view on start up
;; https://www.evernote.com/u/0/client/web#?b=6227f2ba-1da1-4043-bea0-9a26361824e1&n=32979271-2279-4498-968b-4b7d2bd8fd2d&s=s500&search=v4&
(setq org-startup-indented t)

(setq org-directory "~/org-mode")
(setq org-default-notes-file (concat org-directory "/agenda/inbox.org"))
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

(setq stephen/org-agenda-directory "~/org-mode/agenda/")
;; ref: https://orgmode.org/manual/Template-expansion.html#Template-expansion
(setq org-capture-templates
            `(("i" "inbox" entry (file ,(concat stephen/org-agenda-directory "inbox.org"))
	                "* TODO %?")
	      ("R" "random thoughts" entry (file ,(concat stephen/org-agenda-directory "inbox.org"))
			"* TODO a random thought about %?")
	      ("c" "consume")
	      ("ca" "article" entry (file ,(concat stephen/org-agenda-directory "inbox.org"))
			"* TODO read article \"%^{title}\"\n[[%^{link}][link]]\n%?" )
	      ("cv" "video" entry (file ,(concat stephen/org-agenda-directory "inbox.org"))
			"* TODO watch video \"%^{title}\"\n[[%^{link}][link]]\n%?" )

	      ("n" "note")
	      ("na" "article" entry (file ,(concat stephen/org-agenda-directory "inbox.org"))
			"* notes about article \"%^{title}\"\n[[%^{link}][link]]\n%?" )
	      ("nv" "video" entry (file ,(concat stephen/org-agenda-directory "inbox.org"))
			"* notes about video \"%^{title}\"\n[[%^{link}][link]]\n%?" )
	      ("nb" "book" entry (file ,(concat stephen/org-agenda-directory "inbox.org"))
			"* notes about book \"%^{title}\"\npage: p.%^{page number}\n%?" )
	       
	      ("o" "other people")
	      ("or" "other people's request" entry (file ,(concat stephen/org-agenda-directory "inbox.org"))
			"* TODO request from %^{who?}\nrequested on: %t \ndeadline:%^{deadline}t\n\n%?" )
))
(setq org-agenda-custom-commands
    '(
      (" " "Agenda and Home-related tasks"
	(
	;; default agenda view
	(agenda "")
	;; inbox
	(todo "TODO"
	      ((org-agenda-overriding-header "To Refile")
	       (org-agenda-skip-function '(org-agenda-skip-if nil '(schedule deadline)))
	       (org-agenda-files '("~/org-mode/agenda/inbox.org"))
	       ))
	;; next actions
	(todo "NEXT"
	      ((org-agenda-overriding-header "Projects")
	       (org-agenda-skip-function '(org-agenda-skip-if nil '(schedule deadline)))
	       (org-agenda-files '("~/org-mode/agenda/projects.org"))
	       ))
        )
      )
      ("r" "Reflections"
	(
	;; next actions
	(todo "NEXT"
	      ((org-agenda-overriding-header "Next actions")
	       (org-agenda-skip-function '(org-agenda-skip-if nil '(schedule deadline)))
	       (org-agenda-files '("~/org-mode/agenda/reflections.org"))
	       ))
        )
      )
     )
)
(setq stephen/refile-target-projects "~/org-mode/agenda/projects.org")
(setq stephen/refile-target-someday "~/org-mode/agenda/someday.org")
(setq stephen/refile-target-reflections "~/org-mode/agenda/reflections.org")
(setq org-agenda-files (directory-files "~/org-mode/agenda/" t ".*\.org"))
 (setq org-refile-targets '((stephen/refile-target-projects :maxlevel . 1)
			    (stephen/refile-target-someday :maxlevel . 1)
			    (stephen/refile-target-reflections :maxlevel . 1)
			    ))
(add-to-list 'org-modules 'org-habit t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   (quote
    ("/home/stephen/org-mode/agenda/inbox.org" "/home/stephen/org-mode/agenda/projects.org" "/home/stephen/org-mode/agenda/reflections.org" "/home/stephen/org-mode/agenda/someday.org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

