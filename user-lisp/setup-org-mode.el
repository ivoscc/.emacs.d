(setq org-startup-folded nil)
(setq org-src-fontify-natively t)
(setq org-log-done t)
(setq org-hide-leading-stars t)
(setq org-odd-levels-only t)

(setq org-directory "~/.org")
(setq org-agenda-files '("~/.org"))

;; Capture setup
(setq org-default-notes-file (concat org-directory "/notes.org"))
(define-key global-map "\C-cc" 'org-capture)
(define-key global-map "\C-ct"
        (lambda () (interactive) (org-capture nil "t")))
(define-key global-map "\C-cj"
        (lambda () (interactive) (org-capture nil "j")))
(define-key global-map "\C-cn"
        (lambda () (interactive) (org-capture nil "n")))

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline (concat org-directory "/todos.org") "Tasks")
             "* TODO %?\n  %i\n  %a")
        ("j" "Journal" entry (file+datetree (concat org-directory "/journal.org"))
             "* %?\nEntered on %U\n  %i\n  %a")
        ("n" "Notes" entry (file+datetree (concat org-directory "/notes.org"))
             "* %?\nEntered on %U\n  %i\n  %a")))

;; for reveal.js exporting
(setq org-reveal-root "http://cdn.jsdelivr.net/reveal.js/2.5.0/")

(provide 'setup-org-mode)
