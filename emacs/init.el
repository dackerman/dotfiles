;; Emacs configuration
;; Note: You must have these packages installed on your system before everything
;; will work for you.
;;
;; sudo apt-get install mercurial livetex

(add-to-list 'load-path "~/code/dotfiles/emacs/lisp")
(add-to-list 'load-path "~/code/dotfiles/emacs/")

;; -----------------------------------------------------------------------------
;; Package initialization ------------------------------------------------------
;; -----------------------------------------------------------------------------
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(require 'el-get)
(setq el-get-sources '(
  (:name egg)
  (:name markdown-mode)
  (:name js2-mode)
  (:name python)
  (:name python-mode)
  (:name ropemacs)
  (:name virtualenv)
  (:name yaml-mode)
  (:name rainbow-delimiters)
  (:name slime)
  (:name paredit)
  (:name haskell-mode)
  (:name yasnippet
	 :type git
	 :url "https://github.com/capitaomorte/yasnippet.git"
	 :features "yasnippet")))
(setq emacs-packages (mapcar 'el-get-source-name el-get-sources))
(el-get 'sync emacs-packages)

;; -----------------------------------------------------------------------------
;; Display tweaks --------------------------------------------------------------
;; -----------------------------------------------------------------------------
(menu-bar-mode -1)
(setq inhibit-startup-screen t)
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

;; Tramp for sudo access -------------------------------------------------------
(require 'tramp)
(setq tramp-default-method "ssh")

;; -----------------------------------------------------------------------------
;; ido-mode --------------------------------------------------------------------
;; -----------------------------------------------------------------------------
(require 'ido)
(ido-mode t)
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-max-prospects 10
      ido-default-file-method 'selected-window)

(icomplete-mode +1)

(require 'paredit)

(defun dack-pick-side-window ()
  (interactive)
  (set-window-buffer (nth 1 (window-list)) (current-buffer)))

;; -----------------------------------------------------------------------------
;; irc -------------------------------------------------------------------------
;; -----------------------------------------------------------------------------
(require 'erc)
(setq erc-autojoin-channels-alist 
      '(("freenode.net" "#emacs" "#python" "#django" "#rails")))

(defun dack-irc ()
  "Start an irc client using the default channels list in erc-autojoin-channels-alist."
  (interactive)
  (erc :server "irc.freenode.net" :port 6667 :nick "david72486"))

;; -----------------------------------------------------------------------------
;; Misc custom key bindings ----------------------------------------------------
;; -----------------------------------------------------------------------------
(global-set-key (kbd "C-x C-m") 'execute-extended-command)

;; -----------------------------------------------------------------------------
;; My misc functions -----------------------------------------------------------
;; -----------------------------------------------------------------------------
(defun dack-dashes-to-end () 
  (interactive)
  (insert-char ?- (- 80 (current-column))))

(defun dack-backward-kill-to-space ()
  (interactive)
  (isearch-backward " "))

(defun dack-back-window ()
  (interactive)
  (other-window -1))

(global-set-key (kbd "C-o") 'other-window)
(global-set-key (kbd "M-o") 'dack-back-window)
(global-set-key (kbd "C-c C-\-") 'dack-dashes-to-end)

;; -----------------------------------------------------------------------------
;; Custom set variables - don't touch ------------------------------------------
;; -----------------------------------------------------------------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(browse-url-browser-function (quote browse-url-default-browser))
 '(case-fold-search t)
 '(column-number-mode t)
 '(current-language-environment "English")
 '(custom-safe-themes (quote ("4bc973a713266f486056811f64a309b429b7d95c37e93df0003d31bead3b8fbe" default)))
 '(custom-theme-directory "~/.emacs.d/themes")
 '(erc-autojoin-mode t)
 '(erc-button-mode t)
 '(erc-fill-mode t)
 '(erc-input-line-position -1)
 '(erc-irccontrols-mode t)
 '(erc-list-mode t)
 '(erc-match-mode t)
 '(erc-menu-mode t)
 '(erc-move-to-prompt-mode t)
 '(erc-netsplit-mode t)
 '(erc-networks-mode t)
 '(erc-noncommands-mode t)
 '(erc-pcomplete-mode t)
 '(erc-readonly-mode t)
 '(erc-ring-mode t)
 '(erc-stamp-mode t)
 '(erc-track-minor-mode t)
 '(erc-track-mode t)
 '(fringe-mode 0 nil (fringe))
 '(global-font-lock-mode t nil (font-lock))
 '(global-rainbow-delimiters-mode t)
 '(ido-confirm-unique-completion t)
 '(ido-enable-flex-matching t)
 '(rainbow-delimiters-highlight-braces-p t)
 '(rainbow-delimiters-highlight-parens-p t)
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil nil (tool-bar))
 '(transient-mark-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:stipple nil :background "#3f3f3f" :foreground "#dcdccc" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 100 :width normal :foundry "unknown" :family "DejaVu Sans Mono"))))
 '(hl-line ((t (:inherit default :background "gray27")))))
