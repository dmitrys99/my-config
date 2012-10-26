(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

; Выбор цветовой схемы
(require 'color-theme)
;(color-theme-initialize)
(load-file "~/.emacs.d/elpa/color-theme-twilight-0.1/color-theme-twilight.el")
(color-theme-twilight)

(put 'upcase-region 'disabled nil)
(load-file "~/.emacs.d/org-settings.el")
