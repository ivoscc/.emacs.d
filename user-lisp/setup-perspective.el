(require 'perspective)
(persp-mode)

;; Most of this conf file taken from Magnar Sveen and this post:
;; http://www.wickeddutch.com/2014/01/03/gaining-some-perspective-in-emacs/

(defun custom-persp-last ()
  (interactive)
  (persp-switch (persp-name persp-last)))

(defmacro custom-persp (name &rest body)
  `(let ((initialize (not (gethash ,name perspectives-hash)))
         (current-perspective persp-curr))
     (persp-switch ,name)
     (when initialize ,@body)
     (setq persp-last current-perspective)))

(defun custom-persp/emacs ()
  (interactive)
  (custom-persp "emacs"
                (find-file "~/.emacs.d/init.el")))
 
(global-set-key (kbd "<backtab>") 'custom-persp-last)
(define-key persp-mode-map (kbd "C-x p e") 'custom-persp/emacs)

