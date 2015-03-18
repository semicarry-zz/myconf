;; golang mode
;; (setenv "GOPATH"
;;(shell-command-to-string "$SHELL --login -i -c 'printf %s $GOPATH'"))

(speedbar-add-supported-extension ".go")
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH")
  (exec-path-from-shell-copy-env "GOROOT")
  )

;;eldoc
(add-hook 'go-mode-hook 'go-eldoc-setup)
(set-face-attribute 'eldoc-highlight-function-argument nil
                    :underline t :foreground "green"
                    :weight 'bold)

;;go-autocomplete
(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)

;; go-flymak
;;(add-to-list 'load-path "/Users/semicarry/Development/go/src/github.com/dougm/goflymake")
;;(require 'go-flymake)

;; go-flycheck
;;(add-to-list 'load-path "/Users/semicarry/Development/go/src/github.com/dougm/goflymake")
;;(require 'go-flycheck)

(provide 'init-go)
