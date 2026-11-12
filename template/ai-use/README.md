# ai-use

A short record of AI use in this repository, kept so papers and releases can carry an accurate AI-use statement. The policy is at <https://github.com/CRASR/ai-use/blob/main/POLICY.md>. Field definitions and allowed values are in `data_dictionary.csv`.

| File | One row per |
|---|---|
| `ai_log.csv` | Episode of Tier 2–3 AI use (Tier 1 optional): a session on one task whose output could reach a paper, code, data, or a decision |
| `tools.csv` | AI tool and model version |
| `materials.csv` | Material with terms (license, confidentiality, manufacturer documentation) that could reach an AI tool |
| `data_dictionary.csv` | Field in the three tables above |

From R:

```r
source("https://raw.githubusercontent.com/CRASR/ai-use/main/R/ai_use.R")
ai_log(tool = "claude-code-opus-5.5", stage = "software", task = "Draft model code",
       output_type = "code", tier = 3, disposition = "modified",
       human_contribution = "Specified priors", verification = "Parameter recovery",
       link = "commit abc123")
ai_use_check()       # validate the tables
ai_use_statement()   # draft a statement from the log
```

Chat exports are optional. If you keep any, put them in `sessions/` and redact confidential material. In a public repository this folder is public too, so keep client names and restricted details out of it.
