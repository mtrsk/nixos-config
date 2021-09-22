(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(eval-when-compile
  (require 'use-package))

(load-file "~/.emacs.d/custom.el")
(load-file "~/.emacs.d/edit.el")
(load-file "~/.emacs.d/evil.el")
(load-file "~/.emacs.d/git.el")
(load-file "~/.emacs.d/ide.el")
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

(use-package direnv
 :config
 (direnv-mode))

;; Allows to see which commands are being called:
;; - command-log-mode
;; - clm/open-command-log-buffer
(use-package command-log-mode)

(use-package es-mode
  :init (add-to-list 'auto-mode-alist '("\\.es$" . es-mode))
  :hook ((es-result-mode . hs-minor-mode)))

(use-package elpy
  :commands elpy-enable
  ;; Only call `elpy-enable` when needed.
  ;; See: https://emacs.stackexchange.com/q/10065/22105
  :init (with-eval-after-load 'python (elpy-enable))
  :config
  (setq elpy-rpc-virtualenv-path 'current)
  ;; by default, elpy uses flymake. This forces it to use flycheck instead
  ;; See:
  ;;     - https://github.com/jorgenschaefer/elpy/wiki/Customizations#use-flycheck-instead-of-flymake
  ;;     - https://github.com/jorgenschaefer/elpy/issues/137
  (when (require 'flycheck nil t)
    (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
    (add-hook 'elpy-mode-hook 'flycheck-mode)))

(use-package org-roam
      :ensure t
      :custom
      (org-roam-directory (file-truename "~/Notes"))
      :bind (("C-c n l" . org-roam-buffer-toggle)
             ("C-c n f" . org-roam-node-find)
             ("C-c n g" . org-roam-graph)
             ("C-c n i" . org-roam-node-insert)
             ("C-c n c" . org-roam-capture)
             ;; Dailies
             ("C-c n j" . org-roam-dailies-capture-today))
      :config
      (org-roam-setup))

(use-package rg
  :config (rg-enable-default-bindings))


(use-package vimrc-mode
  :init (add-to-list 'auto-mode-alist '("\\.vim\\(rc\\)?\\'" . vimrc-mode)))

(use-package undo-tree
  :init (global-undo-tree-mode))

;; Set default font
(set-face-attribute 'default nil
                    :family "Hack"
                    :height 150
                    :weight 'normal
                    :width 'normal)

;; <ESC> cancels all
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Backup policy
(setq backup-directory-alist `(("." . "~/.saves")))
(setq version-control t     ;; Use version numbers for backups.
      kept-new-versions 5   ;; Number of newest versions to keep.
      kept-old-versions 0   ;; Number of oldest versions to keep.
      delete-old-versions t ;; Don't ask to delete excess backup versions.
      backup-by-copying t)  ;; Copy all files, don't rename them.
