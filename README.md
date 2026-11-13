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
- **Proportion.** Use AI where the benefit justifies its energy and water costs.

## Contents

| Path | What it is |
|---|---|
| [POLICY.md](POLICY.md) | The policy: principles, questions to ask first, risk tiers, records, and how to write a statement |
| [ENVIRONMENT.md](ENVIRONMENT.md) | A short summary of research on the energy and water use of AI, including in Texas |
| [template/ai-use/](template/ai-use) | The folder to copy into a project: log, tool and material tables, data dictionary |
| [R/ai_use.R](R/ai_use.R) | R helper to download the template, add log rows, validate the tables, and draft a statement |
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
| Peer review | Review material never goes to AI tools | NIH 2023; NSF 2023; Hosseini & Horbach 2023 |
| One policy for all venues | Meet the shared core of publisher rules | COPE 2023; ICMJE 2026; STM 2025; European Commission 2026 |

### Disclosure and documentation frameworks

- Cwik, J. C. (2026). Disclosure is not documentation: an open science framework for documenting generative AI use in scholarly research and publication workflows. *Research Integrity and Peer Review* 11: 47. https://doi.org/10.1186/s41073-026-00245-8
- Hosseini, M., Gordijn, B., Kaebnick, G. E. & Holmes, K. (2025). Disclosing generative AI use for writing assistance should be voluntary. *Research Ethics*. https://doi.org/10.1177/17470161251345499
- Hosseini, M., Resnik, D. B. & Holmes, K. (2023). The ethics of disclosing the use of artificial intelligence tools in writing scholarly manuscripts. *Research Ethics*. https://doi.org/10.1177/17470161231180449
- Resnik, D. B. & Hosseini, M. (2025). Disclosing artificial intelligence use in scientific research and publication: When should disclosure be mandatory, optional, or unnecessary? *Accountability in Research*. https://doi.org/10.1080/08989621.2025.2481949
- STM Association (2025). *Recommendations for a Classification of AI Use in Academic Manuscript Preparation*. https://stm-assoc.org/document/recommendations-for-a-classification-of-ai-use-in-academic-manuscript-preparation/
- Suchikova, Y., Tsybuliak, N., Teixeira da Silva, J. A. & Nazarovets, S. (2025). GAIDeT (Generative AI Delegation Taxonomy): a taxonomy for humans to delegate tasks to generative artificial intelligence in scientific research and publishing. *Accountability in Research*. https://doi.org/10.1080/08989621.2025.2544331
- Wahle, J. P., Ruas, T., Mohammad, S. M., Meuschke, N. & Gipp, B. (2023). AI Usage Cards: Responsibly reporting AI-generated content. *2023 ACM/IEEE Joint Conference on Digital Libraries (JCDL)*, 282–284. https://doi.org/10.1109/JCDL57899.2023.00060
- Weaver, K. D. (2024). The Artificial Intelligence Disclosure (AID) Framework: An introduction. *College & Research Libraries News* 85(10): 407–411. https://doi.org/10.5860/crln.85.10.407
- World Bank. Documenting AI use for reproducible research. https://worldbank.github.io/wb-reproducible-research-repository/guidance/AI_reproducibility_guidelines.html

### Research integrity, peer review, publisher, and funder guidance

