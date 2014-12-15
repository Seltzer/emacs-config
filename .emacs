;; Fix tabs
(setq tab-width 4)

(custom-set-variables
 '(tab-stop-list (quote (4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120))))


;; Steve Yegge's JS2 mode
(setq load-path (append (list (expand-file-name "~/.emacs.d/js2")) load-path))
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))


;; Web Mode
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
  "Kill emacs buffers which I don't need"

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









