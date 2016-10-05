
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")
(cask-initialize)

(when (window-system)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (set-frame-size (selected-frame) 155 38))

;; fix CMD is META, and ALT is ALT!
;; https://www.emacswiki.org/emacs/MetaKeyProblems
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

(set-frame-font "Source Code Pro for Powerline-13")

(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

(defvar my-keys-minor-mode-map (make-keymap) "my keys")

(define-key my-keys-minor-mode-map (kbd "M-j") 'next-line)
(define-key my-keys-minor-mode-map (kbd "M-k") 'previous-line)
(define-key my-keys-minor-mode-map (kbd "M-h") 'backward-char)
(define-key my-keys-minor-mode-map (kbd "M-l") 'forward-char)

(define-key my-keys-minor-mode-map (kbd "C-=") 'er/expand-region)

(define-key my-keys-minor-mode-map (kbd "C-c SPC") 'ace-jump-mode)

(global-visual-line-mode t)

(delete-selection-mode t)
(blink-cursor-mode t)
(show-paren-mode t)

(setq make-backup-file nil)
(setq auto-save-default nil)
(setq inhibit-startup-message t)
(setq-default tab-with 2)
(setq-default indent-tabs-mode nil)
(fset 'yes-or-no-p 'y-or-n-p)

(projectile-global-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Possible pain points ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 1-Save cursor position for file
(require 'saveplace)
(setq save-place-file (concat user-emacs-directory "saveplace.el"))
(setq-default save-place t)

;; 2-Autoindent
(electric-indent-mode t)

;; 3-Autocomplete
(require 'auto-complete-config)
(ac-config-default)

;; 4-Select current line
(defun select-current-line ()
  "Selects the current line"
  (interactive)
  (end-of-line)
  (push-mark (line-beginning-position) nil t))

(define-key my-keys-minor-mode-map (kbd "M-l") 'select-current-line)

;; 5-Newline above (SHIFT-o in VIM)
(defun line-above ()
  "Create a new line above, like SHIFT-o in VIM"
  (interactive)
  (move-beginning-of-line nil)
  (newline-and-indent)
  (forward-line -1)
  (indent-according-to-mode))

(define-key my-keys-minor-mode-map (kbd "M-RET") 'line-above)

;; 6-Cut entire lines
(defun cut-line-or-region ()
  "Cut a line or region if there is a selection"
  (interactive)
  (if (region-active-p)
      (kill-region (region-beginning) (region-end))
    (kill-region (line-beginning-position) (line-beginning-position 2))))

(global-set-key [remap kill-region] 'cut-line-or-region)

;; 7-Copy entire lines
(defun copy-line-or-region ()
  "Copy a line or region if there is a selection"
  (interactive)
  (if (region-active-p)
      (kill-ring-safe (region-beginning) (region-end))
    (kill-ring-safe (line-beginning-position) (line-beginning-position 2))))

(global-set-key [remap kill-ring-safe] 'copy-line-or-region)

;; 8-Duplicate lines
;; taken from http://rejeep.github.io/emacs/elisp/2010/03/11/duplicate-current-line-or-region-in-emacs.html
(defun duplicate-current-line-or-region (arg)
  "Duplicates the current line or region ARG times.
If there's no region, the current line will be duplicated. However, if
there's a region, all lines that region covers will be duplicated."
  (interactive "p")
  (let (beg end (origin (point)))
    (if (and mark-active (> (point) (mark)))
        (exchange-point-and-mark))
    (setq beg (line-beginning-position))
    (if mark-active
        (exchange-point-and-mark))
    (setq end (line-end-position))
    (let ((region (buffer-substring-no-properties beg end)))
      (dotimes (i arg)
        (goto-char end)
        (newline)
        (insert region)
        (setq end (point)))
      (goto-char (+ origin (* (length region) arg) arg)))))

(define-key my-keys-minor-mode-map (kbd "C-c d") 'duplicate-current-line-or-region)

;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;

;; How to create a Minor Mode
(define-minor-mode my-keys-minor-mode
  "An example of how to create a Minor Mode"
  t " my-keys" 'my-keys-minor-mode-map)

;; Activate the Minor Mode
(my-keys-minor-mode t)

;; color-theme-sanityinc-tomorrow related
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-tomorrow-eighties)))
 '(custom-safe-themes
   (quote
    ("628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
