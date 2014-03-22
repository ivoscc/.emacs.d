(require 'go-mode-load)

;; require goimports to be installed 
;; go get code.google.com/p/go.tools/cmd/goimports
(setq gofmt-command "goimports")
(add-hook 'before-save-hook 'gofmt-before-save)

(require 'auto-complete)
(require 'go-autocomplete)
