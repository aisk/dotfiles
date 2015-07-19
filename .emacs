(require 'cl)
(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
(setq url-http-attempt-keepalives nil)

(defvar my-packages
  '(better-defaults
    tabbar
    go-mode
    markdown-mode
    powerline
    js2-mode
    coffee-mode
    monokai-theme
    scss-mode)
    "A list of packages to ensure are installed at launch.")

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

(require 'tabbar)
(tabbar-mode t)
(setq tabbar-buffer-groups-function
      (lambda ()
        (list "All Buffers")))
(setq tabbar-buffer-list-function
      (lambda ()
        (remove-if
         (lambda(buffer)
           (find (aref (buffer-name buffer) 0) " *"))
                  (buffer-list))))
; (global-set-key [(meta j)] 'tabbar-backward)
; (global-set-key [(meta k)] 'tabbar-forward)

(require 'powerline)
(powerline-default-theme)
;; all backups goto ~/.backups instead in the current directory
(setq backup-directory-alist (quote (("." . "~/.backups"))))

;; 显示行号
; (global-linum-mode t)
; (custom-set-variables
;   '(linum-format (quote "%2d \u2502")))

;; 平滑滚动
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
