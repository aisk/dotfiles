;;; package --- my emacs config

;;; Commentary:
;; flycheck says I must have a commentary.

(require 'cl-lib)
(require 'package)

;;; Code:

;; delete selection with a keypress
(delete-selection-mode t)

;; 以 y/n代表 yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; all backups goto ~/.backups instead in the current directory
(setq backup-directory-alist (quote (("." . "~/.backups"))))

;; smooth scroll
(setq scroll-step 1
      scroll-margin 0
      scroll-preserve-screen-position 1
      scroll-conservatively 100000)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq ns-use-native-fullscreen nil)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

; (setq ns-use-native-fullscreen nil)

(defvar my-packages
  '(auto-complete
    coffee-mode
    flycheck
    go-autocomplete
    go-mode
    haskell-mode
    jedi
    js2-mode
    markdown-mode
    powerline
    rust-mode
    gruvbox-theme
    scss-mode)
  "A list of packages to ensure are installed at launch.")

(defun my-packages-installed-p ()
  (cl-loop for p in my-packages
           when (not (package-installed-p p)) do (cl-return nil)
           finally (cl-return t)))

(defun my-install-packages ()
  (unless (my-packages-installed-p)
    ;; check for new packages (package versions)
    (message "%s" "Emacs is refreshing its package database...")
    (package-refresh-contents)
    (message "%s" " done.")
    ;; install the missing packages
    (dolist (p my-packages)
      (unless (package-installed-p p)
        (package-install p)))))

(my-install-packages)

(defun toggle-fullscreen ()
  "Toggle full screen."
  (interactive)
  (set-frame-parameter
     nil 'fullscreen
     (when (not (frame-parameter nil 'fullscreen)) 'fullboth)))

(load-theme 'gruvbox t)

(menu-bar-mode 0)

(ido-mode t)
(setq ido-enable-flex-matching t)

(setq inhibit-startup-message t)

(setq js-indent-level 2)

(setq visible-bell ())

(show-paren-mode 1)

(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(add-hook 'after-init-hook #'global-flycheck-mode)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
                                        ; 
(require 'powerline)
(powerline-default-theme)

(add-to-list 'auto-mode-alist '("SConstruct" . python-mode))
(add-to-list 'auto-mode-alist '("SConscript" . python-mode))

(require 'auto-complete)
(require 'go-autocomplete)

(provide '.emacs)
;;; .emacs ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (scss-mode gruvbox-theme rust-mode powerline markdown-mode js2-mode jedi haskell-mode go-mode go-autocomplete flycheck coffee-mode auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
