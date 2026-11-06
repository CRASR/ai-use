# ai-use

How CRASR (Center for Reservoir and Aquatic Systems Research, Baylor University) decides when to use AI, records that use, discloses it, and weighs its energy and water costs.

We use AI tools in data analysis, software development, and writing support. This repository holds the rules we follow and the templates we keep in every project. Anyone may reuse it.

## Our commitments

- **Disclosure.** We disclose AI use by task and research stage in every paper and software release, following each venue's rules.
- **Accountability.** People remain accountable. Every AI contribution is checked, and each statement names the check.
- **Records.** We keep the record with the code, in an `ai-use/` folder in each repository, not only in chat histories.
- **Data.** We decide before any licensed, unpublished, or client material reaches an AI tool, and we report what was shared.
- **No AI dependency.** Code and analyses run and can be reviewed without AI, and collaborators and students may choose not to use AI tools.
- **Proportionate use.** We use AI only where the benefit justifies its energy and water costs, and we estimate heavy use.

## Contents

| Path | What it is |
|---|---|
| [PROTOCOL.md](PROTOCOL.md) | Principles, questions to ask before using AI, project setup, logging, and disclosure tiers |
| [STATEMENTS.md](STATEMENTS.md) | How to write an AI-use statement, with a template, worked examples, and publisher requirements |
| [ENVIRONMENT.md](ENVIRONMENT.md) | Energy and water use of AI: per-use estimates, system scale including Texas, and our practices |
| [template/ai-use/](template/ai-use) | A folder to copy into a project repository, holding the log, tool and material tables, and data dictionary |
| [ai-use/](ai-use) | This repository's own AI-use record |

## Quick start

1. Copy `template/ai-use/` to the root of your project repository. In an R package, add `^ai-use$` to `.Rbuildignore`.
2. Fill in `tools.csv` and `materials.csv`.
3. Log consequential AI use in `ai_log.csv` as you work. Field definitions are in `data_dictionary.csv`.
4. At submission, write the statement following [STATEMENTS.md](STATEMENTS.md).

## Reuse

The text and templates are licensed under [CC BY 4.0](LICENSE). To credit the work, cite:

> CRASR, Baylor University (2026). *ai-use: protocol and templates for documenting and disclosing AI use in research.* https://github.com/CRASR/ai-use

Suggestions and corrections are welcome as issues.

## Use of AI tools in this repository

Claude (Opus 5.5, Anthropic), accessed through claude.ai in November 2026, contributed in two ways:
- It located disclosure frameworks, publisher policies, and energy and water studies.
- It drafted the protocol, the statement guide, the environment page, and the templates.

Caleb Robbins set the purpose, scope, and requirements[, reviewed and edited the text, and checked the cited sources]. No unpublished or restricted material was shared with AI tools. The record is in [ai-use/](ai-use). The maintainer takes full responsibility for the content.

Maintainer: Caleb Robbins, CRASR, Baylor University.
