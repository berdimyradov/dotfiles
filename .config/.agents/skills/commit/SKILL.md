---
name: commit-message-generator
description: Generate a Conventional Commits message from staged Git changes using `git diff --staged`.
license: MIT
---

Generate a **single-line** Conventional Commit message by inspecting **staged** changes via `git diff --staged`. Output **only** the message text and **never** run `git commit`.

## Core Behavior

- Run: `git diff --staged`
- Output exactly: `type: description`
- Subject line: **< 72 characters**
- No extra text (no markdown fences, quotes, explanations)
- Never run any commit command

## When to Use

Use when the user wants a Conventional Commit message based on staged changes.

## Types

- `:sparkles:` feature
- `:bug:` fix
- `:recycle:` refactor
- `:zap:` perf
- `:white_check_mark:` test
- `:memo:` docs
- `:art:` style/formatting
- `:wrench:` chore/tooling/deps
- `:construction_worker:` ci/build
- `:see_no_evil:` .*ignore files
- `:rotating_light:` compilers/linters

## Writing Rules

- Use imperative verbs: add/fix/remove/update
- Describe the outcome, not the implementation
- Pick the dominant change if multiple
- Keep it specific and under 72 chars

## Workflow

1. Run `git diff --staged`
2. Determine primary intent → choose type
3. Write `type: description`
4. Verify length < 72
5. Output the single line only

## Edge Case

If nothing is staged, output: `:wrench: no staged changes`

## Examples

- `:sparkles: add commit subject generation from staged diff`
- `:bug: fix handling when diff contains only renames`
- `:recycle: refactor intent detection into a single resolver`
- `:zap: speed up diff parsing for large staged changes`
- `:white_check_mark: add tests for 72-char subject enforcement`
- `:memo: document one-line output and no-commit constraint`
- `:wrench: update tooling config and dependency versions`
