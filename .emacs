(require 'cl)
(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
(setq url-http-attempt-keepalives nil)

(defvar my-packages
  '(better-defaults
    tabbar
    jedi
    go-mode
    markdown-mode
    powerline
    js2-mode
    coffee-mode
    monokai-theme
    haskell-mode
    scss-mode)
    "A list of packages
 to ensure are installed at launch.")

(defun my-packages-installed-p ()
  (loop for p in my-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

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

(load-theme 'monokai t)

(setq inhibit-startup-message t)

(setq visible-bell ())

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

(require 'powerline)
(powerline-default-theme)
;; all backups goto ~/.backups instead in the current directory
(setq backup-directory-alist (quote (("." . "~/.backups"))))

;; show line number
; (global-linum-mode t)
; (custom-set-variables
;   '(linum-format (quote "%2d \u2502")))

;; smooth scroll
(setq scroll-step 1
  scroll-margin 0
  scroll-preserve-screen-position 1
  scroll-conservatively 100000)

;;
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; delete selection with a keypress
(delete-selection-mode t)

;; 以 y/n代表 yes/no
(fset 'yes-or-no-p 'y-or-n-p)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("05c3bc4eb1219953a4f182e10de1f7466d28987f48d647c01f1f0037ff35ab9a" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
