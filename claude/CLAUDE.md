# Global Claude Code Preferences — Griffin Long

## Identity
- GitHub: DrunkOnJava (SSH)
- Email: griffinradcliffe@gmail.com

## Workflow
- Install tools via Homebrew; language runtimes via mise (except Rust → rustup) — keeps everything manageable through a single package manager and avoids version conflicts across projects
- Use SSH for Git operations by default — key is already on the agent and uploaded to GitHub; fall back to HTTPS only if a repo specifically requires it
- Default branch: main
- Prefer concise responses with file:line references — saves scrolling and makes it easy to jump to source
- Ask before creating new projects — wrong directory structure is painful to undo and I have strong opinions about project organization

## Code Style
- Keep code simple and minimal — over-engineered code is harder to debug and maintain than simple code that does the job
- Don't add comments, docstrings, or type annotations unless asked or the project's existing conventions require them — clean code should be self-documenting; unnecessary annotations create noise and maintenance burden
- Don't refactor surrounding code when fixing a bug unless the refactor is necessary for a correct fix — unrelated changes make PRs harder to review and risk introducing new bugs
- Prefer error handling at system boundaries (user input, external APIs, I/O) over defensive coding in internal logic — but use judgment when a function genuinely handles fallible operations

## Git
- Don't commit unless asked — I review changes before committing and may want to adjust or split them
- Don't push without confirmation — pushing is visible to collaborators and can trigger CI; I need to control when that happens
- Use conventional commit messages when committing — keeps history scannable and enables automated changelogs

## Learning & Memory

Actively maintain memory files to build a persistent understanding across sessions. The memory system is how you compensate for not having continuity between conversations — treat it as essential infrastructure, not an afterthought.

- **When corrected**: Record the correction in `memory/corrections.md` with what you did wrong, what the right approach is, and why. Corrections reveal gaps in your mental model — capturing them prevents the same mistake across future sessions.
- **When you discover a preference**: Update `memory/MEMORY.md` or the relevant topic file. Preferences are easy to forget and annoying for the user to repeat. If the preference is stable and broadly applicable, also consider whether it belongs in `~/.claude/CLAUDE.md` or a project's CLAUDE.md as a durable rule.
- **When you learn project-specific patterns**: Create or update a topic file (e.g., `memory/patterns.md`, `memory/debugging.md`). Per-project knowledge compounds — architecture decisions, naming conventions, common pitfalls, and working solutions should all be captured.
- **When you identify a recurring issue**: Document the root cause and solution in the appropriate memory file. If you've solved the same class of problem twice, it will come up again.
- **Evolve the system itself**: If a CLAUDE.md rule turns out to be wrong, too strict, or missing an edge case — update it. If a memory file is getting noisy or outdated, prune it. These files are living documents. Use your judgment to refactor the memory structure as it grows (split large files, merge sparse ones, add new topic files when a theme emerges).
