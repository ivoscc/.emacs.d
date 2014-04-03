(setq helm-ls-git-show-abs-or-relative 'relative
      helm-ff-transformer-show-only-basename nil)

(global-set-key (kbd "M-p") 'helm-ls-git-ls)
(global-set-key (kbd "<f2>") 'helm-buffers-list)
(provide 'setup-helm)
