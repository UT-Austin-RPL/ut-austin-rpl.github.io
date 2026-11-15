---
name: rpl-pages-release
description: Release the RPL GitHub Pages site and diagnose build failures caused by runner and Ruby compatibility. Use for authorized website pushes, deployment verification, and changes to this repository's CI or Ruby toolchain.
---

# RPL Pages Release

## Work in the active repository

Read `README.md` and confirm the Git remote before preparing a release. The active
repository is `UT-Austin-RPL/ut-austin-rpl.github.io`; a local checkout may still be
named `rpl.github.io`. The old `RPL-group-website` repository is retired for the main
website. Keep main-site updates in the active repository and preserve the separate
UTCS course hosting and forwarding configuration.

## Match the runner to the pinned tools

- Read `.ruby-version`, the `BUNDLED WITH` section of `Gemfile.lock`, and
  `.github/workflows/pages.yml` together. Confirm the Ruby and Bundler actually
  selected in the checkout before running local checks; a shell may select the
  system Ruby even when the required version is installed elsewhere.
- Treat `ubuntu-latest` as a moving alias. A content-only push can fail during
  environment setup when that alias changes. Diagnose the first failing step and
  its actual runner image before changing website content or dependencies.
- For an unavailable Ruby version, verify the requested version, image, and
  architecture against the official
  [setup-ruby platform guidance](https://github.com/ruby/setup-ruby#supported-platforms)
  and [Ruby build releases](https://github.com/ruby/ruby-builder/releases).
- When restoring an existing release, prefer a supported runner image that still
  provides the pinned Ruby version if that resolves the observed failure. Change
  only the affected build job. Keep the independent deployment job unchanged
  unless its own evidence requires a fix.
- An intentional runtime upgrade can be the right solution when requested or when
  the old combination is no longer supported. Validate its dependency and local
  setup impact explicitly. Do not turn the historical version pair below into a
  permanent requirement or upgrade unrelated dependencies just to bypass setup.

## Validate and finish an authorized release

1. Inspect the worktree and remote state; include only the intended changes in
   the commit. Use the build and validation commands in `README.md` with the
   project's actual toolchain. Report any local check that cannot run and verify
   it in CI before claiming that all checks passed.
2. Keep repository instructions out of the published site. Preserve the Jekyll
   exclusions for `AGENTS.md` and `.agents/`; after changing agent instructions or
   exclusions, confirm that neither appears in the generated site.
3. After an authorized push, record its full commit SHA and track the
   `Build and deploy GitHub Pages` run with that exact `head_sha`. A successful
   Git push establishes that the commit reached the remote; it does not establish
   that the website was published.
4. Inspect failed jobs, steps, and annotations before retrying. Apply a minimal
   evidence-based repair within the task's authorized scope. Avoid repeated
   retries without a new diagnosis; report the cause and remaining action if
   progress requires information or changes outside that scope.
5. Follow the run through both build and deployment. Prefer an available event
   subscription; otherwise use bounded checks, such as every 30 seconds for up to
   10 minutes. If that observation window expires, report the deployment as
   pending and provide its run link.
6. After successful deployment, fetch the affected public page and verify the
   requested text or behavior in the relevant entry. Allow a short bounded retry
   for CDN propagation. If the page still differs, report that verification is
   pending rather than claiming the content is live. For changes confined to
   agent instructions, verify that the instructions stay out of the built site
   and that the public site remains available.
7. Report commit/push status, deployment status, and live verification accurately,
   including any additional compatibility repair made to complete the release.

## Incident evidence

On November 15, 2026, `ubuntu-latest` resolved to Ubuntu 26.04 while this project
pinned Ruby 3.2.4. The runner had no build for that exact Ruby patch release, so
`ruby/setup-ruby` failed before the site build started. The verified repair pinned
the build job to Ubuntu 24.04, which provided Ruby 3.2.4 for the runner's x64
architecture. Existing Ruby and gem versions were preserved; the subsequent
build, validation, deployment, and live award checks passed.

- [Failure and annotations](https://github.com/UT-Austin-RPL/ut-austin-rpl.github.io/actions/runs/43769235540)
- [Minimal repair](https://github.com/UT-Austin-RPL/ut-austin-rpl.github.io/commit/7489cf6cce5ae5f91a455f5712f1c75d508b49d5)
- [Successful release](https://github.com/UT-Austin-RPL/ut-austin-rpl.github.io/actions/runs/43769414880)
