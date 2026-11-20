# Coding with AI assistants

Most of the [pitfalls of AI-assisted coding](POLICY.md#pitfalls-of-ai-assisted-coding) can be headed off before the first prompt, in the standing instructions and skills an assistant reads every session. This page collects instructions that have worked for us, with the reason for each, and a starting file you can copy.

Two things to keep in mind:

- **Instructions are advice, not guarantees.** Anything that must happen every time belongs in a test, a linter, a permission rule, or a hook rather than a sentence (Anthropic, *Best practices for Claude Code*).
- **Shorter works better.** A long instructions file gets partly ignored. For each line, ask whether removing it would cause mistakes; if not, cut it (Anthropic, *Best practices for Claude Code*). Put rarely needed guidance in a skill instead, which loads only when relevant.

Keep instruction files under version control, as the policy asks.

## Where instructions live

| Tool | Standing instructions | Loaded on demand |
|---|---|---|
| Claude Code | `CLAUDE.md` in the project (shared) or `~/.claude/CLAUDE.md` (personal, all projects) | Skills in `.claude/skills/<name>/SKILL.md`; output styles such as Learning |
| Codex, Cursor, and other agents | `AGENTS.md` in the project | Varies by tool |
| claude.ai | Personal preferences in settings; project instructions in a Project | Skills |
| GitHub Copilot | `.github/copilot-instructions.md` | — |

One file can serve several tools: write `AGENTS.md`, then put a single line `@AGENTS.md` in `CLAUDE.md` to import it.

## Instructions against each pitfall

| Pitfall | Instruction | Why |
|---|---|---|
| Bloated code | "Make targeted changes. Change only what the task needs; don't rewrite working code." | Bloat and churn come from regenerating more than was asked (He et al. 2026; Liu et al. 2026) |
| Bloated code | "Minimal defensive scaffolding: no input validation, `tryCatch`, fallbacks, or messages unless I ask." | Defensive code multiplies lines and hides failures that should stop the script |
| Bloated code | "Reuse existing functions. Don't add helpers, wrappers, or abstractions for a single use." | Unneeded helpers and over-applied DRY patterns are a signature of AI code (Merz 2026) |
| Bloated code | "Concise, pipe-based R. Prefer packages already in the project; ask before adding a dependency." | Fewer lines and fewer dependencies are easier to review and maintain |
| Bloated code | "If my request or your solution seems overbuilt, say so and propose something smaller." | Gives the assistant permission to push back instead of complying with a bad plan |
| Brittle tests | "Tests check behavior against known answers or fixture data, not that a function returns what it returns." | Trivial tests pass while real failures go unnoticed (Merz 2026) |
| Comprehension debt | "Before changing more than one file, state a short plan and wait for my go-ahead." | Planning first avoids solving the wrong problem (Anthropic, *Best practices*) and keeps the person in the design |
| Comprehension debt | "After each change, explain in two or three sentences what changed and why." | Code accepted without being understood is how comprehension debt builds (Ahmad 2026) |
| Comprehension debt | "Keep each change small enough to review in one sitting." | Large, fast diffs get skimmed (Merz 2026) |
| Misjudged speed | "Run the tests or checks and show the output. Don't report success without evidence." | People overestimate how much AI helped (Becker et al. 2025); evidence is quicker to review than claims (Anthropic, *Best practices*) |
| Quiet statistical errors | "After joins and filters, report row counts before and after." | AI code can run cleanly while silently dropping rows ([Çetinkaya-Rundel 2026](https://speakerdeck.com/minecr/beyond-the-prompt-rai)) |
| Quiet statistical errors | "Don't choose models, priors, or tests for me. List the options and their assumptions, and flag ones the data may violate." | Keeps judgment with people (policy principle 2); AI may ignore problems such as overdispersion ([Çetinkaya-Rundel 2026](https://speakerdeck.com/minecr/beyond-the-prompt-rai)) |
| AI builds tools, not results | "Write code for me to run. Don't run analyses on project data or interpret results." | Keeps results reproducible and produced by people (policy principle 8) |
| Writing | "Don't draft text for papers. Comment on my drafts only when I ask." | People write our papers (policy, Writing) |

## Privacy and licensing

Instructions alone are not enough here, because they are advisory.

- **Keep client data out of reach.** Store it outside any folder an AI tool is opened in. This is the only reliable safeguard.
- **Add deny rules as a second layer.** In Claude Code, list sensitive paths in `.claude/settings.json`:

  ```json
  {
    "permissions": {
      "deny": ["Read(./data/client/**)", "Read(./.Renviron)", "Read(./.env*)"]
    }
  }
  ```

  Deny rules apply to Claude's file tools; they are a backstop, not a substitute for keeping the data elsewhere.
- **Instructions to add:** "Never open files under `data/client/` or credential files. If a task seems to need them, stop and ask." and "Don't copy code from sources whose license is unclear. When adapting an approach from a package or paper, name the source in a comment."

## Learning mode

When the goal is to learn, whether you are a student or learning a new method, the assistant should act as a tutor rather than a solution generator. Developers who asked AI conceptual questions learned a new library better than those who delegated the code (Shen & Tamkin 2026), and an assistant built to explain rather than hand over code has been used through a semester by a 700-student programming course (Kazemitabaar et al. 2024).

In her talk [*Beyond the prompt*](https://speakerdeck.com/minecr/beyond-the-prompt-rai), [Mine Çetinkaya-Rundel](https://mine-cr.com) (2026) describes giving students in her introductory data science course an [`AGENTS.md`](https://github.com/mine-cetinkaya-rundel/beyond-the-prompt-rai-2026/blob/main/examples/hw/AGENTS.md) that does this. Adapted for our use, a learning-mode file asks the assistant to:

- act as a teaching assistant, not a solution generator, and not edit the learner's files or run their code;
- ask what the learner tried, expected, and saw before helping;
- explain the concept or error, then suggest one or two next steps or a small example for the learner to run;
- keep any code to short snippets that illustrate a point, not finished solutions;
- have the learner inspect each stage of a data pipeline separately;
- point to package documentation and course or reference texts rather than third-party solutions.

In Claude Code, the built-in **Learning** output style does something similar: it explains its choices and leaves `TODO(human)` markers for you to write key pieces yourself (Anthropic, *Output styles*).

## Skills worth adding

Skills hold longer procedures that would bloat a standing file. Three that fit this policy:

- **`review-ai-diff`**: before merging, review the current diff in a fresh context and report, without fixing: unused or single-use helpers, duplicated code, defensive checks nobody asked for, tests that restate the code, and changes outside the task. A reviewer that did not write the code is less biased toward it (Anthropic, *Best practices*). Tell it to report only problems that matter, or it will invent some.
- **`ai-log`**: at the end of a session, draft a row for `ai-use/ai_log.csv` from what was done, for the person to check and edit.
- **`explain-back`**: walk through a piece of code and ask the person to explain what each part does before moving on.

## Starting file

Copy into `AGENTS.md` (and `@AGENTS.md` into `CLAUDE.md`), then cut what you don't need.

```markdown
# Working with AI in this project

AI use here follows the CRASR AI-use policy: https://github.com/CRASR/ai-use

## Code
- Make targeted changes; change only what the task needs.
- Concise, pipe-based R. Minimal defensive scaffolding: no input checks,
  tryCatch, or fallbacks unless asked.
- Reuse existing functions; no single-use helpers or abstractions.
- Ask before adding a dependency.
- If a request or solution seems overbuilt, say so and propose something smaller.

## Working together
- For changes to more than one file, state a short plan and wait for approval.
- After each change, explain briefly what changed and why.
- Run the tests and show the output; don't claim success without evidence.
- Tests check behavior against known answers, not that code returns what it returns.

## Data and results
- Write code for me to run; don't run analyses on project data or interpret results.
- After joins and filters, report row counts before and after.
- Don't choose models, priors, or tests; list options and their assumptions.
- Never open files under data/client/ or credential files.
- Don't copy code with an unclear license; cite sources you adapt.
```

## References

Full references, each with a one-line note, are in the [reading list](references/reading-list.md), also published at [crasr.github.io](https://crasr.github.io/projects/ai-reading-list.html). Download them as [BibTeX](references/ai-science-reading-list.bib) or [RIS](references/ai-science-reading-list.ris).
