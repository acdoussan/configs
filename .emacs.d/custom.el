;;; custom.el --- user customization file    -*- no-byte-compile: t -*-
;;; Commentary:
;;;       Add or change the configurations in custom.el, then restart Emacs.
;;;       Put your own configurations in custom-post.el to override default configurations.
;;; Code:

;; (setq centaur-logo nil)                        ; Logo file or nil (official logo)
(setq centaur-full-name "Adam Doussan")           ; User full name
;; (setq centaur-mail-address "user@email.com")   ; Email address
;; (setq centaur-proxy "127.0.0.1:1087")          ; HTTP/HTTPS proxy
;; (setq centaur-socks-proxy "127.0.0.1:1086")    ; SOCKS proxy
;; (setq centaur-server t)                        ; Enable `server-mode' or not: t or nil
;; (setq centaur-icon t)                          ; Display icons or not: t or nil
(setq centaur-package-archives 'melpa)         ; Package repo: melpa, emacs-cn, bfsu, netease, sjtu, tencent, tuna or ustc
;; (setq centaur-theme 'auto)                     ; Color theme: auto, random, system, default, pro, dark, light, warm, cold, day or night
;; (setq centaur-completion-style 'minibuffer)    ; Completion display style: minibuffer or childframe
;; (setq centaur-dashboard nil)                   ; Display dashboard at startup or not: t or nil
(setq centaur-restore-frame-geometry t)      ; Restore the frame's geometry at startup: t or nil
;; (setq centaur-lsp 'nil)                      ; Set LSP client: lsp-mode, eglot or nil
(setq centaur-lsp-format-on-save nil)            ; Auto format buffers on save: t or nil
;; (setq centaur-lsp-format-on-save-ignore-modes '(c-mode c++-mode python-mode markdown-mode)) ; Ignore format on save for some languages
(setq centaur-tree-sitter t)                 ; Enable tree-sitter or not: t or nil
(setq centaur-chinese-calendar nil)            ; Support Chinese calendar or not: t or nil
(setq centaur-player nil)                        ; Enable players or not: t or nil
;; (setq centaur-prettify-symbols-alist nil)      ; Alist of symbol prettifications. Nil to use font supports ligatures.
;; (setq centaur-prettify-org-symbols-alist nil)  ; Alist of symbol prettifications for `org-mode'

;; Fonts
(when (display-graphic-p)
  ;; Set default font
  (cl-loop for font in '("Source Code Pro For Powerline-12")
           when (font-installed-p font)
           return (set-face-attribute 'default nil
                                      :font font))

  ;; Specify font for all unicode characters
  (cl-loop for font in '("Symbola" "Apple Symbols" "Symbol" "icons-in-terminal")
           when (font-installed-p font)
           return (set-fontset-font t 'unicode font nil 'prepend))

  ;; Specify font for Chinese characters
  (cl-loop for font in '("WenQuanYi Micro Hei" "Microsoft Yahei")
           when (font-installed-p font)
           return (set-fontset-font t '(#x4e00 . #x9fff) font)))

;; Mail
;; (setq message-send-mail-function 'smtpmail-send-it
;;       smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
;;       smtpmail-auth-credentials '(("smtp.gmail.com" 587
;;                                    user-mail-address nil))
;;       smtpmail-default-smtp-server "smtp.gmail.com"
;;       smtpmail-smtp-server "smtp.gmail.com"
;;       smtpmail-smtp-service 587)

;; Calendar
;; Set location , then press `S' can show the time of sunrise and sunset
;; (setq calendar-location-name "Chengdu"
;;       calendar-latitude 30.67
;;       calendar-longitude 104.07)

;; Misc.
;; (setq confirm-kill-emacs 'y-or-n-p)

;; Display on the specified monitor
;; (when (and (> (length (display-monitor-attributes-list)) 1)
;;            (> (display-pixel-width) 1920))
;;   (set-frame-parameter nil 'left 1920))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; custom.el ends here
