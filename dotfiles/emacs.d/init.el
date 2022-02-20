(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(eval-when-compile
  (require 'use-package))

(load-file "~/.emacs.d/custom.el")
(load-file "~/.emacs.d/edit.el")
(load-file "~/.emacs.d/evil.el")
(load-file "~/.emacs.d/git.el")
(load-file "~/.emacs.d/ide.el")
(load-file "~/.emacs.d/roam.el")
(load-file "~/.emacs.d/ui.el")

(require 'ox-org)
(setq org-export-backends '(ascii html latex odt beamer taskjuggler org))

(require 'ox-latex)
(add-to-list 'org-latex-classes
             '("beamer"
               "\\documentclass\[presentation\]\{beamer\}"
               ("\\section\{%s\}" . "\\section*\{%s\}")
               ("\\subsection\{%s\}" . "\\subsection*\{%s\}")
               ("\\subsubsection\{%s\}" . "\\subsubsection*\{%s\}")))

;; Org-Mode initial setup
(use-package org
  :bind
  (("C-c l" . org-store-link)
   ("C-c a" . org-agenda)
   ("C-c c" . org-capture)))

;; Allows to see which commands are being called:
;; - command-log-mode
;; - clm/open-command-log-buffer
(use-package command-log-mode)

(use-package rg
  :config (rg-enable-default-bindings))

(use-package undo-tree
  :init (global-undo-tree-mode))

;; Set default font
(set-face-attribute 'default nil
                    :family "Iosevka"
                    :height 150
                    :weight 'normal
                    :width 'normal)
(set-fontset-font "fontset-default" 'han (font-spec :family "WenQuanYi Zen Hei"))
;; (set-fontset-font "fontset-default" 'han (font-spec :family "WenQuanYi Zen Hei Mono"))

;; <ESC> cancels all
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Backup policy
(setq backup-directory-alist `(("." . "~/.saves")))
(setq version-control t     ;; Use version numbers for backups.
      kept-new-versions 5   ;; Number of newest versions to keep.
      kept-old-versions 0   ;; Number of oldest versions to keep.
      delete-old-versions t ;; Don't ask to delete excess backup versions.
      backup-by-copying t)  ;; Copy all files, don't rename them.
