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


(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(defun mac-p ()
  "Return t if the current system is OSX/macOS."
  (eq system-type 'darwin))

(use-package exec-path-from-shell
  :ensure t
  :if (mac-p)
  :init
  (exec-path-from-shell-initialize))
(use-package helm :ensure t)
(use-package magit
  :ensure t
  :config
  (global-set-key (kbd "C-c m") 'magit-status)

  (use-package evil-magit
    :ensure t)
  (use-package magithub
    :ensure t
    :config
    (magithub-feature-autoinject t)))
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(setq-default flycheck-disabled-checkers '(ruby-reek))

(use-package projectile-rails
  :ensure t
  :config
  (projectile-rails-global-mode 1))

(use-package robe :ensure t)
(add-hook 'ruby-mode-hook 'robe-mode)

(use-package rspec-mode
  :ensure t)

(use-package multiple-cursors
  :ensure t)

(use-package company
  :ensure t
  :config
  (global-company-mode t))
(push 'company-robe company-backends)

;; Basic settings.
(setq inhibit-splash-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message t)

;; Display
(global-hl-line-mode 1)
(global-linum-mode 1)
(setq show-trailing-whitespace t)

(defadvice linum-update-window (around linum-dynamic activate)
  (let* ((w (length (number-to-string
                     (count-lines (point-min) (point-max)))))
         (linum-format (concat " %" (number-to-string w) "d ")))
    ad-do-it))
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-agenda-files (list "~/org/work.org"
			     "~/org/final_furlong.org"
			     "~/org/personal.org"
			     "~/org/home.org"))
(setq org-log-done t)

(require 'init-evil)
(require 'init-ido)

;;; init.el ends here
