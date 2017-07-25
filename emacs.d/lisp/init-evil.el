;;; Init-evil.el -- Evil mode configuration.
;;; Commentary:
;;; Code:

(use-package evil
  :ensure t
  :config
  (evil-mode 1)

  (use-package evil-leader
    :ensure t
    :config
    (global-evil-leader-mode))

  (use-package evil-surround
    :ensure t
    :config
    (global-evil-surround-mode))

  (use-package evil-nerd-commenter
    :ensure t
    :config
    (evilnc-default-hotkeys t)))

;; (evil-define-operator evil-destroy (beg end type register yank-handler)
  ;; (evil-delete beg end type ?_ yank-handler))

;; (evil-define-operator evil-destroy-replace (beg end type register yank-handler)
  ;; (evil-destroy beg end type register yank-handler)
  ;; (evil-paste-before 1 register))

(defun whitespace-only-p (string)
  (equal "" (replace-regexp-in-string "[ \t\n]" "" string)))

;; (defadvice evil-delete (around evil-delete-yank activate)
  ;; (if (whitespace-only-p (buffer-substring beg end))
      ;; (evil-destroy beg end type register yank-handler)
    ;; ad-do-it))

(evil-leader/set-key
  "e" 'find-file
  "b" 'switch-to-buffer
  "k" 'kill-buffer)

(evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-quick-look)
(evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)

(provide 'init-evil)

;;; init-evil.el ends here
