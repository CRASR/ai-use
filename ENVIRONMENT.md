# Water and energy use of AI

A short summary of current research, compiled November 2026.

**Per use, the footprint is small but uncertain.** A typical text prompt uses roughly 0.2–0.4 Wh of electricity, about what a 10 W LED bulb uses in two minutes ([Elsworth et al. 2025][google]; [You 2025][epoch]). Long inputs, reasoning modes, the largest models, and coding agents can use tens to hundreds of times more ([Jegham et al. 2025][jegham]; [Couch 2026][couch]). Water estimates range from under 1 mL to tens of mL per response, depending on whether they count on-site cooling only or also the water used to generate electricity and make hardware ([Li et al. 2025][li]; [Mistral 2025][mistral]). Several providers, including Anthropic, publish no per-use figures, so many estimates rest on assumptions about undisclosed hardware ([Hausfather 2026][hausfather]).

**At system scale, the growth is large.** Data centers used about 1.5% of world electricity in 2024, and that is projected to more than double by 2030 with AI as the main driver ([IEA 2025][iea]). In the United States they used 4.4% of electricity in 2023, projected to reach 6.7–12% by 2028 ([Shehabi et al. 2024][lbnl]). Texas data centers used about 25 billion gallons of water in 2025 (about 0.4% of statewide use), which could grow to 29–161 billion gallons per year by 2030 ([HARC 2026][harc]).

**Why it matters here.** For a center that studies Texas reservoirs, system-level demand matters more than any single prompt: data centers draw on the same water supplies that state planning allocates. We use AI where it is useful and proportionate (see "Before using AI" in [POLICY.md](POLICY.md)), and we see our main contribution as research on the water supplies at stake.

## Sources

- Couch, S. P. (2026). Electricity use of AI coding agents. https://simonpcouch.com/blog/2026-01-20-cc-impact/
- Elsworth, C. et al. (2025). Measuring the environmental impact of delivering AI at Google scale. arXiv:2508.15734. https://arxiv.org/abs/2508.15734
- Hausfather, Z. (2026). The real energy use of agentic AI. *The Climate Brink*, reposted at https://skepticalscience.com/print.php?n=6600
- Houston Advanced Research Center (2026). Thirsty Data and the Lone Star State: The Impact of Data Center Growth on Texas' Water Supply. https://harcresearch.org/news/texas-data-center-boom-could-consume-up-to-161-billion-gallons-of-water-annually-by-2030/
- International Energy Agency (2025). Energy and AI. Summary: https://www.nsenergybusiness.com/analysis/energy-and-ai-key-findings-from-the-iea/
- Jegham, N., Abdelatti, M., Elmoubarki, L. & Hendawi, A. (2025). How Hungry is AI? Benchmarking Energy, Water, and Carbon Footprint of LLM Inference. arXiv:2505.09598. https://arxiv.org/abs/2505.09598
- Li, P., Yang, J., Islam, M. A. & Ren, S. (2025). Making AI Less "Thirsty": Uncovering and Addressing the Secret Water Footprint of AI Models. *Communications of the ACM*. arXiv:2304.03271. https://arxiv.org/abs/2304.03271
- Mistral AI (2025). Lifecycle analysis of Mistral Large 2, reported in [The Decoder](https://the-decoder.com/mistral-ai-publishes-the-first-comprehensive-life-cycle-assessment-of-a-large-language-model/).
- Shehabi, A. et al. (2024). 2024 United States Data Center Energy Usage Report. LBNL-2001637. https://doi.org/10.71468/P1WC7Q
- You, J. (2025). How much energy does ChatGPT use? Epoch AI. https://epoch.ai/gradient-updates/how-much-energy-does-chatgpt-use

[google]: https://arxiv.org/abs/2508.15734
[epoch]: https://epoch.ai/gradient-updates/how-much-energy-does-chatgpt-use
[jegham]: https://arxiv.org/abs/2505.09598
[mistral]: https://the-decoder.com/mistral-ai-publishes-the-first-comprehensive-life-cycle-assessment-of-a-large-language-model/
[couch]: https://simonpcouch.com/blog/2026-01-20-cc-impact/
[hausfather]: https://skepticalscience.com/print.php?n=6600
[li]: https://arxiv.org/abs/2304.03271
[iea]: https://www.nsenergybusiness.com/analysis/energy-and-ai-key-findings-from-the-iea/
[lbnl]: https://doi.org/10.71468/P1WC7Q
[harc]: https://harcresearch.org/news/texas-data-center-boom-could-consume-up-to-161-billion-gallons-of-water-annually-by-2030/
