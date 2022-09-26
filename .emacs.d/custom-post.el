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
(defvar adam-js-tab-width adam-tab-width)
(defvar adam-web-tab-width adam-tab-width)
(defvar adam-ts-tab-width adam-tab-width)

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

;; install packages
(dolist (package '(rjsx-mode json-mode solarized-theme eterm-256color tree-sitter tree-sitter-langs))
  (unless (package-installed-p package)
    (package-install package))
  (require package))

;; remove annoying packages
(cancel-function-timers 'aggressive-indent--indent-if-changed)
(unload-feature 'aggressive-indent)
(unload-feature 'hungry-delete)
(unload-feature 'drag-stuff)
(unload-feature 'diff-hl-flydiff)
(unload-feature 'diff-hl)

;; rjsx mode for js files
(setq auto-mode-alist (delete '("\\.jsx\\'" . js2-jsx-mode) auto-mode-alist))
(add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . rjsx-mode))

;; solarized theme
(load-theme 'solarized-dark t)

;; 256color terminal
(add-hook 'term-mode-hook #'eterm-256color-mode)

;; highlight lines longer than 100 chars
(require 'whitespace)
(setq whitespace-line-column 100)
(setq whitespace-style '(face lines-tail))
(add-hook 'prog-mode-hook 'whitespace-mode)

;; bind ace window to easier key
(global-set-key (kbd "M-o") 'ace-window)
(add-hook 'term-mode-hook (lambda() (define-key term-raw-map (kbd "M-o") 'ace-window)))

;; consistent home/end
(global-set-key (kbd "<home>") 'move-beginning-of-line)
(global-set-key (kbd "<end>") 'move-end-of-line)

;; smarter move to beginning of line
(defun smarter-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.

Move point to the first non-whitespace character on this line.
If point is already there, move to the beginning of the line.
Effectively toggle between the first non-whitespace character and
the beginning of the line.

If ARG is not nil or 1, move forward ARG - 1 lines first.  If
point reaches the beginning or end of the buffer, stop there."
  (interactive "^p")
  (setq arg (or arg 1))

  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))

  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))

(global-set-key [remap move-beginning-of-line] 'smarter-move-beginning-of-line)

(setq exec-path (append '("~/.nvm/versions/node/v12.13.1/bin") exec-path))

(setq lsp-java-format-enabled nil)
(add-to-list 'centaur-lsp-format-on-save-ignore-modes 'typescript-mode)

;; temp TSX config https://github.com/emacs-typescript/typescript.el/issues/4
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))

(when (eq system-type 'darwin))
  (setq insert-diectory-program "/opt/homebrew/bin/gls")
