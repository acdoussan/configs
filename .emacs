;; .emacs

(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq tab-stop-list (number-sequence 2 150 2))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(diff-switches "-u")
 '(global-whitespace-mode t)
 '(whitespace-line (quote whitespace-line))
 '(whitespace-line-column 100)
 '(whitespace-style (quote (face trailing empty lines-tail))))


(setq package-list '(multiple-cursors flycheck))

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                        ("melpa" . "https://melpa.org/packages/")))

(package-initialize)

; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
        (package-install package)))

(global-flycheck-mode)

(setq custom-theme-load-path '("~/.config/emacs/themes/emacs-color-theme-solarized"))
(setq frame-background-mode 'dark)
(load-theme 'solarized t)

(setq linum-format "%4d \u2502 ")
(global-linum-mode 1)
