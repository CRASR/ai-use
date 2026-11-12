# Water and energy use of AI

A single chat-style text prompt uses roughly 0.2–0.4 Wh of electricity by current estimates. Agentic coding sessions use tens to hundreds of times more.

The larger concern is system-wide growth in data centers. That growth is raising electricity and water demand, including in Texas, where CRASR studies reservoirs and water quality.

This page summarizes the evidence, explains why the estimates differ, and lists what we do about it. Figures were compiled on 6 November 2026.

## Per-use estimates

| Use | Energy | Water | Source and scope |
|---|---|---|---|
| Median Gemini Apps text prompt (May 2025) | 0.24 Wh | 0.26 mL | [Google, Elsworth et al. 2025][google]. First-party measurement of the full serving stack. Water is on-site cooling only. Not independently verified. |
| Typical ChatGPT (GPT-4o) query | about 0.3 Wh | not estimated | [Epoch AI 2025][epoch]. Bottom-up estimate; long inputs and reasoning models cost substantially more. |
| Short GPT-4o query | 0.42 Wh | not shown here | [Jegham et al. 2025][jegham]. Infrastructure-aware benchmark of 30 models. |
| Long prompt to the most energy-intensive models | more than 29 Wh | not shown here | [Jegham et al. 2025][jegham]. Over 65 times the most efficient systems. |
| 400-token response from Mistral Large 2 | not reported (1.14 g CO2e) | 45 mL | [Mistral lifecycle analysis, July 2025][mistral]. A broader lifecycle boundary than Google's. |
| Median Claude Code session, one developer | about 41 Wh | not estimated | [Couch 2026][couch]. About 592,000 tokens over 24 requests; the author calls it napkin math. |
| Median Claude Code session, heavy use with subagents | about 600 Wh (range 250–1,200) | not estimated | [Hausfather 2026][hausfather]. About 150 Wh per typed prompt; uncertain by about a factor of 2. |

For scale: 0.3 Wh runs a 10 W LED bulb for about 2 minutes. 41 Wh runs it for about 4 hours. 600 Wh runs a 1,500 W microwave for about 24 minutes.

Anthropic, the maker of Claude, has not published per-prompt or per-token energy figures ([Hausfather 2026][hausfather]). Estimates for Claude tools are third-party conversions from token counts.

## Why the estimates differ

- **Energy boundary.** Counting only the AI chips gave Google 0.10 Wh for the same median prompt that the full serving stack puts at 0.24 Wh ([Google 2025][google]).
- **Water scope.** AI uses water in three ways ([Li et al. 2025][li]):
  - on-site cooling (scope 1)
  - generating the electricity (scope 2)
  - manufacturing the hardware (scope 3)

  Water withdrawal and water consumption are also different quantities. Google's 0.26 mL counts on-site cooling only, so figures with different scopes cannot be compared directly.
- **Size of the job.** Long contexts, reasoning modes, and agents multiply use. An agent re-reads its working context at every step, so a coding session processes hundreds of thousands to millions of tokens.
- **Place and time.** Carbon and water per kilowatt-hour depend on the local grid and cooling system.
- **Who measured.** First-party figures are measured but not independently verified. Third-party figures are independent but rest on assumptions about hardware the companies do not disclose.

## System scale

- **World.** Data centers used about 415 TWh in 2024, around 1.5% of world electricity. The International Energy Agency projects about 945 TWh by 2030, with AI the main driver ([IEA 2025][iea]).
- **United States.** Data centers used 176 TWh in 2023, 4.4% of U.S. electricity. Projections for 2028 are 325–580 TWh, or 6.7–12% of U.S. electricity. Direct water use was about 66 billion liters (about 17 billion gallons) in 2023 ([Shehabi et al. 2024][lbnl]; [summary][dcd]).
- **Texas.** Texas data centers used about 25 billion gallons of water in 2025, direct and indirect, which is about 0.4% of statewide use. By 2030 that could reach 29–161 billion gallons per year, up to 2.7% of statewide use ([HARC 2026][harc]). The State Water Plan is updated every five years, so data centers that began operating in 2025 are not yet counted in statewide demand ([summary][harc-summary]).

For a center that studies Texas reservoirs, this system-level growth matters more than any single prompt. Data center demand draws on the same supplies that state water planning allocates.

## What we try to do

