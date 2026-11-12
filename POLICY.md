# AI-use policy

Version 2.0, November 2026. Maintained by Caleb Robbins, CRASR, Baylor University.

This is the practice CRASR aims for when using generative AI in research and software: how we decide whether to use it, what we keep as a record, and how we disclose it. It describes an ideal to work toward. Where a project falls short of a part of it, the statement should say what was done instead.

One policy covers every output: papers, software, reports, and proposals. It is written to satisfy the requirements that publisher and funder policies share (see [Why one policy](#why-one-policy)). Where a journal or funder asks for more, its rules apply.

Full references are in the [README](README.md#literature-basis).

## Principles

| # | Principle | In practice | Basis |
|---|---|---|---|
| 1 | People are accountable | Authors take responsibility for everything in the work, including what AI drafted. AI is never listed as an author. | COPE 2023; ICMJE 2026 §V; European Commission 2026 |
| 2 | Disclose substance, by task and stage | Say which research stages AI touched and what it did there, not just "AI was used" | Resnik & Hosseini 2025; Weaver 2024 (AID); Suchikova et al. 2025 (GAIDeT); STM 2025 |
| 3 | Scale effort to risk | More detail where an AI error could pass unnoticed into results; little or none for language polishing | Resnik & Hosseini 2025; Hosseini et al. 2025; Castellacci et al. 2026 |
| 4 | Say how output was checked | Name the check and its evidence, not "the authors reviewed all content" | Wahle et al. 2023; Smith et al. 2024; King et al. 2026 |
| 5 | Document, don't only disclose | Keep a short record with the code, so a reader can trace what AI did | Cwik 2026; World Bank |
| 6 | Protect what isn't ours to share | Decide before licensed, unpublished, or client material reaches an AI provider | Knöchel et al. 2025; European Commission 2026 |
| 7 | Keep the work and the people independent of AI | Code and analyses run and can be reviewed without AI. Collaborators and students may opt out. Protect skills people need to keep. | Shen & Tamkin 2026; King et al. 2026 |
| 8 | Use AI in proportion to its benefit | Prefer a script, search, or smaller model when it does the job; see [ENVIRONMENT.md](ENVIRONMENT.md) | European Commission 2026; Knöchel et al. 2025 |

## Before using AI

Five quick questions before a consequential use. A "no" or "unsure" is a reason to change the plan.

1. **Rights.** May this material go to this provider under these terms? Check data licenses, client confidentiality, and the provider's training settings.
2. **Check.** Can the output be verified against something independent: a test, a reference, a measurement? If not, think hard before delegating the task.
3. **Others.** Who else bears the cost or risk: collaborators, clients, data servers hit by automated retrieval, downstream users?
4. **Learning.** Is this a skill the person needs to keep? If so, try it first, or ask the AI for explanations rather than finished answers. In a randomized trial, developers who delegated a new task to AI learned it less well than those who asked conceptual questions (Shen & Tamkin 2026).
5. **Route.** Would a script, a search, or a smaller model do? Prefer AI that writes inspectable code over AI that performs the task directly.

## Risk tiers

Assign a tier by what an undetected AI error would do, not by how much the AI produced. When unsure, go up a tier.

| Tier | Errors would be... | Examples | Log it? | Statement says |
|---|---|---|---|---|
| 0 | Not from generative AI | Spell-check, search engines, reference managers | No | Nothing |
| 1 | Visible on reading | Copy-editing, translation, clarity feedback, formatting | Optional | Tool and purpose |
| 2 | Caught by ordinary checks | Plotting or wrangling code, documentation, test scaffolding, finding candidate references | Yes | Tool, task, and the check |
| 3 | Able to pass silently into results | Model code, data transformations, calculations people rely on, instrument control, suggestions that shaped design or assumptions | Yes, with links to tests or validation | Tool, task, check, and a Methods paragraph |

Tier 1 follows the view that disclosing writing assistance should be voluntary (Hosseini et al. 2025), but some venues require it, so a one-line mention costs little. Tiers 2 and 3 match the uses that Resnik & Hosseini (2025) argue must be disclosed: AI that makes decisions affecting results, or that generates or analyzes content or data.

**AI as a method.** If AI produces research data itself, for example by extracting values from papers or classifying records, report it as a method rather than as assistance. Keep the model, settings, prompts, raw outputs, and a validation against a human-checked sample (World Bank; Resnik & Hosseini 2025).

## Records

Each project keeps an `ai-use/` folder in its repository. Get it with the R helper ([README](README.md#get-the-template)).

- `tools.csv`: one row per tool and model version.
- `materials.csv`: licensed, unpublished, or confidential material that could reach an AI tool, with a share decision made in advance.
- `ai_log.csv`: one row per episode of Tier 2–3 use. An episode is a work session on one task whose AI output could reach a paper, code, data, or a decision. Write the row at the end of the session. Log rejected suggestions too.

Field definitions are in [`data_dictionary.csv`](template/ai-use/data_dictionary.csv). Stages follow the AID Framework headings, plus `software` and `writing_original_draft` from CRediT.

**Chat histories are optional.** The log, the commits, and the tests are the record. Full chat exports are not kept by default, for three reasons:
- they often contain material that can't be made public;
- they are long and tool-specific, and few readers or editors can use them;
- the AI output that matters already lives in the code and text, where version control tracks it.

This follows Cwik's (2026) distinction between disclosure and documentation, with a minimal documentation level as the default. Knöchel et al. (2025) also note that complete documentation of AI use can be cumbersome and is not needed for every use. Keep an export when it would help someone reproduce or judge a Tier 3 result, and redact it as needed. The exception is AI used as a method, where prompts and raw outputs are part of the data.

**Commit trailers (optional).** For commits where AI wrote substantial code, add a trailer such as `Assisted-by: <tool_id>`. Some agents add `Co-Authored-By` lines automatically; either works. This makes AI-assisted changes searchable with `git log --grep`.

**Context files.** Keep any instructions given to an AI tool (`CLAUDE.md`, project instructions, system prompts) under version control.

## Writing the statement

1. Filter the log to Tier 1–3 rows and group them by stage. `ai_use_statement()` in the R helper drafts this for you.
2. Ask each co-author about their own AI use; the statement covers all authors.
3. Fill in the template, then trim for the venue. A full statement can be cut down; a thin one is hard to extend after submission.
4. Archive `ai-use/` with the code (Zenodo or the package repository) and note any redactions.

A complete statement covers:
- tools: product, model and version, provider, access mode, dates;
- tasks by stage;
- what people decided or created, and how outputs were checked;
- what AI was not used for, when that is informative;
- whether any restricted material went to an AI tool;
- where the record is archived;
- a responsibility sentence.

```markdown
**Use of AI tools.** [Tool, model/version (provider)], accessed through [interface] from [month year] to [month year], assisted with [stage: task; stage: task]. For [Tier 2–3 task], the authors [decision or design they made]; outputs were checked by [specific check and evidence]. AI tools were not used to [draft manuscript text | generate or alter data or figures]. [No unpublished or restricted third-party material was shared with AI tools. | <Material> was shared under settings that exclude it from model training.] The AI-use log and code are archived at [DOI]. The authors take full responsibility for the content of this work.
```

**Placement.** Put it where the venue asks. If the venue doesn't say, put research use in Methods and writing-only use in Acknowledgements; this is the most common arrangement in publisher policies and in ICMJE (2026). Answer any AI question in a submission system with the same facts. For grant proposals, check the funder's notice: NIH (2025), for example, does not consider applications substantially developed by AI to be the applicant's original ideas.

### Examples

Both are illustrative. Replace every detail with what the log shows.

**Research paper**

```markdown
**Use of AI tools.** Claude (Opus 5.5, Anthropic), accessed through claude.ai and Claude Code from [month year] to [month year], assisted with methodology (critiquing candidate model structures), software (drafting Stan and R code for the hierarchical model and its posterior predictive checks), and writing – review and editing (clarity feedback on the Discussion). The author specified the model structure, priors, and causal assumptions. AI-drafted model code was checked by recovering known parameters from simulated data and by prior and posterior predictive checks. AI tools were not used to draft manuscript text or to generate or alter data or figures. No unpublished third-party data were shared with AI tools. The AI-use log and code are archived at [DOI]. The author takes full responsibility for the content of this work.
```

**Software release or software paper**

```markdown
**AI usage disclosure.** Claude Code ([model as displayed], Anthropic) was used from [month year] to [month year] for code generation, refactoring, test scaffolding, and first drafts of function documentation in [modules]. The author designed the package architecture, the [data model], and the user workflow. AI-generated code was reviewed, modified, and validated by the author with unit tests against [recorded instrument logs] and [bench tests]. The AI-use log is in `ai-use/` in the repository.
```

## Why one policy

Publisher and funder AI policies differ in placement and detail but share a core: AI cannot be an author, authors are responsible for all content, and substantive use must be disclosed with the tool and its purpose (COPE 2023; ICMJE 2026; STM 2025; European Commission 2026). A statement built from the log meets that core everywhere. Placement and exemptions vary and change often, so check the venue's live policy at submission rather than relying on a table here.

A World Conferences on Research Integrity focus track is developing a shared disclosure standard, with a draft being refined in late 2026 to early 2027 (Scholarly Kitchen 2026). This policy will be revised to match it when it appears.

## Tools that work alongside this policy

- [DADR](https://vincentarelbundock.github.io/dadr) (Data Analysis Decision Records) for recording why an analysis made each choice. Link a record from the log's `link` field.
- [GAIDeT Declaration Generator](https://github.com/panbibliotekar/gaidet-declaration) for producing a taxonomy-based statement.
- [AI Usage Cards](https://ai-cards.org) for a structured, machine-readable report.
- Cwik (2026) provides OSF templates for prompt logs and redaction, useful when a project does keep chat exports.
