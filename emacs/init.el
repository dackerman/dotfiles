;; Emacs configuration

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(case-fold-search t)
 '(column-number-mode t)
 '(current-language-environment "English")
 '(fringe-mode 0 nil (fringe))
 '(global-font-lock-mode t nil (font-lock))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil nil (tool-bar))
 '(transient-mark-mode t)
 '(ido-confirm-unique-completion t)
 '(ido-enable-flex-matching t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-to-list 'load-path "~/code/dotfiles/emacs/lisp")
(add-to-list 'load-path "~/code/dotfiles/emacs/themes")

(require 'rainbow-delimiters)

(global-set-key (kbd "C-x C-m") 'execute-extended-command)

(setq inhibit-startup-screen t)

(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

(load-theme 'zenburn t)

;; tramp, for sudo access
(require 'tramp)
;; keep in mind known issues with zsh - see emacs wiki
(setq tramp-default-method "ssh")

;; ido-mode --------------------------------------------------------------------
(require 'ido)
(ido-mode t)
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-max-prospects 10
      ido-default-file-method 'selected-window)

;; auto-completion in minibuffer
(icomplete-mode +1)
