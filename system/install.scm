;;; SPDX-License-Identifier: GPL-3.0-or-later
;;; Copyright © 2019 Alex Griffin <a@ajgrf.com>
;;; Copyright © 2019 Pierre Neidhardt <mail@ambrevar.xyz>
;;; Copyright © 2022 Jonathan Brielmaier <jonathan.brielmaier@web.de>
;;; Copyright © 2023 Hatim Thayyil <hatim@thayyil.net>


(define-module (luna system install)
  #:use-module (gnu system)
  #:use-module (gnu system install)
  #:use-module (gnu packages vim)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages curl)
  #:export (installation-os-luna))

(define installation-os-luna
  (operating-system
    (inherit installation-os)
    (packages
      (append
        (list git neovim)
        (operating-system-packages installation-os)))))

installation-os-luna

