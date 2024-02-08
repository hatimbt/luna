;;; SPDX-License-Identifier: GPL-3.0-or-later
;;; Copyright © 2019 Alex Griffin <a@ajgrf.com>
;;; Copyright © 2019 Pierre Neidhardt <mail@ambrevar.xyz>
;;; Copyright © 2022 Jonathan Brielmaier <jonathan.brielmaier@web.de>
;;; Copyright © 2023 Hatim Thayyil <hatim@thayyil.net>


(define-module (lunar install)
  #:use-module (gnu system)
  #:use-module (gnu system install)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages vim)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages package-management)
  #:use-module (nongnu packages linux)
  #:export (installation-os-nonfree))

(define installation-os-nonfree
  (operating-system
    (inherit installation-os)

	;; Full linux kernel.
	(kernel linux)
	(firmware (list linux-firmware))

	;; Packages usefull in the live installer.
    (packages
      (append
        (list git stow neovim)
        (operating-system-packages installation-os)))))

installation-os-nonfree
