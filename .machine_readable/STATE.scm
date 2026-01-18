;; SPDX-License-Identifier: PMPL-1.0-or-later
;; STATE.scm - Project state for cerro-torre
;; Media-Type: application/vnd.state+scm

(state
  (metadata
    (version "0.1.0")
    (schema-version "1.0")
    (created "2026-01-03")
    (updated "2026-01-18")
    (project "cerro-torre")
    (repo "github.com/hyperpolymath/cerro-torre"))

  (project-context
    (name "Cerro Torre")
    (tagline "Ship containers safely - provenance-verified containers from democratically-governed sources")
    (tech-stack (ada spark alire gnatcoll)))

  (current-position
    (phase "Phase 0: Foundations / Pre-Alpha")
    (overall-completion 25)
    (components
      (manifest-parser
        (status "implemented")
        (completion 80)
        (files
          "src/core/cerro_ctp_lexer.ads"
          "src/core/cerro_ctp_lexer.adb"
          "src/core/cerro_manifest.ads"
          "src/core/cerro_manifest.adb"
          "src/cli/ct_test_parser.adb"))
      (core-crypto
        (status "stub")
        (completion 5)
        (files "src/core/cerro_crypto.adb" "src/core/cerro_crypto.ads"))
      (cli-framework
        (status "stub")
        (completion 20)
        (files "src/cli/cerro_main.adb" "src/cli/cerro_cli.adb"))
      (importers
        (status "stub")
        (completion 5)
        (files "src/importers/debian/cerro_import_debian.adb"
               "src/importers/fedora/cerro_import_fedora.adb"
               "src/importers/alpine/cerro_import_alpine.adb"))
      (exporters
        (status "stub")
        (completion 5)
        (files "src/exporters/oci/cerro_export_oci.adb"
               "src/exporters/rpm-ostree/cerro_export_ostree.adb"))
      (provenance
        (status "stub")
        (completion 5)
        (files "src/core/cerro_provenance.adb")))
    (working-features
      "CTP manifest format specification (spec/manifest-format.md)"
      "TOML-like lexer with SPARK_Mode"
      "Full manifest parser for all core sections"
      "Parse_String and Parse_File entry points"
      "Manifest validation (Is_Complete, Is_Valid_Hash, Is_Valid_Version)"
      "Manifest serialization (To_String)"
      "Test parser CLI tool (ct_test_parser)"
      "Example manifests (hello.ctp.example, ct-minbase.ctp)"))

  (route-to-mvp
    (milestones
      (milestone "Manifest Parser"
        (status "complete")
        (items
          ("CTP lexer (tokenizer)" . done)
          ("Parse [metadata] section" . done)
          ("Parse [provenance] section" . done)
          ("Parse [dependencies] section" . done)
          ("Parse [build] section" . done)
          ("Parse [outputs] section" . done)
          ("Parse [attestations] section" . done)
          ("Manifest validation" . done)
          ("Manifest serialization" . done)
          ("Test parser tool" . done)))

      (milestone "Crypto Implementation"
        (status "planned")
        (items
          ("SHA256 hash (SPARKNaCl or libsodium)" . pending)
          ("SHA384/SHA512 hash" . pending)
          ("BLAKE3 hash" . pending)
          ("Ed25519 signing" . pending)
          ("Ed25519 verification" . pending)
          ("Key generation" . pending)
          ("Key storage (~/.config/cerro-torre/keys/)" . pending)))

      (milestone "Pack Command MVP"
        (status "planned")
        (items
          ("Parse manifest" . done)
          ("Fetch upstream source" . pending)
          ("Verify upstream hash" . pending)
          ("Apply patches" . pending)
          ("Build source" . pending)
          ("Generate OCI image" . pending)
          ("Sign image" . pending)
          ("Generate SBOM" . pending)))

      (milestone "Verify Command MVP"
        (status "planned")
        (items
          ("Load OCI image" . pending)
          ("Extract manifest" . pending)
          ("Verify signature" . pending)
          ("Check hash chain" . pending)
          ("Validate provenance" . pending)
          ("Report status" . pending)))))

  (blockers-and-issues
    (critical)
    (high
      "Need to implement real crypto (SPARKNaCl or Ada bindings to libsodium)")
    (medium
      "TOML subsection parsing not yet implemented ([build.environment], [build.phases])"
      "DateTime parsing incomplete (import_date field)"
      "[[inputs.sources]] array parsing not yet implemented")
    (low
      "Could add more validation for hash hex strings"
      "Could add line/column to all error messages"))

  (critical-next-actions
    (immediate
      "Test parser with example manifests"
      "Implement real SHA256 using SPARKNaCl")
    (this-week
      "Complete crypto module"
      "Implement basic pack command skeleton")
    (this-month
      "Implement verify command"
      "Add Debian importer"
      "Generate first provenance-verified image"))

  (session-history
    (snapshot "2026-01-18"
      (accomplishments
        "Analyzed vordr, svalinn, cerro-torre ecosystem"
        "Implemented CTP lexer (cerro_ctp_lexer.ads/adb)"
        "Implemented full manifest parser (cerro_manifest.adb)"
        "Parser handles all core sections: metadata, provenance, dependencies, build, outputs, attestations"
        "Added Parse_String and Parse_File functions"
        "Added validation: Is_Complete, Is_Valid_Hash, Is_Valid_Version"
        "Added serialization: To_String"
        "Created test parser tool (ct_test_parser.adb)"
        "Updated STATE.scm with comprehensive project status"))))
