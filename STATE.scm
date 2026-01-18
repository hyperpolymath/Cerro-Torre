;; SPDX-License-Identifier: PMPL-1.0-or-later
;; STATE.scm - Current project state for Cerro Torre

(define project-state
  `((metadata
      ((version . "1.0.0")
       (schema-version . "1")
       (created . "2025-12-29T03:24:22+00:00")
       (updated . "2026-01-18T15:40:00+00:00")
       (project . "Cerro Torre")
       (repo . "cerro-torre")))

    (project-context
      ((name . "Cerro Torre")
       (tagline . "Ship containers safely - provenance-verified containers from democratically-governed sources")
       (tech-stack ((primary . "Ada/SPARK") (build-system . "Alire")))))

    (current-position
      ((phase . "Phase 0: Foundations / MVP Core")
       (overall-completion . 55)
       (components
         ((core-crypto . ((status . "working") (completion . 90)
                          (notes . "SHA-256/512 FIPS 180-4, Ed25519 RFC 8032 compliant")))
          (manifest-parser . ((status . "working") (completion . 85)
                              (notes . "Full TOML-like parser with array tables and dotted sections")))
          (provenance-chain . ((status . "partial") (completion . 50)
                               (notes . "Hash + Ed25519 signature verification working")))
          (cli-framework . ((status . "working") (completion . 60)
                            (notes . "pack, verify, help commands functional")))
          (tar-writer . ((status . "working") (completion . 90)
                         (notes . "POSIX ustar format, source file inclusion")))
          (debian-importer . ((status . "stub") (completion . 5)))
          (oci-exporter . ((status . "stub") (completion . 5)))
          (selinux-policy . ((status . "planned") (completion . 0)))
          (attestations . ((status . "partial") (completion . 20)
                           (notes . "Manifest parsing works, ATS2 shadow exists (non-authoritative)")))))
       (working-features
         ((ct-pack . "Creates .ctp tar bundles with manifest, summary.json, optional sources")
          (ct-verify . "Verifies bundle hash integrity with specific exit codes")
          (sha256-hash . "FIPS 180-4 compliant SHA-256 implementation")
          (sha512-hash . "FIPS 180-4 compliant SHA-512 implementation")
          (ed25519-verify . "RFC 8032 Ed25519 signature verification")
          (manifest-parsing . "Full TOML-like CTP manifest parsing")
          (tar-archives . "POSIX ustar tar archive creation")
          (source-inclusion . "Recursive directory inclusion in bundles")
          (ats2-shadow . "Non-authoritative shadow verifier (needs patscc)")))))

    (route-to-mvp
      ((milestones
         ((v0.1-first-ascent . "Ergonomic CLI for pack/verify/explain")
          (v0.2-base-camp . "Distribution, runtime integration, post-quantum")
          (v0.3-the-wall . "Attestations + ecosystem integration")
          (v0.4-the-summit . "Federated operation, build verification")))))

    (blockers-and-issues
      ((critical . ((trust-store . "Get_Signer_Trust returns Untrusted (stub)")))
       (high . ((spark-proofs . "gnatprove not in CI")
                (ats2-toolchain . "patscc not installed for shadow verifier")
                (license-headers . "Ada source files need PMPL-1.0-or-later update")))
       (medium . ((sfc-application . "SFC application pending")
                  (gitlab-ci . "No .gitlab-ci.yml")))))

    (critical-next-actions
      ((immediate . ("Trust store implementation" "ct explain command"))
       (this-week . ("Policy file enforcement" "Ed25519 test vectors"))
       (this-month . ("Key generation" "Full summary.json schema" "End-to-end test suite"))))

    (session-history
      ((session-2025-12-29 . "Created structure, governance, crypto suites")
       (session-2025-12-30 . "CLI scaffold, example policies")
       (session-2026-01-04 . "SCM files populated")
       (session-2026-01-17 . "Manifest parser fixed for array tables, pack MVP working")
       (session-2026-01-18a . "SHA-512 impl, verify command, tar archives, source inclusion, ATS2 review")
       (session-2026-01-18b . "Ed25519 full RFC 8032 implementation, license audit, PMPL-1.0 update")))))
