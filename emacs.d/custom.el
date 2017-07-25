;;; Commentary:
;;; Code:
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-enabled-themes (quote (spacegray)))
 '(custom-safe-themes
   (quote
    ("a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "d8f76414f8f2dcb045a37eb155bfaa2e1d17b6573ed43fb1d18b936febc7bbc2" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(package-selected-packages
   (quote
    (json-mode auto-indent-mode ido-better-flex helm-projectile idle-highlight-mode ag evil-magit compay evil-nerd-commenter multiple-cursors rspec-mode exec-path-from-shell flx-ido projectile-rails spacegray-theme solarized-theme ido-everywhere ido-mode ido-ubiquitous imenu+ flycheck neotree evil-indent-textobject evil-indent-plus evil-surround evil-leader relative-line-numbers magithub smex helm-rails ## helm magit use-package evil-visual-mark-mode)))
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(projectile-mode t nil (projectile))
 '(safe-local-variable-values
   (quote
    ((flycheck-disabled-checkers . ruby-reek)
     (rspec-use-docker-when-possible . t)
     (hl-sexp-mode)
     (rainbow-mode . t)
     (rspec-docker-cwd . "/usr/src/app/")
     (flycheck-disabled-checkers . "ruby-reek")
     (rspec-docker-cwd . "/usr/src/app")
     (rspec-docker-container . "insurance_policy_admin"))))
 '(save-place t)
 '(show-paren-mode t)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(vc-annotate-background-mode nil)
 '(weechat-color-list
   (quote
    (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83")))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Menlo" :foundry "nil" :slant normal :weight normal :height 141 :width normal))))
 '(custom-comment ((t (:background "light sky blue"))))
 '(custom-comment-tag ((t (:foreground "light sky blue"))))
 '(error ((t (:foreground "red3"))))
 '(font-lock-comment-delimiter-face ((t (:foreground "light sky blue"))))
 '(font-lock-comment-face ((t (:foreground "light sky blue"))))
 '(font-lock-constant-face ((t (:foreground "LightGoldenrod1"))))
 '(font-lock-string-face ((t (:foreground "pale green"))))
 '(font-lock-variable-name-face ((t (:foreground "turquoise"))))
 '(trailing-whitespace ((t (:background "red" :foreground "red" :inverse-video t :underline nil)))))
