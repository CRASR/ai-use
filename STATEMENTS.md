# Writing AI-use statements

Write one full statement from the log, then place its parts where the venue requires. The full version satisfies the strictest venue, so trimming is safer than adding later.

## Steps

1. Filter `ai_log.csv` to Tier 1–3 rows and group them by `stage`.
2. Ask each co-author about their own AI use on the work. The statement covers all authors.
3. Fill in the template below. Tier 3 rows also get a Methods paragraph and a supplement table with these columns: stage, task, tool, human contribution, verification, and record location.
4. Place the parts as the venue table requires. Answer any AI question in the submission system with the same facts.
5. Archive the `ai-use/` folder with the code, on Zenodo or in the package repository, and note any redactions.

## Every statement covers

- [ ] Tools: product, model and version, provider, access mode, dates
- [ ] Tasks by stage
- [ ] What the authors decided or created, and how outputs were checked
- [ ] What AI was not used for, when that is informative (drafting text, generating data or figures)
- [ ] Material shared with AI tools: none, public only, or restricted and under what settings
- [ ] Where the record is archived
- [ ] A responsibility sentence

## Template

```markdown
**Use of AI tools.** [Tool, model/version (provider)], accessed through [interface] from [month year] to [month year], assisted with [stage: task; stage: task]. For [Tier 2–3 task], the authors [decision or design they made]; outputs were checked by [specific check and evidence]. AI tools were not used to draft manuscript text or to generate or alter data or figures. [No unpublished or restricted third-party material was shared with AI tools. | <Material> was shared under settings that exclude it from model training.] The AI-use log, [exported sessions,] and code are archived at [DOI]. The authors take full responsibility for the content of this work.
```

## Worked examples

Both examples are illustrative. Replace every bracketed or specific detail with what the log shows.

**Research paper, Methods placement**

```markdown
**Use of AI tools.** Claude (Opus 5.5, Anthropic), accessed through claude.ai and Claude Code from [month year] to [month year], assisted with methodology (critiquing candidate model structures), software (drafting Stan and R code for the hierarchical model and its posterior predictive checks), and writing – review and editing (clarity feedback on the Discussion). The author specified the model structure, priors, and causal assumptions. AI-drafted model code was checked by recovering known parameters from simulated data and by prior and posterior predictive checks. AI tools were not used to draft manuscript text or to generate or alter data or figures. No unpublished third-party data were shared with AI tools. The AI-use log and code are archived at [DOI]. The author takes full responsibility for the content of this work.
```

**Software paper (JOSS) or rOpenSci submission**

```markdown
**AI usage disclosure.** Claude Code ([model as displayed], Anthropic) was used from [month year] to [month year] for code generation, refactoring, test scaffolding, and first drafts of function documentation in [modules]. The author designed the package architecture, the [data model], and the user workflow. All AI-generated code was reviewed, modified, and validated by the author, with unit tests against [recorded instrument logs] and [bench tests]. [Manufacturer documentation was used only to extract command specifications, restated in the author's own words; no manual text is reproduced in the package.] The AI-use log is in `ai-use/` in the repository.
```

## Venue reference

Placement varies by venue. Almost every venue requires the tool, what it was used for, and a statement of human responsibility.

These policies were checked on 6 November 2026. Check the live page before you submit, because a journal's rules can be stricter than its publisher's.

| Venue (examples) | Where it goes | Must include | Not disclosed | Source checked |
|---|---|---|---|---|
| Wiley (*Ecology*, *Limnology & Oceanography*, *Global Change Biology*) | Methods, a disclosure statement, or Acknowledgements | Transparent description of the use, including reference gathering and translation | Spelling, grammar, general editing | [Enago summary](https://www.enago.com/responsible-ai-movement/publisher-ai-guidelines/wiley-ai-guidelines/), updated 1 Apr 2026 (secondary) |
| AGU (*Water Resources Research*, *JGR Biogeosciences*) | Materials and Methods or similar | Which tool, and how it was used, for writing, images, or data collection and analysis | No exemption stated | [AGU text and graphics requirements](https://www.agu.org/publications/authors/journals/text-graphics-requirements) (official) |
| Springer Nature (*Biogeochemistry*, *Ecosystems*) | Methods, or a suitable alternative | Documentation of LLM use | AI copy-editing of human-written text | [Springer editorial policy](https://www.springer.com/de/editorial-policies/artificial-intelligence--ai-/25428500) (official) |
| Elsevier (*Water Research*, *Science of the Total Environment*) | Own section before References; research-process use in Methods | Tool, purpose, author review and responsibility | Basic grammar, spelling, and punctuation checks | [CASRAI summary](https://casrai.org/guides/elsevier-generative-ai-authorship-policy), verified 16 Aug 2026 (secondary) |
| ACS (*Environmental Science & Technology*) | Acknowledgments; full details in Methods for substantial use; figure captions for AI-assisted graphics | When and how the tools were used | None listed | [Enago summary](https://www.enago.com/responsible-ai-movement/publisher-ai-guidelines/ACS-ai-guidelines), updated 1 Apr 2026 (secondary) |
| Science / AAAS | Cover letter, plus Methods (research use) or Acknowledgments (writing) | Model name and version. Whether full prompts are required is reported inconsistently. | Reported to exempt language-clarity edits | [Manusights summary](https://manusights.com/blog/science-ai-policy) (secondary; check the current AAAS guidelines) |
| JOSS | An AI usage disclosure section in the paper | Tools and versions and where they were applied; scope of help; affirmation that humans reviewed and validated the output and made the core design decisions | Not specified | [JOSS policies](https://joss.readthedocs.io/en/latest/policies.html) (official) |
| rOpenSci software review | Submission template checkbox and description | Description of the use, with links to the relevant parts of the repository | Not specified | [rOpenSci news, March 2026](https://ropensci.org/blog/2026/03/30/news-mars-2026/) (official) |

None of these publishers allows AI to be listed as an author. Wiley bars AI from creating or altering original research data or results. Springer Nature does not permit generative-AI images except in narrow cases.
