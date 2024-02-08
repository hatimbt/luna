(define-module (luna packages secrets)
  #:use-module (guix utils)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system cargo)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages crates-io))

(define-public rbw-latest
  (package
    (name "rbw")
    (version "1.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rbw" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0mzmzr06rx9yc4ll99l6lbz48ix57awfrgq4q1p26a17rd7x5qxw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'configure 'relax-requirements
           (lambda _
             (substitute*
                 "guix-vendor/rust-password-hash-0.3.2.tar.gz/Cargo.toml"
               (("version = \">=1, <1.1.0\"") "version = \">=1\""))
             (substitute*
                 "guix-vendor/rust-rsa-0.5.0.tar.gz/Cargo.toml"
               (("version = \">=1, <1.5\"") "version = \"^1\""))
             (substitute*
                 "Cargo.toml"
                 (("version = \"1.4\"") "version = \"^1\"")))))
       #:cargo-inputs
       (("rust-aes" ,rust-aes-0.7)
        ("rust-anyhow" ,rust-anyhow-1)
        ("rust-arrayvec" ,rust-arrayvec-0.7)
        ("rust-async-trait" ,rust-async-trait-0.1)
        ("rust-base32" ,rust-base32-0.4)
        ("rust-base64" ,rust-base64-0.13)
        ("rust-block-modes" ,rust-block-modes-0.8)
        ("rust-block-padding" ,rust-block-padding-0.2.1)
        ("rust-daemonize" ,rust-daemonize-0.4)
        ("rust-directories" ,rust-directories-4)
        ("rust-env-logger" ,rust-env-logger-0.9)
        ("rust-hkdf" ,rust-hkdf-0.11)
        ("rust-hmac" ,rust-hmac-0.11)
        ("rust-humantime" ,rust-humantime-2)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-log" ,rust-log-0.4)
        ("rust-nix" ,rust-nix-0.23)
        ("rust-paw" ,rust-paw-1)
        ("rust-pbkdf2" ,rust-pbkdf2-0.9)
        ("rust-percent-encoding" ,rust-percent-encoding-2)
        ("rust-rand" ,rust-rand-0.8)
        ("rust-region" ,rust-region-3)
        ("rust-reqwest" ,rust-reqwest-0.11)
        ("rust-rsa" ,rust-rsa-0.5)
        ("rust-serde" ,rust-serde-1)
        ("rust-serde-json" ,rust-serde-json-1)
        ("rust-serde-path-to-error" ,rust-serde-path-to-error-0.1)
        ("rust-serde-repr" ,rust-serde-repr-0.1)
        ("rust-sha-1" ,rust-sha-1-0.9)
        ("rust-sha2" ,rust-sha2-0.9.9)
        ("rust-structopt" ,rust-structopt-0.3)
        ("rust-tempfile" ,rust-tempfile-3)
        ("rust-term-size" ,rust-term-size-0.3)
        ("rust-textwrap" ,rust-textwrap-0.11)
        ("rust-thiserror" ,rust-thiserror-1)
        ("rust-tokio" ,rust-tokio-1)
        ("rust-totp-lite" ,rust-totp-lite-1)
        ("rust-url" ,rust-url-2)
        ("rust-uuid" ,rust-uuid-0.8)
        ("rust-zeroize" ,rust-zeroize-1))))
    (native-inputs
     (list perl))
    (home-page "https://git.tozt.net/rbw")
    (synopsis "Unofficial Bitwarden CLI")
    (description "This package is an unofficial command line client for
Bitwarden.  Although Bitwarden ships with a command line client, but
it's limited by being stateless, which makes it very difficult to use.  This
client avoids that problem by maintaining a background process which is able
to hold the keys in memory, similar to the way that ssh-agent or gpg-agent
work.  This allows the client to be used in a much simpler way, with the
background agent taking care of maintaining the necessary state.")
    (license license:expat)))