# ai-use

Records of AI use in this repository, kept so that papers and releases carry an accurate AI-use statement. The protocol is at <https://github.com/CRASR/ai-use>. Field definitions and allowed values are in `data_dictionary.csv`.

| File | One row per |
|---|---|
| `ai_log.csv` | Episode of consequential AI use: a session on one task whose output could reach a paper, code, data, or a decision |
| `tools.csv` | AI tool and model version |
| `materials.csv` | Material with terms (license, confidentiality, manufacturer documentation) that could reach an AI tool |
| `data_dictionary.csv` | Field in the three tables above |

Exported AI sessions for Tier 3 work go in `sessions/`. Redact confidential material and say so in the file.

In an R package, add `^ai-use$` to `.Rbuildignore`. In a public repository this folder is public too, so keep client names and restricted details out of it.
