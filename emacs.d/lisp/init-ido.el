;;; init-ido.el --- ido configuration
;;; Commentary:
;;; Code:
(use-package ido
  :ensure t
  :config
  (ido-mode 1)

  (use-package ido-ubiquitous
    :ensure t
    :config
    (ido-ubiquitous-mode 1))

  (use-package ido-better-flex
    :ensure t))

(provide 'init-ido)

;; Display ido results vertically, rather than horizontally
(setq ido-decorations (quote ("\n-> " "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))
(defun ido-disable-line-truncation () (set (make-local-variable 'truncate-lines) nil))
(add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-truncation)
(defun ido-define-keys () ;; C-n/p is more intuitive in vertical layout
  (define-key ido-completion-map (kbd "C-n") 'ido-next-match)
  (define-key ido-completion-map (kbd "C-p") 'ido-prev-match))
(add-hook 'ido-setup-hook 'ido-define-keys)

;;; init-ido.el ends here
