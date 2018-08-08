;; adding el path
(setq load-path
      (append
       (list
        (expand-file-name "~/.emacs.d/elisp/"))
              load-path))

;; repos.
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;;(add-to-list 'load-path "~/.emacs.d/")

(setq-default tab-width 2)
;; C-x = what-cursor-position
(setq default-input-method "MacOSX")
(set-language-environment "Japanese")
(setq default-buffer-file-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(set-buffer-file-coding-system 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)
(set-keyboard-coding-system 'utf-8-unix)

;; refrain auto split window
(setq split-height-threshold nil)

;; don't making temporary files
(setq make-backup-files nil)
(setq auto-save-default nil)

(global-font-lock-mode t)
(font-lock-mode t)
(transient-mark-mode t)

(global-set-key (kbd "<backtab>") 'indent-region)
(global-set-key (kbd "C-c TAB") 'align-entire)
(global-set-key (kbd "C-x <backtab>") 'untabify)
(global-set-key (kbd "C-x TAB") 'tabify)

(global-set-key (kbd "<f12>") 'next-error)
(global-set-key (kbd "ESC <f12>") 'previous-error)

(global-set-key [\C-f12] 'next-error)
(global-set-key [\M-f12] 'previous-error)

(global-set-key (kbd "C-c C-j") 'point-to-register)
(global-set-key (kbd "C-x j") 'jump-to-register)

(global-set-key (kbd "C-c w") 'copy-to-register)
(global-set-key (kbd "C-c y") 'insert-register)

(global-set-key (kbd "C-x M-=") 'count-lines-region)
;;(global-set-key (kbd "C-x =") 'what-cursor-position)

;; revive.el
(autoload 'save-current-configuration "revive" "Save status" t)
(autoload 'resume "revive" "Resume Emacs" t)
(autoload 'wipe "revive" "Wipe emacs" t)

(global-set-key (kbd "ESC <right>")  'win-next-window)
(global-set-key (kbd "ESC <left>") 'win-prev-window)
(global-set-key (kbd "ESC <up>") 'win-switch-menu)
(global-set-key (kbd "ESC <down>") 'win-toggle-window)

(global-set-key [\M-right] 'win-next-window)
(global-set-key [\M-left] 'win-prev-window)
(global-set-key [\M-up] 'win-switch-menu)
(global-set-key [\M-down] 'win-toggle-window)

(global-set-key [right] 'win-next-window)
(global-set-key [left] 'win-prev-window)
(global-set-key [up] 'win-switch-menu)
(global-set-key [down] 'win-toggle-window)

;; (defconst *dmacro-key* [?\M-o] "繰返し指定キー")
(defconst *dmacro-key* "\C-\\" "繰返し指定キー")
(global-set-key *dmacro-key* 'dmacro-exec)
(autoload 'dmacro-exec "dmacro" nil t)

(cond (
       (string-match "^24\." emacs-version)
       ;; nxml : need compile(elc)
       ;; (load "~/.emacs.d/nxml-mode-20041004/rng-auto.el")
       ;; (setq auto-mode-alist
       ;;       (cons '("\\.\\(xml\\|xsl\\|rng\\|xhtml\\)\\'" . nxml-mode)
       ;; 	    auto-mode-alist))
       ;; (unify-8859-on-decoding-mode)
       ;; anything
       (require 'anything-config)
       (setq anything-sources (list anything-c-source-buffers
				    anything-c-source-bookmarks
				    anything-c-source-recentf
				    anything-c-source-file-name-history
				    anything-c-source-locate))
       (define-key anything-map (kbd "C-p") 'anything-previous-line)
       (define-key anything-map (kbd "C-n") 'anything-next-line)
       (define-key anything-map (kbd "C-v") 'anything-next-source)
       (define-key anything-map (kbd "M-v") 'anything-previous-source)
       (global-set-key (kbd "C-;") 'anything)
       (global-set-key (kbd "C-c ;") 'anything)
       )
)

;; gtags
(add-hook 'gtags-mode-hook
	  '(lambda ()
	     (local-set-key (kbd "C-.")   'gtags-find-tag)
	     (local-set-key (kbd "C-c .") 'gtags-find-tag)
	     (local-set-key (kbd "C-,")   'gtags-find-rtag)
	     (local-set-key (kbd "C-c ,") 'gtags-find-rtag)
	     (local-set-key (kbd "C->")   'gtags-find-symbol)
	     (local-set-key (kbd "C-c >") 'gtags-find-symbol)
	     (local-set-key (kbd "C-<")   'gtags-pop-stack)
	     (local-set-key (kbd "C-c <") 'gtags-pop-stack)
	     )
	  )

;; ;; js
;; (add-to-list 'load-path "~/.emacs.d/js2")
;; (autoload 'js2-mode "js2" nil t)
;; (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
;; javascript.el
;; javascript-mode
(add-to-list 'auto-mode-alist (cons  "\\.\\(js\\|as\\|json\\|jsn\\)\\'" 'javascript-mode))
(autoload 'javascript-mode "javascript" nil t)
(setq js-indent-level 2)

;; paren match
(defun paren-match (arg)
  "Go to the matching parenthesis."
  (interactive "p")
  (cond ((looking-at "[[({]")
         (forward-sexp 1)
         (backward-char)
         )
        ((looking-at "[])}]")
         (forward-char)
         (backward-sexp 1)
         )
        (t (self-insert-command arg))
        ))
(global-set-key "\C-]" 'paren-match)
;; invert repository files from grep result
(defun invert-repo-files ()
  "invert .svn/ .git/ files."
  (interactive)
  (replace-regexp "^.*\.svn/.*\n"  "")
  (beginning-of-buffer)
  (replace-regexp "^.*\.git/.*\n"  "")
)
(global-set-key "\C-cv" 'invert-repo-files)
;; truncate line
(defun toggle-truncate-lines ()
  "toggle truncate lines"
  (interactive)
  (if truncate-lines
      (setq truncate-lines nil)
    (setq truncate-lines t))
  (recenter))
(global-set-key "\C-cl" 'toggle-truncate-lines)
;; case-fold
(defun toggle-case-fold-search ()
  "toggle case-fold-search"
  (interactive)
  (if case-fold-search
      (setq case-fold-search nil)
    (setq case-fold-search t))
  (recenter))
(global-set-key "\C-cs" 'toggle-case-fold-search)

(defun grepr()
  "Run grepr"
  (interactive)
  (grep (read-string (format "[%s]$ " (replace-regexp-in-string "^[^ ]+ " "" (pwd))) "grep -n -I -s -r . -e ") )
)
(global-set-key (kbd "C-c g") 'grepr)
(defun grepf()
  "Run grepf"
  (interactive)
  (grep (read-string (format "[%s]$ " (replace-regexp-in-string "^[^ ]+ " "" (pwd))) (format "grep -n -I -s %s -e " (buffer-file-name) )))
)
(global-set-key (kbd "C-x g") 'grepf)


;; speedber
(global-set-key [f4] 'speedbar-get-focus)

;; ;; php
(require 'php-mode)

(setq php-mode-force-pear t) ;PEAR規約のインデント設定にする
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode)) ;*.phpのファイルのときにphp-modeを自動起動する

;; ;; apache
(autoload 'apache-mode "apache-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.htaccess\\'"   . apache-mode))
(add-to-list 'auto-mode-alist '("httpd\\.conf\\'"  . apache-mode))
(add-to-list 'auto-mode-alist '("srm\\.conf\\'"    . apache-mode))
(add-to-list 'auto-mode-alist '("access\\.conf\\'" . apache-mode))
(add-to-list 'auto-mode-alist '("sites-\\(available\\|enabled\\)/" . apache-mode))

;; autoinsert
(setq user-fll-name "Mikami Takaaki")
(setq user-mail-address "c.mikamichel@gmail.com")
(add-hook 'before-save-hook 'time-stamp)

(setq  auto-insert-directory "~/.emacs.d/ai-template/" )
(load "autoinsert" t)
(setq auto-insert-alist
      (append '(("\\.sh$"  . ["template.sh"   ai-replace])
                ("pom\\.xml$"  . ["template.pom.xml"   ai-replace])
                ("\\.xml$" . ["template.xml"  ai-replace])
                ("\\.html$". ["template.html" ai-replace])
                ("\\.pl$"  . ["template.pl"   ai-replace])
                ("\\.py$"  . ["template.py"   ai-replace])
                ("\\.rb$"  . ["template.rb"   ai-replace])
                ("\\.hs$"  . ["template.hs"   ai-replace])
                ("\\.php$" . ["template.php"   ai-replace])
                ("\\.js$"  . ["template.js"   ai-replace])
                ("_controller\\.php$" . ["cake_controller.php"   ai-replace])
                ("[Mm]akefile" . ["Makefile" ai-replace]))
	      auto-insert-alist ))
(add-hook 'find-file-hooks 'auto-insert)

(defvar ai-replace-alists
  '(("%file%" . (lambda()(file-name-nondirectory (buffer-file-name))))
    ("%base%" . (lambda()(replace-regexp-in-string "\\..+$" "" (file-name-nondirectory (buffer-file-name)))))
    ("%cap%" . (lambda()(capitalize (replace-regexp-in-string "\\..+$" "" (file-name-nondirectory (buffer-file-name))))))
    ("%def%" . (lambda()(upcase (replace-regexp-in-string "\\." "_" (file-name-nondirectory (buffer-file-name))))))
    ("%name%" . user-full-name)
    ("%mail%" . (lambda()(identity user-mail-address)))
    ("%cyear%" . (lambda()(substring (current-time-string) -4)))
    ("%cdate%" . (lambda()(format-time-string "%Y/%m/%d")))))

(defun ai-replace ()
p  (time-stamp)
  (mapc #'(lambda(c)
	    (progn
	      (goto-char (point-min))
	      (replace-string (car c) (funcall (cdr c)) nil)))
	ai-replace-alists)
  (goto-char (point-max))
  (message "done."))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
	 (quote
		(session flycheck projectile php-eldoc magit-find-file psysh json-mode js2-mode twig-mode popwin browse-kill-ring apache-mode php-mode magit))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
