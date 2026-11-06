# AI-use protocol

Version 1.0, November 2026. Maintained by Caleb Robbins, CRASR, Baylor University.

This protocol covers three things for each CRASR project:
- deciding whether AI assistance is appropriate,
- recording what AI did and what people decided,
- turning that record into an accurate AI-use statement (see [STATEMENTS.md](STATEMENTS.md)).

Logging should take a few minutes per work session in which AI did something consequential. A record shows what happened. It does not show that the work is right; verification and peer review still carry that weight.

## Principles

Each principle comes from an existing framework, so statements stay compatible with what editors, reviewers, and clients already expect.

| # | Principle | In practice | Drawn from |
|---|---|---|---|
| 1 | Disclose by task and stage, not yes/no | Say which research stages AI touched and what it did in each | [AID Framework][aid]; [GAIDeT][gaidet] |
| 2 | Scale detail to risk | Give more detail where an AI error could go unnoticed and spread into results | [Castellacci et al. 2026][castellacci] |
| 3 | Name tools precisely | Give product, model and version, provider, dates, and access mode | AID |
| 4 | Say how output was checked | Name the check and its evidence, not just "the authors reviewed all content" | [AI Usage Cards][cards] |
| 5 | The statement summarizes; the repository holds the record | Keep logs and decisions in version control, not only in chat histories | [Cwik 2026][cwik]; [King et al. 2026][king], Rule 8 |
| 6 | Report what was shared with AI tools | State whether confidential, licensed, or unpublished material went to a provider | AID; [Knöchel et al. 2025][knochel] |
| 7 | People stay accountable, and outputs stand without AI | Authors take responsibility. Code and analyses run, and can be reviewed, without an AI tool. Using AI is optional for collaborators and students. | COPE and publisher authorship policies |

## Before using AI

Ask these questions before a consequential use. Answer in one line each; a "no" or "unsure" means change the plan or don't use AI for that task.

1. **Rights.** May this material go to this provider under these terms? Check `materials.csv`, data licenses, client confidentiality, and the provider's training settings.
2. **Check.** Can someone verify the output against an independent source: a test, a reference, a measurement? If no one can, don't delegate the task.
3. **Others.** Who else bears the cost or risk? Consider data servers hit by automated retrieval, collaborators, clients, reviewers, and downstream users.
4. **Learning.** Is this a skill the person needs to keep? If so, attempt it first, or ask the AI for explanations rather than finished solutions ([Shen & Tamkin 2026][shen]).
5. **Route and proportion.** Would a script, a search, or a smaller model do the job? Prefer AI that writes inspectable code over AI that performs the task directly; see [ENVIRONMENT.md](ENVIRONMENT.md).

## Setup (once per project, about 15 minutes)

1. Copy [`template/ai-use/`](template/ai-use) to the root of the project repository. In an R package, add `^ai-use$` to `.Rbuildignore`.
2. Add one row to `tools.csv` for each AI tool and model version. Keep any project context file you give an AI tool (`CLAUDE.md`, project instructions, system prompts) under version control.
3. State the project's writing rule in one line. The default is that the authors write manuscript drafts.
4. List materials with terms in `materials.csv` before any of them reach an AI tool. Examples: licensed or unpublished data, client records, manufacturer manuals. Mark each one `share`, `share_training_off`, or `do_not_share`.
5. Note the target venue's AI policy (see [STATEMENTS.md](STATEMENTS.md)) and the date logging began. Mark rows for earlier work `reconstructed`.

## Logging

Log one row per episode in `ai_log.csv`. An episode is a work session on one task in which AI output could reach a paper, code, data, or a decision. Write the row at the end of the session; if unsure whether to log, log it. Skip spelling and grammar checkers, ordinary search engines, and reference managers used without generative features.

```csv
date,tool,stage,task,output_type,tier,disposition,human_contribution,verification,shared_material,link,recorded
2026-11-10,claude-code,data_collection_method,Parse sampler serial output into a bottle-event table,code,3,modified,Defined the event schema and error handling,testthat tests on three recorded logs; bench test on the instrument,restricted: manual command table (training off),commit 1a2b3c4,contemporaneous
```

The row above is illustrative. Field definitions and allowed values are in [`data_dictionary.csv`](template/ai-use/data_dictionary.csv).

The `stage` values follow the [AID Framework][aid] headings, plus `software` and `writing_original_draft` from CRediT.

Log rejected suggestions too, because they show judgment. In `verification`, name the check and its evidence rather than writing "reviewed".

## Disclosure tiers

