(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(color-theme-selection "Clarity and Beauty" nil (color-theme_seldefcustom))
 '(column-number-mode t)
 '(dired-listing-switches "-lhgo")
 '(inhibit-startup-screen t)
 '(kill-whole-line t)
 '(nxml-slash-auto-complete-flag t)
 '(rng-schema-locating-files (quote ("/home/dlindelof/schemas/schemas.xml" "/share/emacs22/site-lisp/nxml-mode/schema/schemas.xml")))
 '(safe-local-variable-values (quote ((TeX-master . t))))
 '(set-mark-command-repeat-pop t)
 '(speedbar-use-images nil)
 '(x-select-enable-clipboard t))

(setq slime-default-lisp "clisp")

;; Muse configuration
;; (require 'muse-wiki)
;; (require 'muse-html)
;; (require 'muse-latex)
;; (require 'muse-docbook)
;; (setq muse-file-extension nil
;;       muse-mode-auto-p t)
;; (setq muse-project-alist
;;       '(("Notes" ("~/notes")
;;          )))


(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :family "Inconsolata")))))

(fset 'yes-or-no-p 'y-or-n-p)

;; Start server. Good for editing text areas from browser.
(server-start)

;; Show matching parens
(show-paren-mode 1)

;; Turn off blinking cursor
(blink-cursor-mode)

;; Turn on font-locking globally
(global-font-lock-mode t)

;; Use only spaces when inserting tabs
(setq-default indent-tabs-mode nil)

;; Enable color in shell mode
(ansi-color-for-comint-mode-on)

;; Leave a little bit more space when scrolling that default (2)
(setq-default next-screen-context-lines 10)

;; Enable doc-mode and link to asciidoc.el
(add-to-list 'load-path "~/emacs/asciidoc-el")
(autoload 'doc-mode "doc-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.adoc$" . doc-mode))
(add-hook 'doc-mode-hook
	  '(lambda ()
	     (turn-on-auto-fill)
	     (require 'asciidoc)))

;; Text-mode with auto-fill by default instead of Fundamental
(setq default-major-mode 'text-mode)
(add-hook 'text-mode-hook  'turn-on-auto-fill)

;; ipython.el requires python-mode, which is no longer shipped with Emacs 22
;; (has its own python-mode). So to make it work I must install python-mode,
;; add it to the search path, and load ipython.
;; (add-to-list 'load-path "/usr/share/emacs/site-lisp/python-mode/")
;; (autoload 'python-mode "ipython" "IPython mode." t)

;;; use groovy-mode when file ends in .groovy or has #!/bin/groovy at start
(autoload 'groovy-mode "groovy-mode" "Groovy editing mode." t)
(add-to-list 'load-path "~/emacs/groovy")
(add-to-list 'auto-mode-alist '("\.groovy$" . groovy-mode))
(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))

;; enable confluence mode for editing Nespresso wiki
;(add-to-list 'load-path "~/emacs/confluence-el")
;(load-library "quickstart-confluence")

;; Remove menu, tool-bar and scroll-bar
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))


;; Load most recent version of Tramp for proxy support
(add-to-list 'load-path "~/emacs/tramp/lisp/")
(require 'tramp)
(add-to-list 'Info-default-directory-list "~/emacs/tramp/info/")

;; Silent bell
(setq visible-bell t)

;; Turn RefTeX on (doesn't work, figure out someday why)
(setq reftex-plug-into-AUCTeX t)

;; XML files
(add-to-list 'auto-mode-alist '("\\.wsdl\\'" . nxml-mode))

;; ESS
(add-to-list 'auto-mode-alist '("\\.Rnw\\'" . Rnw-mode))
(add-to-list 'auto-mode-alist '("\\.Snw\\'" . Snw-mode))
(autoload 'Rnw-mode "ess-site" "ESS mode." t)
(autoload 'Snw-mode "ess-site" "ESS mode." t)

;; Matlab
(add-to-list 'auto-mode-alist '("\\.m\\'" . octave-mode))

;; Doc-mode
(add-to-list 'load-path "~/emacs/doc-mode")
(require 'doc-mode)

;; CWEB mode
(add-to-list 'load-path "~/emacs/cwebm")
(require 'cwebm)

;; Linking ESS with AucTex
(add-hook 'Rnw-mode-hook
          (lambda ()
            (add-to-list 'TeX-command-list
                         '("Sweave" "R CMD Sweave %s" 
                           TeX-run-command nil t :help "Run Sweave") t)
            (add-to-list 'TeX-command-list
                         '("LatexSweave" "%l \"%(mode)\\input{%s}\"" 
                           TeX-run-TeX nil t :help "Run Latex after Sweave") t)
            (setq TeX-command-default "Sweave")))

;; Pipe xml region to xmllint --format and bind to C-x C-k x
(fset 'xml-format
   [?\C-  C-down ?\M-| ?x ?m ?l ?l ?i ?n ?t ?  ?- ?- ?f ?o ?r ?m ?a ?t ?  ?- return])
(global-set-key "\C-x\C-kx" 'xml-format)

(defun insert-date ()
  "Insert the current date according to the variable \"insert-date-format\"."
  (interactive "*")
  (insert (format-time-string "%Y-%m-%d"
                              (current-time))))
(global-set-key [f5] 'insert-date)

;; Yank at point, not where the mouse is
(setq mouse-yank-at-point t)

;; Banish mouse on any keypress
(mouse-avoidance-mode 'jump)

;; Start shell
;; (shell)
;; (set-process-query-on-exit-flag
;;  (get-process "shell") nil)

;; Insert text copied from another application
(global-set-key [M-insert] 'clipboard-yank)

;; Setting for working with Nespresso machines
(add-to-list 'tramp-default-proxies-alist
             '("hqchrhel.*" "root" "/ssh:dlindelo@%h:"))
(add-to-list 'tramp-default-proxies-alist
             '("hqchnesoa02.*" "jira" "/ssh:dlindelof@%h:"))

;; Insert email signature
(defun insert-sig ()
  (interactive)
  (shell-command "fortune -s computers bofh-excuses debian definitions education linux linuxcookie paradoxum perl songs-poems wisdom work" t)
  (insert-file-contents "~/.sig")
)
(global-set-key [f7] 'insert-sig)

;; Longlines shortcut
(global-set-key [f8] 'longlines-mode)
(put 'upcase-region 'disabled nil)

;; Edit server for editing text areas with Chrome
(add-to-list 'load-path "~/emacs/edit-server-el")
(require 'edit-server)
(edit-server-start)
  