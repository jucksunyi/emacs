;;--------------窗口界面设置------------------
(set-foreground-color "grey")
(set-background-color "black")
(set-cursor-color "gold1")
(set-mouse-color "gold1")


;; 设置另外一些颜色：语法高亮显示的背景和主题，区域选择的背景和主题，二次选择的背景和选择
(set-face-foreground 'highlight "white")
(set-face-background 'highlight "blue")
(set-face-foreground 'region "cyan")
(set-face-background 'region "blue")
(set-face-foreground 'secondary-selection "skyblue")
(set-face-background 'secondary-selection "darkblue")

(setq scroll-margin 3 scroll-conservatively 10000)
;;防止页面滚动时跳动， scroll-margin 3
;;可以在靠近屏幕边沿3行时就开始滚动，可以很好的看到上下文。

;;------------窗口界面设置结束-----------------


;;;;;;made by sunyi



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; gerenal

;;; Options

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(display-time-mode t)
 '(gdb-non-stop-setting nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil))
;; cua-mode: C-x,C-v,C-c,C-z

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans" :foundry "PfEd" :slant normal :weight normal :height 160 :width normal)))))

;;; close startup message
(setq inhibit-startup-message -1)

;;; close tool bar and scroll bar
(tool-bar-mode -1)
(scroll-bar-mode -1)

;;; default major
(setq default-major-mode 'text-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;;; disable backup
(setq make-backup-files nil)

;;; close auto save
(setq auto-save-default -1)

;;; 括号匹配，高亮显示另外一边到括号
(setq show-paren-mode t)
(setq show-paren-style 'parenthesis)

;;; yes/no->y/n
(fset 'yes-or-no-p 'y-or-n-p)

;;; title
(setq frame-title-format "%f")

;;;disable version control
(setq vc-handled-backends nil)

;;; display column number
(global-linum-mode t)
(setq column-number-mode t)
(setq line-number-mode t)

;;; display time
(display-time-mode t)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)

;;; ido
(require 'ido)
(ido-mode t)

;;; ibuffer
(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;;; org mode
(require 'org-install)
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))

;;; windmove
(windmove-default-keybindings)

;;; winner mode 
(winner-mode t) ;C-x <left> and C-x <right> to switch buffer
(global-set-key (kbd "C-x <up>") 'winner-undo)
(global-set-key (kbd "C-x <down>") 'winner-redo)

;;; indent buffer
(defun indent-buffer ()
  "Indent current buffer."
  (interactive)
  (save-excursion
	(indent-region (point-min) (point-max) nil)))

(require 'package)
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("popkit" . "http://elpa.popkit.org/packages/"))
(package-initialize)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; makefile
(add-to-list 'auto-mode-alist '("\\.mak$" . makefile-gmake-mode))
(add-to-list 'auto-mode-alist '("\\.defs$" . makefile-gmake-mode))
(add-to-list 'auto-mode-alist '("\\.mk$" . makefile-gmake-mode))
(add-to-list 'auto-mode-alist '("[Mm]akefile\\." . makefile-gmake-mode))
(add-to-list 'auto-mode-alist '("\\onfig$" . conf-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; complete and check

;;; auto-complete-mode
(add-to-list 'load-path "~/.emacs.d/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/ac-dict")
(ac-config-default)

										;(setq ac-use-quick-help t)
										;(setq ac-quick-help-delay 1.0)
										;(setq ac-dwim t)

										;(setq ac-auto-start -1)
										;(ac-set-trigger-key "<C-return>")
										;(setq ac-trigger-commands
										;	  (cons 'backward-delete-char-untabify ac-trigger-commands))

;;; popul
										;(add-to-list 'load-path "~/.emacs.d/popul-el/")
										;(require 'popup)
										;(setq ac-quick-help-prefer-pos-tip t)

;;; fuzzy
										;(setq ac-fuzzy-enable t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; gtags-mode
(autoload 'gtags-mode "gtags" "" t)

(setq c-mode-hook
	  '(lambda ()
		 (gtags-mode 1)
		 ))
(global-set-key (kbd "M-g s") 'gtags-find-symbol)
(global-set-key (kbd "M-g f") 'gtags-find-file)
(global-set-key (kbd "M-g t") 'gtags-find-tag)
(global-set-key (kbd "M-g h") 'gtags-find-tag-from-here)
(global-set-key (kbd "M-g r") 'gtags-find-rtag)
(global-set-key (kbd "M-g p") 'gtags-pop-stack)
(global-set-key (kbd "M-g c") 'gtags-make-complete-list)
(global-set-key (kbd "M-g g") 'gtags-find-with-grep)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; kconfig mode
(defvar kconfig-mode-font-lock-keywords
  '(("^[\t, ]*\\_<bool\\_>" . font-lock-type-face)
    ("^[\t, ]*\\_<int\\_>" . font-lock-type-face)
    ("^[\t, ]*\\_<boolean\\_>" . font-lock-type-face)
    ("^[\t, ]*\\_<tristate\\_>" . font-lock-type-face)
    ("^[\t, ]*\\_<depends on\\_>" . font-lock-variable-name-face)
    ("^[\t, ]*\\_<select\\_>" . font-lock-variable-name-face)
    ("^[\t, ]*\\_<help\\_>" . font-lock-variable-name-face)
    ("^[\t, ]*\\_<---help---\\_>" . font-lock-variable-name-face)
    ("^[\t, ]*\\_<default\\_>" . font-lock-variable-name-face)
    ("^[\t, ]*\\_<range\\_>" . font-lock-variable-name-face)
    ("^\\_<config\\_>" . font-lock-constant-face)
    ("^\\_<comment\\_>" . font-lock-constant-face)
    ("^\\_<menu\\_>" . font-lock-constant-face)
    ("^\\_<endmenu\\_>" . font-lock-constant-face)
    ("^\\_<if\\_>" . font-lock-constant-face)
    ("^\\_<endif\\_>" . font-lock-constant-face)
    ("^\\_<menuconfig\\_>" . font-lock-constant-face)
    ("^\\_<source\\_>" . font-lock-keyword-face)
    ("\#.*" . font-lock-comment-face)
    ("\".*\"$" . font-lock-string-face)))

(define-derived-mode kconfig-mode text-mode
  "kconfig"
  (set (make-local-variable 'font-lock-defaults)
       '(kconfig-mode-font-lock-keywords t)))

(add-to-list 'auto-mode-alist '("Kconfig" . kconfig-mode))

;;; ido
(require 'ido)
(ido-mode t)

;;; ibuffer
(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)


;;; winner mode 
(winner-mode t) ;C-x <left> and C-x <right> to switch buffer
(global-set-key (kbd "C-x <up>") 'winner-undo)
(global-set-key (kbd "C-x <down>") 'winner-redo)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; custom shortcut keys

(global-set-key (kbd "C-'")   'set-mark-command) 
(global-set-key (kbd "C-x j") 'goto-line)
(global-set-key (kbd "M-p")   'backward-paragraph)
(global-set-key (kbd "M-n")   'forward-paragraph)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; hideshow
(add-hook 'c-mode-common-hook   'hs-minor-mode)
(add-hook 'c++-mode-hook        'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
(add-hook 'python-mode-hook     'hs-minor-mode)
(add-hook 'sh-mode-hook         'hs-minor-mode)
(add-hook 'asm-mode-hook        'hs-minor-mode)
(add-hook 'shell-script-mode-hook 'hs-minor-mode)
(add-hook 'rust-mode-hook       'hs-minor-mode)

(global-set-key (kbd "M-1")     'hs-toggle-hiding)
(global-set-key (kbd "M-2")     'hs-hide-all)
(global-set-key (kbd "M-3")     'hs-show-all)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; cc-mode
(global-cwarn-mode 1)

										;Actually, this statement is not just for cc-mode, it is global for all modes 
(setq-default tab-width 4
			  indent-tabs-mode t)

(setq-default  c-basic-offset 4)

(setq c-default-style
	  '((c-mode . "k&r") (other . "k&r")))

;; 自动模式，在此种模式下当你键入{时，会自动根据你设置的对齐风格对齐
(c-toggle-auto-newline)
;; 此模式下，当按Backspace时会删除最多的空格
(c-toggle-hungry-state)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; complete and check

;;; auto-complete-mode
(add-to-list 'load-path "~/.emacs.d/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/ac-dict")
(ac-config-default)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; complete and check

;;; auto-complete-mode
(add-to-list 'load-path "~/.emacs.d/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/ac-dict")
(ac-config-default)
