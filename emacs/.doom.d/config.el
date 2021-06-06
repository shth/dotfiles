;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(setq jethro/org-agenda-todo-view
      `(" " "Agenda"
	((agenda ""
		 ((org-agenda-span 'week)
		  (org-deadline-warning-days 365)))
	 (todo "TODO"
	       ((org-agenda-overriding-header "To Refile")
		(org-agenda-files '(,(concat org-directory "inbox.org")))))
	 (todo "TODO"
	       ((org-agenda-overriding-header "Emails")
		(org-agenda-files '(,(concat org-directory "emails.org")))))
	 (todo "NEXT"
	       ((org-agenda-overriding-header "In Progress")
		(org-agenda-files '(,(concat org-directory "someday.org")
				     ,(concat org-directory "projects.org")
				     ,(concat org-directory "next.org")))
		))
	 (todo "TODO"
	       ((org-agenda-overriding-header "Projects")
		(org-agenda-files '(,(concat org-directory "projects.org")))
		))
	 (todo "TODO"
	       ((org-agenda-overriding-header "One-off Tasks")
		(org-agenda-files '(,(concat org-directory "next.org")))
		(org-agenda-skip-function '(org-agenda-skip-entry-if 'deadline 'scheduled))))
	 nil)))

(defun shth/my-org-agenda-set-effort (effort)
  "Set the effort property for the current headline."
  (interactive
    (list (read-string (format "Effort [%s]: " shth/org-default-effort) nil nil shth/org-default-effort)))
  (setq shth/org-default-effort effort)
  (org-agenda-check-no-diary)
  (let* ((hdmarker (or (org-get-at-bol 'org-hd-marker)
		       (org-agenda-error)))
	 (buffer (marker-buffer hdmarker))
	 (pos (marker-position hdmarker))
	 (inhibit-read-only t)
	 newhead)
    (org-with-remote-undo buffer
			  (with-current-buffer buffer
					       (widen)
					       (goto-char pos)
					       (org-show-context 'agenda)
					       (funcall-interactively 'org-set-effort nil shth/org-default-effort)
					       (end-of-line 1)
					       (setq newhead (org-get-heading)))
			  (org-agenda-change-all-lines newhead hdmarker))))

(defun jethro/org-agenda-process-inbox-item ()
  "Process a single item in the org-agenda."
  (org-with-wide-buffer
    (org-agenda-set-tags)
    (org-agenda-priority)
    (call-interactively 'shth/my-org-agenda-set-effort)
    (org-agenda-refile nil nil t)))

(defvar jethro/org-agenda-bulk-process-key ?Q
    "Default key for bulk processing inbox items.")

(defun jethro/org-inbox-capture ()
  (interactive)
  "Capture a task in agenda mode."
  (org-capture nil "i"))

(use-package! org-agenda
	      ;; if you omit :defer, :hook, :commands, or :after, then the package is loaded
	      ;; immediately. By using :hook here, the `hl-todo` package won't be loaded
	      ;; until prog-mode-hook is triggered (by activating a major mode derived from
	      ;; it, e.g. python-mode) 
	      :config
	      (add-to-list 'org-agenda-custom-commands `,jethro/org-agenda-todo-view)
	      (setq org-agenda-bulk-custom-functions `((,jethro/org-agenda-bulk-process-key jethro/org-agenda-process-inbox-item)))
	      (define-key org-agenda-mode-map "c" 'jethro/org-inbox-capture)
	      )

(defvar shth/org-default-effort "1:00"
  "Current effort for agenda items.")

(use-package! org-capture
	      :config
	      (add-to-list 'org-capture-templates
			   `("i" "inbox" entry (file ,(concat org-directory "inbox.org")) "* TODO %?"))
	      )

(use-package! pyim-cangjiedict
	      :config
	      (setq default-input-method "pyim")
	      (setq pyim-page-tooltip 'popup)
	      (setq pyim-default-scheme 'cangjie)
	      (pyim-cangjie5dict-enable) ;; 啓用五代詞庫(Enable cangjie5)
	      )

