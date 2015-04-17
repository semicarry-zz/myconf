;;; locale.el --- Summary
;;; Commentary:
;;; Code:
;; (require 'init-w3m)
(require 'init-gnus)
(require 'init-go)
(require 'init-evil)
(require 'yasnippet)
(yas-global-mode 1)
;;(require 'color-theme-solarized)

(defun on-after-init ()
  (unless (display-graphic-p (selected-frame))
    (set-face-background 'default "unspecified-bg" (selected-frame))))
(add-hook 'window-setup-hook 'on-after-init)
;;(set-face-background 'default "unspecified-bg")
                                        ;(menu-bar-mode -1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; font set for gui                                      ;;
(set-face-attribute                                      ;;
 'default nil :font "Monaco 15")                         ;;
(dolist (character '(han kana symbol cjk-misc bopomofo)) ;;
  (set-fontset-font (frame-parameter nil 'font)          ;;
                    character                                           ;;
                    (font-spec :family "魏碑-简" :size 15)))            ;;
;; (font-spec :family "Microsoft YaHei" :size 15))) ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(osx-clipboard-mode +1)
(global-set-key (kbd "M-v") 'clipboard-yank)

;; 未选择则注释当前行
(defun my-comment-or-uncomment-region (beg end &optional arg)
  (interactive (if (use-region-p)
                   (list (region-beginning) (region-end) nil)
                 (list (line-beginning-position)
                       (line-beginning-position 2))))
  (comment-or-uncomment-region beg end arg))


(global-set-key (kbd "C-c C-c") 'my-comment-or-uncomment-region)

;; speedbar
(require 'speedbar)
(global-set-key (kbd "<f9>") 'speedbar-get-focus)

(provide 'init-local)
;;; init-local ends here
