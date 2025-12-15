;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;; ECOSYSTEM.scm — cerro-torre

(ecosystem
  (version "1.0.0")
  (name "cerro-torre")
  (type "project")
  (purpose "*Provenance-verified containers from democratically-governed sources.*")

  (position-in-ecosystem
    "Part of hyperpolymath ecosystem. Follows RSR guidelines.")

  (related-projects
    (project (name "rhodium-standard-repositories")
             (url "https://github.com/hyperpolymath/rhodium-standard-repositories")
             (relationship "standard")))

  (what-this-is "*Provenance-verified containers from democratically-governed sources.*")
  (what-this-is-not "- NOT exempt from RSR compliance"))
