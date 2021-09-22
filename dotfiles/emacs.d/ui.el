;; ========================== General emacs settings ==========================
;; Maximize the emacs window on startup
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; Disable startup screen
(setq inhibit-startup-screen t)

;; Disable menu-bar, tool-bar, and scroll-bar.
(if (fboundp 'menu-bar-mode)
    (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode)
    (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode)
    (scroll-bar-mode -1))

;; Make *scratch* buffer blank
(setq initial-scratch-message "")

;; Make window title the buffer name
(setq-default frame-title-format '("%b"))

;; Show line numbers
(global-display-line-numbers-mode)

;; Make Emacs respect what is in your truncate-lines variables
(add-hook 'text-mode-hook #'auto-fill-mode)
(setq-default fill-column 80)
;; (setq truncate-partial-width-windows nil)

(use-package all-the-icons)

;; Adding WAITING, HOLD, CANCELLED as keywords
(setq org-todo-keywords
    (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
            (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)"))))

;;; Don't set dependency as DONE until it's children are also DONE
(setq-default org-enforce-todo-dependencies t)

(setq org-todo-keyword-faces
    (quote (("TODO" :foreground "red" :weight bold)
            ("NEXT" :foreground "blue" :weight bold)
            ("DONE" :foreground "forest green" :weight bold)
            ("WAITING" :foreground "orange" :weight bold)
            ("HOLD" :foreground "magenta" :weight bold)
            ("CANCELLED" :foreground "forest green" :weight bold)
            ("MEETING" :foreground "forest green" :weight bold)
            ("PHONE" :foreground "forest green" :weight bold))))

;; Don't export keywords
(setq-default org-export-with-todo-keywords nil)

;; org-superstar configuration
(use-package org-superstar
    :config
    (setq org-superstar-special-todo-items t)
    (add-hook 'org-mode-hook (lambda ()
                                (org-superstar-mode 1))))

(with-eval-after-load 'org-superstar
  (setq org-superstar-item-bullet-alist
        '((?* . ?•)
          (?+ . ?➤)
          (?- . ?•)))
  (setq org-superstar-headline-bullets-list '(?\s))
  (setq org-superstar-special-todo-items t)
  ;; Enable custom bullets for TODO items
  (setq org-superstar-todo-bullet-alist
        '(("TODO" . ?☐)
          ("NEXT" . ?✒)
          ("HOLD" . ?✰)
          ("WAITING" . ?☕)
          ("CANCELLED" . ?✘)
          ("DONE" . ?✔)))
  (org-superstar-restart))
(setq org-ellipsis " ▼ ")

;; I don't wan't the keywords in my exports
(setq-default org-export-with-todo-keywords nil)

;; Pywal colorschemes
(use-package ewal
  :init (setq ewal-use-built-in-always-p nil
              ewal-use-built-in-on-failure-p t
              ewal-json-file "~/.cache/wal/colors.json"))
