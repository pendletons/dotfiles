;;; Init.el -- My Emacs configuration
;-*-Emacs-Lisp-*-

;;; Commentary:
;;
;; No comment.
;;

;;; Code:

(package-initialize)
(require 'package)
(setq package-enable-at-startup nil)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(let ((files (directory-files-and-attributes "~/.emacs.d/lisp" t)))
  (dolist (file files)
    (let ((filename (car file))
          (dir (nth 1 file)))
      (when (and dir
                 (not (string-suffix-p "." filename)))
        (add-to-list 'load-path (car file))))))

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(add-to-list 'exec-path "/usr/local/bin")

;; Store Custom text in a separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)


;;;; PACKAGES

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(defun mac-p ()
  "Return t if the current system is OSX/macOS."
  (eq system-type 'darwin))

(use-package ag :ensure t)

(use-package auto-indent-mode
  :ensure t
  :config
  (auto-indent-global-mode))

(use-package company
  :ensure t
  :config
  (global-company-mode t))
(push 'company-robe company-backends)


(use-package exec-path-from-shell
  :ensure t
  :if (mac-p)
  :init
  (exec-path-from-shell-initialize))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))
(setq-default flycheck-disabled-checkers '(ruby-reek))

(use-package helm :ensure t)

(use-package idle-highlight-mode :ensure t)

(defun my-coding-hook ()
  (make-local-variable 'column-number-mode)
  (column-number-mode t)
  (if window-system (hl-line-mode t))
  (idle-highlight-mode t))

(add-hook 'emacs-lisp-mode-hook 'my-coding-hook)
(add-hook 'ruby-mode-hook 'my-coding-hook)

(use-package inf-ruby
  :ensure t
  :config
  (global-set-key (kbd "C-c r r") 'inf-ruby))

(use-package multiple-cursors
  :ensure t
  :config
  (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines))


(use-package neotree
  :ensure t
  :config
  (global-set-key [f8] 'neotree-toggle))
(setq neo-smart-open t)
(setq projectile-switch-project-action 'neotree-projectile-action)
(setq-default neo-show-hidden-files t)

(use-package projectile-rails
  :ensure t
  :config
  (projectile-rails-global-mode 1))

(use-package robe :ensure t)
(add-hook 'ruby-mode-hook 'robe-mode)

(use-package rspec-mode
  :ensure t
  :config
  (setq compilation-scroll-output t))

;;;; SETTINGS
(setq inhibit-splash-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message t)

;; auto-save on focus lost
(add-hook 'focus-out-hook (lambda () (save-some-buffers t)))

;;;; DISPLAY
(global-hl-line-mode 1)
(global-linum-mode 1)
(setq-default show-trailing-whitespace t)
(setq frame-title-format "%b")

; split windows horizontally
(setq split-height-threshold nil)
(setq split-width-threshold 180)

(defadvice linum-update-window (around linum-dynamic activate)
  (let* ((w (length (number-to-string
                     (count-lines (point-min) (point-max)))))
         (linum-format (concat " %" (number-to-string w) "d ")))
    ad-do-it))
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Backups

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;;;; ORG MODE

(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-agenda-files (list "~/org/work.org"
			     "~/org/insurance_policy_admin.org"
			     "~/org/final_furlong.org"
			     "~/org/personal.org"
			     "~/org/home.org"))
(setq org-log-done t)

(setq org-directory "~/org")
(setq org-mobile-inbox-for-pull "~/org/flagged.org")
(setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")

;;;; SYNTAX
(setq ruby-deep-indent-paren nil)

(require 'init-magit)
(require 'init-evil)
(require 'init-ido)

;;; init.el ends here
