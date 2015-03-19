;;; package --- golang
;;; Commentary:
;;; Code:

(require 'speedbar)
(speedbar-add-supported-extension ".go")
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH")
  (exec-path-from-shell-copy-env "GOROOT")
  )

;;eldoc
(require 'go-eldoc) ;; Don't need to require, if you install by package.el
(add-hook 'go-mode-hook 'go-eldoc-setup)
(set-face-attribute 'eldoc-highlight-function-argument nil
                    :underline t :foreground "green"
                    :weight 'bold)

;;go-autocomplete
(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)

                                        ; Go Oracle
(load-file "$GOPATH/src/code.google.com/p/go.tools/cmd/oracle/oracle.el")

(defun my-go-mode-hook ()
                                        ; Use goimports instead of go-fmt
  (setq gofmt-command "goimports")
                                        ; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)
                                        ; Customize compile command to run go build
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go build -v && go test -v && go vet")))
                                        ; Go Oracle
(go-oracle-mode)
(add-hook 'go-mode-hook 'my-go-mode-hook)

(provide 'init-go)
;;; init-go ends here