- Castellacci, F., Ciarli, T., Gao, Y., Marino, M., Marzi, G., Riccaboni, M., Savona, M. & Vannuccini, S. (2026). Generative artificial intelligence in scientific research: individual benefits, collective risks, and a framework for responsible research with AI. arXiv:2607.24879. https://doi.org/10.48550/arXiv.2607.24879
- Committee on Publication Ethics (2023). Authorship and AI tools: COPE position statement. https://publicationethics.org/cope-position-statements/ai-author
- European Commission, ERA Forum (2026). *Living guidelines on the responsible use of generative AI in research*, third version. https://research-and-innovation.ec.europa.eu/news/all-research-and-innovation-news/updated-era-living-guidelines-responsible-use-generative-ai-research-2026-05-08_en
- International Committee of Medical Journal Editors (2026). Recommendations, Section V: Use of artificial intelligence in publishing (updated January 2026). https://www.icmje.org/recommendations/browse/artificial-intelligence/
- Knöchel, T.-D., Schweizer, K. J., Acar, O. A., et al. (2025). Core principles of responsible generative AI usage in research. *AI and Ethics* 5: 6371–6377. https://doi.org/10.1007/s43681-025-00768-8
- Hosseini, M. & Horbach, S. P. J. M. (2023). Fighting reviewer fatigue or amplifying bias? Considerations and recommendations for use of ChatGPT and other large language models in scholarly peer review. *Research Integrity and Peer Review* 8: 4. https://doi.org/10.1186/s41073-023-00133-5
- National Institutes of Health (2023). The use of generative artificial intelligence technologies is prohibited for the NIH peer review process. NOT-OD-23-149. https://grants.nih.gov/grants/guide/notice-files/NOT-OD-23-149.html
- National Science Foundation (2023). Notice to research community: Use of generative artificial intelligence technology in the NSF merit review process. https://www.nsf.gov/news/notice-to-the-research-community-on-ai
- *The Scholarly Kitchen* (2026). Guest post: Research needs a shared standard for AI disclosure. https://scholarlykitchen.sspnet.org/2026/07/13/guest-post-research-needs-a-shared-standard-for-ai-disclosure/

### Writing and learning

- Amano, T., Ramírez-Castañeda, V., Berdejo-Espinola, V., et al. (2023). The manifold costs of being a non-native English speaker in science. *PLOS Biology* 21(7): e3002184. https://doi.org/10.1371/journal.pbio.3002184
- Berdejo-Espinola, V. & Amano, T. (2023). AI tools can improve equity in science. *Science* 379: 991. https://doi.org/10.1126/science.adg9714
- Kosmyna, N., Hauptmann, E., Yuan, Y. T., Situ, J., Liao, X.-H., Beresnitzky, A. V., Braunstein, I. & Maes, P. (2025). Your brain on ChatGPT: Accumulation of cognitive debt when using an AI assistant for essay writing task. arXiv:2506.08872. https://doi.org/10.48550/arXiv.2506.08872
- *Nature Reviews Bioengineering* (2025). Writing is thinking. *Nature Reviews Bioengineering* 3: 431. https://doi.org/10.1038/s44222-025-00323-4

### Using AI in scientific computing

- King, R. A., Abowd, L., Broderick, C. W., et al. (2026). Ten simple rules for effective use of generative AI for code development in environmental science. *PLOS Computational Biology* 22(8): e1014627. https://doi.org/10.1371/journal.pcbi.1014627
- Shen, J. H. & Tamkin, A. (2026). How AI impacts skill formation. arXiv:2601.20245. https://doi.org/10.48550/arXiv.2601.20245
- Smith, G. R., Bello, C., Bialic-Murphy, L., et al. (2024). Ten simple rules for using large language models in science, version 1.0. *PLOS Computational Biology* 20(1): e1011767. https://doi.org/10.1371/journal.pcbi.1011767
- Arel-Bundock, V. DADR: Data Analysis Decision Records. https://vincentarelbundock.github.io/dadr

Sources for the energy and water figures are listed in [ENVIRONMENT.md](ENVIRONMENT.md#sources).

## Reuse

The text and templates are licensed under [CC BY 4.0](LICENSE). To credit the work, cite:

> CRASR, Baylor University (2026). *ai-use: policy and templates for documenting and disclosing AI use in research.* https://github.com/CRASR/ai-use

Suggestions and corrections are welcome as issues.

## Use of AI tools in this repository

Claude (Opus 5.5, Anthropic), accessed through claude.ai in November 2026, located the frameworks, policies, and energy and water studies cited here; drafted the policy, environment page, templates, and the R helper; and checked the citations against their published records. Caleb Robbins set the purpose, scope, and requirements[, reviewed and edited the text, and checked the cited sources]. The R helper was tested on a sample project. No unpublished or restricted material was shared with AI tools. The record is in [ai-use/](ai-use). The maintainer takes full responsibility for the content.

Maintainer: CRASR, Baylor University.
