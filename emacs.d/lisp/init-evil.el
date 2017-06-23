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

; (use-package relative-line-numbers
  ; :ensure t)
; (global-relative-line-numbers-mode)

(evil-leader/set-key
  "e" 'find-file
  "b" 'switch-to-buffer
  "k" 'kill-buffer)

(provide 'init-evil)
  
;;; init-evil.el ends here
