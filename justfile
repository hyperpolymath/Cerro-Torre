# Cerro-Torre - Development Tasks
# SPDX-License-Identifier: PMPL-1.0-or-later
set shell := ["bash", "-uc"]
set dotenv-load := true

project := "Cerro-Torre"
build_mode := env_var_or_default("CERRO_BUILD_MODE", "Development")

# Toolbox prefix - use toolbox on Fedora Kinoite/Silverblue
tb := if `command -v toolbox >/dev/null 2>&1 && echo yes || echo no` == "yes" { "toolbox run" } else { "" }

# Show all recipes
default:
    @just --list --unsorted

# Build the project
build:
    alr build

# Run tests
test:
    alr build
    @echo "Unit tests not yet implemented - see docs/MVP-PLAN.md"

# Clean build artifacts
clean:
    alr clean
    rm -rf obj/ lib/

# Format Ada code (uses gnatpp if available)
fmt:
    @if command -v gnatpp &> /dev/null; then \
        find src -name "*.adb" -o -name "*.ads" | xargs gnatpp -i3 -M100; \
    else \
        echo "gnatpp not found - install GNAT tools for formatting"; \
    fi

# Lint/check Ada code
lint:
    alr build -- -gnatwa -gnatwe

# Run SPARK proofs (requires gnatprove)
prove:
    @if command -v gnatprove &> /dev/null; then \
        gnatprove -P cerro_torre.gpr --level=2; \
    else \
        echo "gnatprove not found - requires SPARK Pro or Community"; \
    fi

# Build and run the CLI
run *args:
    alr run -- {{args}}

# Build the ATS2 shadow verifier
shadow-build:
    @if command -v patscc &> /dev/null; then \
        patscc -O2 -DATS_MEMALLOC_LIBC -o ct-shadow tools/ats-shadow/main.dats; \
    else \
        echo "patscc not found - install ATS2 for shadow verifier"; \
    fi

# ============================================================
# Container Image Variants
# ============================================================

VERSION := "2.0.0"

# Build all image variants
build-all-images: build-ct-i build-ct-a build-ct

# ============================================================
# Cerro Torre Variants
# ============================================================

# Build ct-i (infrastructure variant: registry ops + basic packing)
build-ct-i:
    @echo "📦 Building ct-i (infrastructure)..."
    podman build -f containerfiles/ct-i.containerfile \
      -t ct-i:{{VERSION}} \
      -t ct-i:latest .

# Build ct-a (attestation variant: signing + rekor + sbom)
build-ct-a:
    @echo "🔐 Building ct-a (attestation)..."
    podman build -f containerfiles/ct-a.containerfile \
      -t ct-a:{{VERSION}} \
      -t ct-a:latest .

# Build ct (complete variant: all features)
build-ct:
    @echo "🏔️  Building ct (complete)..."
    podman build -f containerfiles/ct.containerfile \
      -t ct:{{VERSION}} \
      -t ct:latest .

# ============================================================
# Testing
# ============================================================

# Test ct-i (infrastructure variant)
test-ct-i:
    @echo "🧪 Testing ct-i..."
    podman run --rm ct-i:latest pack --help
    podman run --rm ct-i:latest fetch --help

# Test ct-a (attestation variant)
test-ct-a:
    @echo "🧪 Testing ct-a..."
    podman run --rm ct-a:latest sign --help
    podman run --rm ct-a:latest keygen --help

# Test ct (complete variant)
test-ct:
    @echo "🧪 Testing ct..."
    podman run --rm ct:latest --version
    podman run --rm ct:latest pack --help

# ============================================================
# Publishing
# ============================================================

# Publish all variants
publish-all: publish-ct-i publish-ct-a publish-ct

# Publish ct-i
publish-ct-i:
    @echo "📤 Publishing ct-i..."
    podman push ct-i:{{VERSION}} ghcr.io/hyperpolymath/ct-i:{{VERSION}}
    podman push ct-i:latest ghcr.io/hyperpolymath/ct-i:latest

# Publish ct-a
publish-ct-a:
    @echo "📤 Publishing ct-a..."
    podman push ct-a:{{VERSION}} ghcr.io/hyperpolymath/ct-a:{{VERSION}}
    podman push ct-a:latest ghcr.io/hyperpolymath/ct-a:latest

# Publish ct
publish-ct:
    @echo "📤 Publishing ct..."
    podman push ct:{{VERSION}} ghcr.io/hyperpolymath/ct:{{VERSION}}
    podman push ct:latest ghcr.io/hyperpolymath/ct:latest

# ============================================================
# Cleanup
# ============================================================

# Clean all image variants
clean-images:
    podman rmi ct-i:{{VERSION}} ct-i:latest || true
    podman rmi ct-a:{{VERSION}} ct-a:latest || true
    podman rmi ct:{{VERSION}} ct:latest || true