Assign each row a tier by what an undetected AI error would do, not by how much the AI produced. When unsure, go up a tier.

| Tier | Covers | Examples | Statement says | Record keeps |
|---|---|---|---|---|
| 0 | Spelling and grammar checkers, search engines, reference managers without generative features | Spell-check; database search | Nothing | Nothing |
| 1 | Errors visible on reading: LLM copy-editing, translation, clarity feedback, formatting | Critique of a Discussion draft | Tool and purpose | Log row |
| 2 | Errors caught by ordinary checks: literature discovery, plotting or wrangling code, documentation, test scaffolding | Software interface code; package help pages; candidate references | Tool, task, and the check used | Log row and commit links |
| 3 | Errors that can pass silently into results: statistical model code, data transformations, calculations people rely on, instrument control, suggestions that shaped design or assumptions | Bayesian model code; unit conversions and uncertainty propagation; lab billing calculations; instrument command parsing | Methods text and a supplement table | Log rows, exported sessions, tests, validation outputs |

If AI produces research data itself, by extracting values from papers, classifying records, or retrieving datasets, report it as a method rather than as assistance. Give the model, settings, prompts, raw outputs, and validation against a human-checked sample. This follows the [World Bank][worldbank] distinction between coding help and AI-generated analytical outputs.

LLM copy-editing is Tier 1, not Tier 0. Some publishers exempt it from disclosure and others do not, so disclosing it satisfies both.

## Related tools

For detailed records of analytical decisions, [DADR][dadr] (Data Analysis Decision Records) works alongside this protocol. Link a decision record from the log's `link` field.

DADR covers why an analysis made each choice; this protocol covers where AI was involved and how that is disclosed. If an LLM drafts a DADR record, that is itself a loggable use.

## Sources

- Weaver, K. D. (2024). The Artificial Intelligence Disclosure (AID) Framework: An Introduction. *C&RL News* 85(10): 407–411. https://doi.org/10.5860/crln.85.10.407
- Suchikova, Y., Tsybuliak, N., Teixeira da Silva, J. A. & Nazarovets, S. (2025). GAIDeT (Generative AI Delegation Taxonomy). *Accountability in Research*. https://doi.org/10.1080/08989621.2025.2544331
- Wahle, J. P., Ruas, T., Mohammad, S. M., Meuschke, N. & Gipp, B. (2023). AI Usage Cards: Responsibly Reporting AI-Generated Content. JCDL 2023. https://doi.org/10.1109/JCDL57899.2023.00060
- Castellacci, F. et al. (2026). Generative Artificial Intelligence in Scientific Research: Individual Benefits, Collective Risks, and a Framework for Responsible Research with AI. arXiv:2607.24879.
- Cwik (2026). Disclosure is not documentation: an open science framework for documenting generative AI use in scholarly research and publication workflows. *Research Integrity and Peer Review*. https://doi.org/10.1186/s41073-026-00245-8
- King, R. A. et al. (2026). Ten simple rules for effective use of generative AI for code development in environmental science. *PLOS Computational Biology* 22(8): e1014627. https://doi.org/10.1371/journal.pcbi.1014627
- Knöchel, T.-D. et al. (2025). Core principles of responsible generative AI usage in research. *AI and Ethics* 5: 6371–6377. https://doi.org/10.1007/s43681-025-00768-8
- Shen, J. H. & Tamkin, A. (2026). How AI Impacts Skill Formation. arXiv:2601.20245.
- World Bank. Documenting AI use for reproducible research. https://worldbank.github.io/wb-reproducible-research-repository/guidance/AI_reproducibility_guidelines.html
- Arel-Bundock, V. DADR: Data Analysis Decision Records. https://vincentarelbundock.github.io/dadr

[aid]: https://subjectguides.uwaterloo.ca/AIDFramework
[gaidet]: https://www.leidenmadtrics.nl/articles/gaidet-a-practical-taxonomy-for-declaring-ai-use-in-research-and-publishing
[cards]: https://arxiv.org/abs/2303.03886
[castellacci]: https://arxiv.org/abs/2607.24879
[cwik]: https://doi.org/10.1186/s41073-026-00245-8
[king]: https://doi.org/10.1371/journal.pcbi.1014627
[knochel]: https://doi.org/10.1007/s43681-025-00768-8
[shen]: https://arxiv.org/abs/2601.20245
[worldbank]: https://worldbank.github.io/wb-reproducible-research-repository/guidance/AI_reproducibility_guidelines.html
[dadr]: https://vincentarelbundock.github.io/dadr