1. **Use AI where it is proportionate.** Skip it for tasks a script, search, or reference handles as well; see "Before using AI" in [POLICY.md](POLICY.md).
2. **Choose the smallest adequate model.** Mistral reports that a model ten times larger has roughly ten times the impact for the same number of tokens ([Mistral 2025][mistral]). Reasoning modes and the largest models are for tasks that need them.
3. **Keep agent sessions lean.** Give clear task definitions, start fresh sessions when the task changes, and stop loops that are not converging.
4. **Have AI write reusable scripts** for repeated jobs, rather than calling AI again for each repetition.
5. **Estimate heavy use where practical.** For projects with heavy agentic use, record monthly token totals from the tool's usage report, convert them with a stated per-token factor, and label the result as an estimate.
6. **Favor transparent providers.** Where options exist, prefer providers that publish per-use energy and water figures, and ask vendors for them.

Cutting individual use is an inefficient climate lever compared with supporting the transition to clean energy ([Couch 2026][couch]). System-level outcomes depend mostly on providers, utilities, and regulators. Our main contributions are proportionate use, transparent reporting, and research on the water supplies at stake.

## Sources

- Elsworth, C. et al. (2025). Measuring the environmental impact of delivering AI at Google scale. arXiv:2508.15734. https://arxiv.org/abs/2508.15734
- You, J. (2025). How much energy does ChatGPT use? Epoch AI. https://epoch.ai/gradient-updates/how-much-energy-does-chatgpt-use
- Jegham, N., Abdelatti, M., Elmoubarki, L. & Hendawi, A. (2025). How Hungry is AI? Benchmarking Energy, Water, and Carbon Footprint of LLM Inference. arXiv:2505.09598. https://arxiv.org/abs/2505.09598
- Mistral AI (2025). Lifecycle analysis of Mistral Large 2, reported in [The Decoder](https://the-decoder.com/mistral-ai-publishes-the-first-comprehensive-life-cycle-assessment-of-a-large-language-model/).
- Couch, S. P. (2026). Electricity use of AI coding agents. https://simonpcouch.com/blog/2026-01-20-cc-impact/
- Hausfather, Z. (2026). The real energy use of agentic AI. *The Climate Brink*, reposted at https://skepticalscience.com/print.php?n=6600
- Li, P., Yang, J., Islam, M. A. & Ren, S. (2025). Making AI Less "Thirsty": Uncovering and Addressing the Secret Water Footprint of AI Models. *Communications of the ACM*. arXiv:2304.03271. https://arxiv.org/abs/2304.03271
- International Energy Agency (2025). Energy and AI. Summary: https://www.nsenergybusiness.com/analysis/energy-and-ai-key-findings-from-the-iea/
- Shehabi, A. et al. (2024). 2024 United States Data Center Energy Usage Report. LBNL-2001637. https://doi.org/10.71468/P1WC7Q
- Houston Advanced Research Center (2026). Thirsty Data and the Lone Star State: The Impact of Data Center Growth on Texas' Water Supply. https://harcresearch.org/news/texas-data-center-boom-could-consume-up-to-161-billion-gallons-of-water-annually-by-2030/

[google]: https://arxiv.org/abs/2508.15734
[epoch]: https://epoch.ai/gradient-updates/how-much-energy-does-chatgpt-use
[jegham]: https://arxiv.org/abs/2505.09598
[mistral]: https://the-decoder.com/mistral-ai-publishes-the-first-comprehensive-life-cycle-assessment-of-a-large-language-model/
[couch]: https://simonpcouch.com/blog/2026-01-20-cc-impact/
[hausfather]: https://skepticalscience.com/print.php?n=6600
[li]: https://arxiv.org/abs/2304.03271
[iea]: https://www.nsenergybusiness.com/analysis/energy-and-ai-key-findings-from-the-iea/
[lbnl]: https://doi.org/10.71468/P1WC7Q
[dcd]: https://www.datacenterdynamics.com/en/news/doe-data-centers-consumed-44-of-us-power-in-2023-could-hit-12-by-2028
[harc]: https://harcresearch.org/news/texas-data-center-boom-could-consume-up-to-161-billion-gallons-of-water-annually-by-2030/
[harc-summary]: https://smartwatermagazine.com/news/smart-water-magazine/texas-data-center-boom-may-slash-billions-gallons-state-water-supplies
