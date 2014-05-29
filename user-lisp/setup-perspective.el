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
 
(defun persp-cycle ()
  "Cycle throught the available perspectives."
  (interactive)
  (let ((next-pos (1+ (persp-curr-position)))
        (list-size (length (persp-all-names))))
  (cond ((eq 1 list-size) (persp-switch nil))
         ((>= next-pos list-size) (persp-switch (nth 0 (persp-all-names))))
         (t (persp-next)))))

(defun persp-kill-current ()
  "Kills the currently active perspective."
  (interactive)
  (persp-kill (nth (persp-curr-position) (persp-all-names))))

(global-set-key (kbd "<backtab>") 'persp-cycle)
(define-key persp-mode-map (kbd "C-x p q") 'persp-kill-current)
(define-key persp-mode-map (kbd "C-x p n") 'persp-switch)
(define-key persp-mode-map (kbd "C-x p e") 'custom-persp/emacs)
