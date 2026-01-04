;; SPDX-License-Identifier: AGPL-3.0-or-later
;; STATE.scm - Current project state for Cerro Torre

(define project-state
  `((metadata
      ((version . "1.0.0")
       (schema-version . "1")
       (created . "2025-12-29T03:24:22+00:00")
       (updated . "2026-01-04T00:00:00+00:00")
       (project . "Cerro Torre")
       (repo . "cerro-torre")))

    (project-context
      ((name . "Cerro Torre")
       (tagline . "Ship containers safely - provenance-verified containers from democratically-governed sources")
       (tech-stack ((primary . "Ada/SPARK") (build-system . "Alire")))))

    (current-position
      ((phase . "Phase 0: Foundations / Pre-Alpha")
       (overall-completion . 15)
       (components
         ((core-crypto . ((status . "stub") (completion . 5)))
          (manifest-parser . ((status . "stub") (completion . 10)))
          (provenance-chain . ((status . "stub") (completion . 10)))
          (cli-framework . ((status . "stub") (completion . 15)))
          (debian-importer . ((status . "stub") (completion . 5)))
          (oci-exporter . ((status . "stub") (completion . 5)))
          (selinux-policy . ((status . "planned") (completion . 0)))
          (attestations . ((status . "planned") (completion . 0)))))
       (working-features
         ((alire-build . "Project compiles with alr build")
          (governance-docs . "Cooperative articles drafted")
          (crypto-suites . "CT-SIG-01 through CT-SIG-04 specified")))))

    (route-to-mvp
      ((milestones
         ((v0.1-first-ascent . "Ergonomic CLI for pack/verify/explain")
          (v0.2-base-camp . "Distribution, runtime integration, post-quantum")
          (v0.3-the-wall . "Attestations + ecosystem integration")
          (v0.4-the-summit . "Federated operation, build verification")))))

    (blockers-and-issues
      ((critical . ((crypto-implementation . "SHA256/Ed25519 are placeholders") (toml-parser . "Manifest parsing not implemented")))
       (high . ((spark-proofs . "gnatprove not in CI") (test-infrastructure . "No tests exist")))
       (medium . ((sfc-application . "SFC application pending") (gitlab-ci . "No .gitlab-ci.yml")))))

    (critical-next-actions
      ((immediate . ("Decide libsodium vs SPARKNaCl" "Integrate toml_slicer" "Implement SHA256_Hash"))
       (this-week . ("CLI skeleton" ".ctp bundle format" "Ed25519_Verify"))
       (this-month . ("OCI reading" "Bundle writer" "Key generation" "End-to-end test"))))

    (session-history
      ((session-2025-12-29 . "Created structure, governance, crypto suites")
       (session-2025-12-30 . "CLI scaffold, example policies")
       (session-2026-01-04 . "SCM files populated")))))
