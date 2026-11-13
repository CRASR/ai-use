# AI-use policy

Maintained by CRASR, Baylor University.

This is the practice CRASR aims for when using generative AI in research and software: how we decide whether to use it, what we keep as a record, and how we disclose it. It describes an ideal to work toward. Where a project falls short of a part of it, the statement should say what was done instead.

AI helps us build code and tools: software, data pipelines, and the code that fits statistical models and draws graphs. It does not analyze our data or produce our results. Results come from code that people have read, tested, and can rerun without AI, so the work stays reproducible.

AI does not replace domain expertise, statistical thinking, or critical judgment, and decisions are not delegated to it. People choose the questions, the study design, the models and their assumptions, and how results are interpreted and acted on. When AI suggests one of these, a person evaluates the suggestion on its merits and owns the choice. Expertise is built by doing this work, so we protect the chance to do it ourselves, especially while learning.

One policy covers papers and software. It is written to satisfy the requirements that publisher policies share (see [Why one policy](#why-one-policy)). Where a journal asks for more, its rules apply.

Full references are in the [README](README.md#literature-basis).

## Principles

| # | Principle | In practice | Basis |
|---|---|---|---|
| 1 | People are accountable | Authors take responsibility for everything in the work, including what AI drafted. AI is never listed as an author. | COPE 2023; ICMJE 2026 §V; European Commission 2026 |
| 2 | Judgment stays with people | Expertise, statistical reasoning, and critical evaluation come from people. Research questions, design, model choice, interpretation, and conclusions are decided by people, who can explain and defend each one without the AI. People build expertise by doing the work, so they choose when to do it without AI. | COPE 2023; Smith et al. 2024; King et al. 2026; Shen & Tamkin 2026 |
| 3 | Disclose substance, by task and stage | Say which research stages AI touched and what it did there, not just "AI was used" | Resnik & Hosseini 2025; Weaver 2024 (AID); Suchikova et al. 2025 (GAIDeT); STM 2025 |
| 4 | Scale effort to risk | More detail where an AI error could pass unnoticed into results; little or none for language polishing | Resnik & Hosseini 2025; Hosseini et al. 2025; Castellacci et al. 2026 |
| 5 | Say how output was checked | Name the check and its evidence, not "the authors reviewed all content" | Wahle et al. 2023; Smith et al. 2024; King et al. 2026 |
| 6 | Document, don't only disclose | Keep a short record with the code, so a reader can trace what AI did | Cwik 2026; World Bank |
| 7 | Protect what isn't ours to share | Client data, and manuscripts and proposals we review, never go to AI tools. Check the license before sharing other third-party material, such as manufacturer documentation. | NIH 2023; NSF 2023; Knöchel et al. 2025; European Commission 2026 |
| 8 | AI builds tools, not results | AI may help write code for wrangling, modeling, and graphing. It does not analyze data, interpret results, or create or alter data or figures. Analyses run, and can be reviewed, without AI. | King et al. 2026; World Bank; Cwik 2026 |
| 9 | Use AI in proportion to its benefit | Prefer a script, search, or smaller model when it does the job; see [ENVIRONMENT.md](ENVIRONMENT.md) | European Commission 2026; Knöchel et al. 2025 |

## Before using AI

Five quick questions before a consequential use. A "no" or "unsure" is a reason to change the plan.

1. **Rights.** Is any of it client data, or a manuscript or proposal under review? If so, stop: these never go to an AI tool. For other third-party material, check its license.
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
| 3 | Able to pass silently into results | Model code, data transformations, calculations people rely on, suggestions that shaped design or assumptions | Yes, with links to tests or validation | Tool, task, check, and a Methods paragraph |

Tier 1 follows the view that disclosing writing assistance should be voluntary (Hosseini et al. 2025), but some venues require it, so a one-line mention costs little. Tiers 2 and 3 match the uses that Resnik & Hosseini (2025) argue must be disclosed: AI that makes decisions affecting results, or that generates or analyzes content or data.

## Writing

People write our papers. Writing is how we work out what we think and how we learn to communicate science, and handing the first draft to AI hands over that thinking (Nature Reviews Bioengineering 2025). In an EEG study of essay writing, people who wrote with an AI assistant showed weaker brain connectivity, less sense of ownership, and more trouble recalling their own text than people who wrote unaided (Kosmyna et al. 2025).

AI feedback on a finished draft, such as pointing out unclear passages, can help. We use AI copy-editing sparingly, because revising one's own text is also how writing improves. Translation is a different case: non-native English speakers spend substantially more effort reading, writing, and publishing in English (Amano et al. 2023), and AI translation and proofreading can reduce that burden (Berdejo-Espinola & Amano 2023).

## Peer review

We never put manuscripts, proposals, or our own review reports into AI tools. Review material is confidential, and peer review is a judgment made by people chosen for their expertise and their place in a research community (Hosseini & Horbach 2023). NIH and NSF prohibit generative AI in their review processes, chiefly to protect confidentiality (NIH 2023; NSF 2023).

## Coding agents

Coding agents work on development copies of code and data, never on live systems or with credentials to them.

## AI as a method

This is the exception to AI not producing results: a study that deliberately uses AI as a measurement tool, for example to extract values from published papers. Report it as a method rather than as assistance, and validate it like any other instrument. Keep the model, settings, prompts, raw outputs, and a comparison against a human-checked sample (World Bank; Resnik & Hosseini 2025).

## Records

Each project keeps an `ai-use/` folder in its repository. Get it with the R helper ([README](README.md#get-the-template)).

- `tools.csv`: one row per tool and model version.
- `materials.csv`: licensed or unpublished third-party material that could reach an AI tool, with a share decision made in advance. Client data is not listed because it is never shared.
- `ai_log.csv`: one row per episode of Tier 2–3 use. An episode is a work session on one task whose AI output could reach a paper, code, data, or a decision. Write the row at the end of the session. Log rejected suggestions too.

Field definitions are in [`data_dictionary.csv`](template/ai-use/data_dictionary.csv). Stages follow the AID Framework headings, plus `software` and `writing_original_draft` from CRediT.

**Chat histories are optional.** The log, the commits, and the tests are the record. Full chat exports are not kept by default, for three reasons:
- they can contain material that can't be made public;
- they are long and tool-specific, and few readers or editors can use them;
- the AI output that matters already lives in the code and text, where version control tracks it.

This follows Cwik's (2026) distinction between disclosure and documentation, with a minimal documentation level as the default. Knöchel et al. (2025) also note that complete documentation of AI use can be cumbersome and is not needed for every use. Keep an export when it would help someone reproduce or judge a Tier 3 result, and redact it as needed. The exception is AI used as a method, where prompts and raw outputs are part of the data.

**Commit trailers (optional).** For commits where AI wrote substantial code, add a trailer such as `Assisted-by: <tool_id>`. Some agents add `Co-Authored-By` lines automatically; either works. This makes AI-assisted changes searchable with `git log --grep`.

**Context files.** Keep any instructions given to an AI tool (`CLAUDE.md`, project instructions, system prompts) under version control.

**Saying a project follows this policy.** Add this line to the project README:

```markdown
AI use in this project follows the [CRASR AI-use policy](https://github.com/CRASR/ai-use); the record is in `ai-use/`.
```

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
- that no client data or confidential material went to an AI tool;
- where the record is archived;
- a responsibility sentence.

```markdown
**Use of AI tools.** [Tool, model/version (provider)], accessed through [interface] from [month year] to [month year], assisted with [stage: task; stage: task]. For [Tier 2–3 task], the authors [decision or design they made]; outputs were checked by [specific check and evidence]. AI tools were not used to [draft manuscript text | generate or alter data or figures]. No client data or confidential material was shared with AI tools. The AI-use log and code are archived at [DOI]. The authors take full responsibility for the content of this work.
```

**Placement.** Put it where the venue asks. If the venue doesn't say, put research use in Methods and writing-only use in Acknowledgements; this is the most common arrangement in publisher policies and in ICMJE (2026). Answer any AI question in a submission system with the same facts.

### Examples

Both are illustrative. Replace every detail with what the log shows.

**Research paper**

```markdown
**Use of AI tools.** Claude (Opus 5.5, Anthropic), accessed through claude.ai and Claude Code from [month year] to [month year], assisted with methodology (critiquing candidate model structures), software (drafting Stan and R code for the hierarchical model and its posterior predictive checks), and writing – review and editing (clarity feedback on the Discussion). The author specified the model structure, priors, and causal assumptions. AI-drafted model code was checked by recovering known parameters from simulated data and by prior and posterior predictive checks. AI tools were not used to draft manuscript text or to generate or alter data or figures. No client data or confidential material was shared with AI tools. The AI-use log and code are archived at [DOI]. The author takes full responsibility for the content of this work.
```

**Software release or software paper**

```markdown
**AI usage disclosure.** Claude Code ([model as displayed], Anthropic) was used from [month year] to [month year] for code generation, refactoring, test scaffolding, and first drafts of function documentation in [modules]. The author designed the package architecture, the [data model], and the user workflow. AI-generated code was reviewed, modified, and validated by the author with unit tests against [test data]. The AI-use log is in `ai-use/` in the repository.
```

## Why one policy

Publisher AI policies differ in placement and detail but share a core: AI cannot be an author, authors are responsible for all content, and substantive use must be disclosed with the tool and its purpose (COPE 2023; ICMJE 2026; STM 2025; European Commission 2026). A statement built from the log meets that core everywhere. Placement and exemptions vary and change often, so check the venue's live policy at submission rather than relying on a table here.

A World Conferences on Research Integrity focus track is developing a shared disclosure standard, with a draft being refined in late 2026 to early 2027 (Scholarly Kitchen 2026).

## Tools that work alongside this policy

- [DADR](https://vincentarelbundock.github.io/dadr) (Data Analysis Decision Records) for recording why an analysis made each choice. Link a record from the log's `link` field.
- [GAIDeT Declaration Generator](https://github.com/panbibliotekar/gaidet-declaration) for producing a taxonomy-based statement.
- [AI Usage Cards](https://ai-cards.org) for a structured, machine-readable report.
- Cwik (2026) provides OSF templates for prompt logs and redaction, useful when a project does keep chat exports.
