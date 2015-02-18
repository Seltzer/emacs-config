;; Injected stuff at the top
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-layout-window-sizes (quote (("left14" (ecb-directories-buffer-name 0.22682926829268293 . 0.6885245901639344) (ecb-history-buffer-name 0.22682926829268293 . 0.2459016393442623)))))
 '(ecb-options-version "2.40")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--C-mouse-1))
 '(tab-stop-list (quote (4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; Fix tabs
(setq tab-width 4)


;; Set general environment variables

;;   General load path
(add-to-list 'load-path "~/.emacs.d/")

;;   Set CYGWIN path - INJECT
(when (string-equal system-type "windows-nt")
(progn
  (setq cygwin-bin "c:\\cygwin64\\bin")
  (setenv "PATH" (concat cygwin-bin ";"))
  (setq exec-path
	'(cygwin-bin)))) 


;; Load Projectile
(add-to-list 'load-path "~/.emacs.d/projectile/")

(require 'projectile)
(projectile-global-mode)


;; Load/configure ECB
(add-to-list 'load-path (expand-file-name "~/.emacs.d/site-lisp/alexott-ecb/"))
(require 'ecb)

(setq stack-trace-on-error nil) ;; don’t popup Backtrace window
(setq ecb-tip-of-the-day nil)
(setq ecb-auto-activate t)
(setq ecb-layout-name "left6")
(setq ecb-options-version "2.40")
(setq ecb-source-path (quote ("~/")))


;; Configure semantic
(require 'semantic/sb)
(semantic-mode 1)



;; Load/configure Steve Yegge's JS2 mode
(setq load-path (append (list (expand-file-name "~/.emacs.d/js2")) load-path))
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))


;; Load/configure python-mode
(setq load-path (append (list (expand-file-name "~/.emacs.d/python-mode")) load-path))
(autoload 'python-mode "python-mode" "Python Mode." t)

(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))


;; Load/configure lua-mode
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))


;; Load/configure web-mode
(setq load-path (append (list (expand-file-name "~/.emacs.d/web-mode")) load-path))

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))


;; Define convenience functions
(defun open-files (files)
  (while files
    (find-file (car files))
    (setq files (cdr files))))

(defun kill-crap ()
  "Kill emacs buffers which I do not need"

  (interactive)

  (setq buffers '("*GNU Emacs*" "*Messages*"))

  (setq l buffers)
  (while l
    (setq b (car l))
    (if (get-buffer b)
	(kill-buffer b)
      (message ""))

    (setq l (cdr l))))


(defun open-files-and-select-first (files)
  (setq first (car (last (split-string (car files) "[/\\]"))))

  (open-files files)
  (switch-to-buffer first))


(defun load-files (files)
  (kill-crap)
  (open-files-and-select-first files))


(defun yank-n (n)
  "Yank n times"

  (interactive "nEnter n: ")
  (dotimes 'n (yank)))







