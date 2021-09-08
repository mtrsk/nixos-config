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
