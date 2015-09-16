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

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)
(setq url-http-attempt-keepalives nil)

(defvar my-packages
  '(ag
    auto-complete
    coffee-mode
    flycheck
    go-autocomplete
    go-mode
    vagrant-tramp
    haskell-mode
    jedi
    js2-mode
    magit
    markdown-mode
    monokai-theme
    powerline
    rust-mode
    scss-mode
    virtualenvwrapper)
  "A list of packages
to ensure are installed at launch.")

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

(load-theme 'monokai t)

(menu-bar-mode 0)

(ido-mode t)
(setq ido-enable-flex-matching t)

(setq inhibit-startup-message t)

(setq visible-bell ())

(show-paren-mode 1)

(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(add-hook 'after-init-hook #'global-flycheck-mode)

(require 'virtualenvwrapper)
(venv-initialize-interactive-shells) ;; if you want interactive shell support
(venv-initialize-eshell) ;; if you want eshell support

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
                                        ; 
(require 'powerline)
(powerline-default-theme)

(add-to-list 'auto-mode-alist '("SConstruct" . python-mode))
(add-to-list 'auto-mode-alist '("SConscript" . python-mode))

(eval-after-load 'tramp
  '(vagrant-tramp-enable))

(require 'auto-complete)
(require 'go-autocomplete)

(provide '.emacs)
;;; .emacs ends here
