# Water and energy use of AI

A short summary of current research, compiled November 2026.

**Per use, the footprint is small but uncertain.** A typical text prompt uses roughly 0.2–0.4 Wh of electricity, about what a 10 W LED bulb uses in two minutes ([Elsworth et al. 2025][google]; [You 2025][epoch]). Long inputs, reasoning modes, the largest models, and coding agents can use tens to hundreds of times more ([Jegham et al. 2025][jegham]; [Couch 2026][couch]). Water estimates range from under 1 mL to tens of mL per response, depending on whether they count on-site cooling only or also the water used to generate electricity and make hardware ([Li et al. 2025][li]; [Mistral 2025][mistral]). Several providers, including Anthropic, publish no per-use figures, so many estimates rest on assumptions about undisclosed hardware ([Hausfather 2026][hausfather]).

**At system scale, the growth is large.** Data centers used about 1.5% of world electricity in 2024, and that is projected to more than double by 2030 with AI as the main driver ([IEA 2025][iea]). In the United States they used 4.4% of electricity in 2023, projected to reach 6.7–12% by 2028 ([Shehabi et al. 2024][lbnl]). Texas data centers used about 25 billion gallons of water in 2025 (about 0.4% of statewide use), which could grow to 29–161 billion gallons per year by 2030 ([HARC 2026][harc]).

**Why it matters here.** For a center that studies Texas reservoirs, system-level demand matters more than any single prompt: data centers draw on the same water supplies that state planning allocates. We use AI where it is useful and proportionate (see "Before using AI" in [POLICY.md](POLICY.md)), and we see our main contribution as research on the water supplies at stake.

## Sources

Full references, each with a one-line note, are in the [reading list](references/reading-list.md), also published at [crasr.github.io](https://crasr.github.io/projects/ai-reading-list.html). Download them as [BibTeX](references/ai-science-reading-list.bib) or [RIS](references/ai-science-reading-list.ris).

[google]: https://doi.org/10.48550/arXiv.2508.15734
[epoch]: https://epoch.ai/gradient-updates/how-much-energy-does-chatgpt-use
[jegham]: https://doi.org/10.48550/arXiv.2505.09598
[mistral]: https://mistral.ai/news/our-contribution-to-a-global-environmental-standard-for-ai
[couch]: https://simonpcouch.com/blog/2026-01-20-cc-impact/
[hausfather]: https://www.theclimatebrink.com/p/the-real-energy-use-of-agentic-ai
[li]: https://doi.org/10.1145/3724499
[iea]: https://www.iea.org/reports/energy-and-ai
[lbnl]: https://doi.org/10.71468/P1WC7Q
[harc]: https://harcresearch.org/news/texas-data-center-boom-could-consume-up-to-161-billion-gallons-of-water-annually-by-2030/
