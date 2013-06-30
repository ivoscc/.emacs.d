;; Setup packages
(require 'package)

;; Add repos
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("marmalade" . "http://marmalade-repo.org/packages/")
        ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-initialize)

;; Regenerate package list
(unless package-archive-contents
  (package-refresh-contents))

(defun install-packages (package-list)
  "Installs packages from list if not already installed."
  (dolist (some-package package-list)
    (when (not (package-installed-p some-package))
      (package-install some-package)))
  (delete-other-windows))

(provide 'setup-package)
