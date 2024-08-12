The code is available at

https://www.federalreserve.gov/econres/feds/linver-the-linear-version-of-frbus.htm

See their Readme.pdf and documentation as well as variable definition.

Here, we provide the Matlab files. Our model variants are all simulated running stochsims.m (until make_runmod) using the option:
elb_imposed = "no";

We used the four different options for setting expectations.
• expvers_mceall — all agents have model-consistent (MC) expectations
• expvers_var    — all agents have expectations based on the predictions of small-scale VAR models
• expvers_mcap   — financial market participants have MC expectations while agents in other sectors have VAR-based expectations
• expvers_mcapwp — financial market participants and wage and price setters have MC expectations while other agents have VAR-based expectations

Since we use the MMB policy rule, mprule is not important.