# ai-use

How CRASR (Center for Reservoir and Aquatic Systems Research, Baylor University) aims to use, record, and disclose generative AI in research and software, and how we weigh its energy and water costs.

The policy describes the practice we work toward. It is built on published frameworks and guidance, listed [below](#literature-basis), and anyone may reuse or adapt it.

## What we aim for

- **Accountability.** People stay responsible for everything in the work. AI is never an author.
- **Judgment stays with people.** AI helps build code and tools; it does not replace expertise, statistical thinking, or critical judgment, and it does not analyze our data or produce our results.
- **People write.** Writing is how we think and learn, so we write our own papers. AI may give feedback or help with translation.
- **Useful disclosure.** Say what AI did, at which research stage, and how its output was checked.
- **A light record.** A short log kept with the code, in proportion to the risk of each use. Chat histories are optional.
- **Care with others' material.** Client data, and manuscripts and proposals we review, never go to an AI tool.
- **Reproducibility.** Code and analyses run and can be reviewed without AI.
- **Code we understand.** AI-generated code tends to be bloated and brittle, so we read, simplify, and test it before it is merged. No vibe coding.
- **Proportion.** Use AI where the benefit justifies its energy and water costs.

## Contents

| Path | What it is |
|---|---|
| [POLICY.md](POLICY.md) | The policy: principles, questions to ask first, risk tiers, pitfalls of AI-assisted coding, records, and how to write a statement |
| [CODING-WITH-AI.md](CODING-WITH-AI.md) | Instructions and skills for AI coding assistants to avoid the pitfalls, including a learning mode and a starting `AGENTS.md` |
| [ENVIRONMENT.md](ENVIRONMENT.md) | A short summary of research on the energy and water use of AI, including in Texas |
| [template/ai-use/](template/ai-use) | The folder to copy into a project: log, tool and material tables, data dictionary |
| [R/ai_use.R](R/ai_use.R) | R helper to download the template, add log rows, validate the tables, and draft a statement |
| [references/](references) | The reading list behind the policy, with BibTeX and RIS files |
| [ai-use/](ai-use) | This repository's own AI-use record |

## Get the template

**From R** (base R only, no packages needed):

```r
source("https://raw.githubusercontent.com/CRASR/ai-use/main/R/ai_use.R")
ai_use_init()   # creates ./ai-use; adds ^ai-use$ to .Rbuildignore in a package
```

Then, as you work:

```r
ai_log(tool = "claude-code-opus-5.5", stage = "software",
       task = "Draft hierarchical model code", output_type = "code", tier = 3,
       disposition = "modified", human_contribution = "Specified structure and priors",
       verification = "Parameter recovery on simulated data", link = "commit 1a2b3c4")
ai_use_check()       # flags missing or invalid entries
ai_use_statement()   # drafts a statement from the log
```

To say a project follows the policy, add this line to its README:

```markdown
AI use in this project follows the [CRASR AI-use policy](https://github.com/CRASR/ai-use); the record is in `ai-use/`.
```

**File by file.** Each template file is at `https://raw.githubusercontent.com/CRASR/ai-use/main/template/ai-use/<file>`, for example [ai_log.csv](https://raw.githubusercontent.com/CRASR/ai-use/main/template/ai-use/ai_log.csv).

## Literature basis

Each part of the policy and template traces to published work.

| Element | What it does | Drawn from |
|---|---|---|
| `stage` in the log | Disclose by research stage, not yes/no | Weaver 2024 (AID); Suchikova et al. 2025 (GAIDeT); CRediT |
| `tier` and the tier table | Scale disclosure and documentation to the risk of each use | Resnik & Hosseini 2025; Hosseini et al. 2025; Castellacci et al. 2026 |
| `verification` | Name the check, not just "reviewed" | Wahle et al. 2023; Smith et al. 2024; King et al. 2026 |
| `human_contribution`, `disposition` | Show what people decided and delegated | Suchikova et al. 2025; COPE 2023; ICMJE 2026 |
| `tools.csv` (model, version, dates) | Model behavior changes between versions, so record versions and dates | Weaver 2024; Knöchel et al. 2025 |
| `materials.csv`, `shared_material` | Keep client data and review material out entirely; check licenses on other material | Knöchel et al. 2025; European Commission 2026 |
| `ai-use/` folder, `recorded` | Keep documentation alongside disclosure | Cwik 2026; World Bank |
| "Before using AI" questions | Protect skills, consider others, prefer inspectable routes | Shen & Tamkin 2026; King et al. 2026; Knöchel et al. 2025 |
| Judgment stays with people; AI builds tools, not results | Keep expertise, interpretation, and analysis with people, and keep work reproducible without AI | COPE 2023; Smith et al. 2024; King et al. 2026; World Bank |
| Writing | People write; feedback and translation are reasonable uses | Nature Reviews Bioengineering 2025; Kosmyna et al. 2025; Amano et al. 2023; Berdejo-Espinola & Amano 2023 |
| Pitfalls of AI-assisted coding | Watch for technical debt, comprehension debt, and misjudged speed; review AI code for simplicity | He et al. 2026; Liu et al. 2026; Ahmad 2026; Becker et al. 2025; Fawzy et al. 2026; Merz 2026 |
| Assistant setup ([CODING-WITH-AI.md](CODING-WITH-AI.md)) | Standing instructions, learning mode, and skills that counter the pitfalls | Anthropic (Claude Code docs); [Çetinkaya-Rundel 2026](https://speakerdeck.com/minecr/beyond-the-prompt-rai); Kazemitabaar et al. 2024; Shen & Tamkin 2026 |
| Peer review | Review material never goes to AI tools | NIH 2023; NSF 2023; Hosseini & Horbach 2023 |
| One policy for all venues | Meet the shared core of publisher rules | COPE 2023; ICMJE 2026; STM 2025; European Commission 2026 |

Full references, each with a one-line note, are in the [reading list](references/reading-list.md), also published at [crasr.github.io](https://crasr.github.io/projects/ai-reading-list.html). Download them as [BibTeX](references/ai-science-reading-list.bib) or [RIS](references/ai-science-reading-list.ris).

## Reuse

The text and templates are licensed under [CC BY 4.0](LICENSE). To credit the work, cite:

> CRASR, Baylor University (2026). *ai-use: policy and templates for documenting and disclosing AI use in research.* https://github.com/CRASR/ai-use

Suggestions and corrections are welcome as issues.

## Use of AI tools in this repository

Claude (Opus 5.5, Anthropic), accessed through claude.ai in November 2026, located the frameworks, policies, and energy and water studies cited here; drafted the policy, environment page, templates, and the R helper; and checked the citations against their published records. Caleb Robbins set the purpose, scope, and requirements[, reviewed and edited the text, and checked the cited sources]. The R helper was tested on a sample project. No unpublished or restricted material was shared with AI tools. The record is in [ai-use/](ai-use). The maintainer takes full responsibility for the content.

Maintainer: CRASR, Baylor University.
