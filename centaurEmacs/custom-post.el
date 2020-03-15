;; un-comment when running on WSL to have a way to paste when running from WSL
;; start wsl paste
;; (defun wsl-paste ()
;;   (interactive)
;;   (let ((wslbuffername "wsl-temp-buffer"))
;;     (get-buffer-create wslbuffername)
;;     (with-current-buffer wslbuffername
;;       (insert (let ((coding-system-for-read 'dos))
;;                 ;; TODO: put stderr somewhere else
;;                 (shell-command "powershell.exe -command 'Get-Clipboard' 2> /dev/null" wslbuffername nil))))
;;     (insert-buffer wslbuffername)
;;     (kill-buffer wslbuffername)))

;; (global-set-key (kbd "C-c C-v") 'wsl-paste)
;; end wsl paste

;; attempt to make undo tree faster
(setq undo-tree-enable-undo-in-region nil)

;; indentation settings
(defvar adam-tab-width 2)

(let* ((adam-js-tab-width adam-tab-width)
       (adam-web-tab-width adam-tab-width)
       (adam-ts-tab-width adam-tab-width))
  (setq-default
   indent-tabs-mode nil
   standard-indent adam-tab-width
   tab-width adam-tab-width
   c-default-style "bsd"
   c-basic-offset adam-tab-width
   ;; js/html/css indentation
   sgml-basic-offset adam-web-tab-width
   js-indent-level adam-js-tab-width
   js2-basic-offset adam-js-tab-width
   ;; typescript indent level
   typescript-indent-level adam-ts-tab-width)
  (with-eval-after-load 'web-mode
    (setq
     css-indent-offset adam-web-tab-width
     web-mode-markup-indent-offset adam-web-tab-width
     web-mode-css-indent-offset adam-web-tab-width
     web-mode-code-indent-offset adam-js-tab-width
     web-mode-attr-indent-offset adam-web-tab-width)

    (add-to-list 'web-mode-indentation-params '("lineup-args" . nil))
    )
  )

;; install packages
(dolist (package '(rjsx-mode json-mode solarized-theme eterm-256color))
  (unless (package-installed-p package)
    (package-install package))
  (require package))

;; remove annoying packages
(unload-feature 'aggressive-indent)
(unload-feature 'hungry-delete)

;; rjsx mode for js files
(add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))

;; the following doesn't work
;;(add-hook 'rjsx-mode-hook (lambda() (setq-local prettify-symbols-alist '((">=" . 8805)
;;                                                                    ("<=" . 8804)))))

;; solarized theme
(load-theme 'solarized-dark t)

;; 256color terminal
(add-hook 'term-mode-hook #'eterm-256color-mode)

;; highlight lines longer than 100 chars
(require 'whitespace)
(setq whitespace-line-column 100)
(setq whitespace-style '(face lines-tail))
(add-hook 'prog-mode-hook 'whitespace-mode)
