The Surprising Math of Team Performance
================
2024-11-14

<!-- README.md is generated from README.Rmd. Please edit that file. -->

Communication is arguably the most cohesive force within a team. By
exchanging information, team members build relationships, establish
roles, and achieve goals. It is vital for and closely linked with
productivity (Dutta et al., 2021). Yet, communication can also have
unintended negative effects, sometimes even reducing team performance.
This can result from issues like…

- Coordination issues, such as:
  - Challenges in building quality relationships
  - Distractions from unrelated communication;
- Motivational issues, such as:
  - Reduced individual recognition as attention is divided
  - Goal ambiguity when too many people are involved in decisions
  - Decreased visibility of free-riding behaviour.

These types of issues are commonly described as the [Ringelmann
Effect](https://en.wikipedia.org/wiki/Ringelmann_effect) (Kravitz &
Martin, 1986), where overall group performance ends up being less than
the sum of individual contributions.

A simple [Shiny](https://shiny.rstudio.com/) app helps illustrate how
adding people to a team can affect its performance. This quantitative
perspective, inspired by Brooks (1995) and other sources, highlights
where misunderstandings about team performance often begin. Many ask,
“How many people do I need to…?” assuming that adding people is as
simple as stacking Lego™ bricks.

**Explore this app’s simulation to see how focusing only on team size
can be misleading.**

The app’s code is available
[here](https://github.com/SigurdJanson/CommunicationOverload) on
[GitHub](https://github.com), and a [live-version of the app on
shinyapps.io](https://js-rapps.shinyapps.io/communicationoverload/).

## Overview of the App

Below is a screenshot of the app interface: [![Screenshot of the
App](./vignettes/img/TeamCommunication_Overview.png)](https://js-rapps.shinyapps.io/communicationoverload/)

The **top panel** illustrates [Brooks’
law](https://en.wikipedia.org/wiki/Brooks%27s_law), showing the
increasing number of relationships a team must maintain as its size
grows. According to Brooks’ Law, the number of relationships `R` is
calculated as

$$ R = \frac{M * (M-1)}{2} $$ where `M` is the number of team members.
The chart visualizes this: each dot represents a team member linked to
all other members.

The **bottom panel** simulates potential negative effects of increasing
team size. Contrary to expectations, adding more members may decrease
overall performance. Adjust the slider to explore this dynamic.

**Choosing the Right Numbers**. This simulation’s purpose is not to find
an exact team size but to explore a range and understand performance
shifts. Consider these findings for context:

- In one study, Elsayed‐Elkhouly et al. (1997) found that executives
  spend about 30% of their time in meetings, with 35% of that time
  considered “wasted.” This translates to roughly 10% wasted time
  overall—a factor to consider in any team.

- In a scrum process, recommended scrum meeting times amount to
  12.5–22.5% of working hours (including refinement meetings) (Overeem,
  2018; Schwaber & Sutherland, 2020). However, real usage may be lower,
  as planning and refinement often serve productive purposes besides
  planning.

- Recommendations for team size in software projects generally fall
  between 5–9 members. Olivares et al. (2024) suggest 5–9, while
  Rodríguez et al. (2012) notes performance declines when team size
  exceeds 9. Assuming this guideline optimizes for peak performance,
  then % lost would be estimated at 12–24%, with peak productivity
  typically seen at 5–9 members.

## Interpreting the Simulation

This app provides a simplified way to explore the relationship between
team size and performance, offering insights that can raise awareness on
the topic:

> There is no linear relationship between team size and output.

Team performance does not simply grow with each new member added. In
fact, there may be a tipping point where adding another member even
decreases overall performance.

**Limitations**. Brooks’ Law and the simulation cannot predict specific
outcomes for every team. Even Brooks (1995) cautioned that this model is
“outrageously simplified” (Brooks, 1995, Chapter 19). Team performance
involves complex interactions and cannot be captured in precise figures.
Even if we were able to quantify each of the numerous variables (which
we never can) the relationships between those variables are complex and
convoluted. However, by examining team dynamics closely, we can draw
valuable insights for decision-making and identify best practices in
team management. Continue reading.

## How Productive Is My Team?

Team dynamics vary widely, so the simulation above is designed to
illustrate principles rather than to make precise predictions. Team
performance is influenced by many factors beyond size, and it’s
essential to consider not only the volume of output but also its
quality.

**Beyond time**. Time is a key productivity factor but far from the only
one. Other critical factors include work speed, trust among team members
(De Jong et al., 2016), clear role definitions, diversity (Haas &
Mortensen, 2016), task type and dependencies (Littlepage, 1991), degree
of specialization of members, or their experience.

**Unproductive ≠ wasted time**. In any team, not all unproductive time
is wasted time.

1.  Teams need time to establish and maintain social connections,
    routines, and ground rules, which indirectly support productivity.
    For instance, Scrum retrospective meetings aim to address obstacles,
    improve quality, and eliminate inefficiencies. While not directly
    contributing to output, this “unproductive” time is necessary for
    long-term performance; neglecting it risks stagnation or decline.

2.  Then there is wasted time—avoidable and unhelpful. Examples include
    inviting team members to irrelevant meetings, over-engineering
    solutions, or holding lengthy department updates with little
    relevance to attendees. Simple steps can reduce wasted time, like
    addressing meeting lateness, which was found to affect a third of
    meetings in a study by Rogelberg et al. (2013). Identifying wasted
    time can be as easy as gathering input from team members, as even
    small changes can significantly improve efficiency.

**Recovery speed**. Teams benefit immensely from a strong recovery
capacity after mistakes. Quick error identification and resolution are
essential; the longer a mistake goes unaddressed, the greater the
negative impact on productivity.

**N-wise**. Brooks’ Law simplifies team dynamics as pairs, but in
practice, team communication can include multiple members. For instance,
Tom, Deborah, and Maria could resolve an issue in a single group
conversation rather than through a series of pairwise exchanges. While
group discussions might take longer than one-on-one chats, they’re often
faster overall, especially when decisions are needed. Knowing when to
use pairwise versus group discussions is critical to avoiding
“ping-pong” communication loops and keeping decision-making efficient.
In my experience most people know intuitively how to choose.

**Quality**. A quantitative perspective alone doesn’t capture the
quality of communication within a team. Effective communication, as
defined by Marlow et al. (2018), involves the timely sharing of critical
and relevant information, ensuring that every team member is informed
and empowered to make decisions. High-quality communication is essential
to performance; quantity alone is ineffective without quality (Marlow et
al., 2018; Mueller, 2012). While numbers matter, they only add value if
quality is prioritized.

**Change**. Changes in team composition can disrupt performance, often
causing temporary setbacks or, in some cases, long-term decreases in
efficiency. Even short absences require other team members to adapt,
impacting productivity until the team adjusts.

Despite these limitations, Brooks’ Law provides valuable insights. In
fact, taken together, law plus limitations can be applied as a practical
tool for improving team performance. The next section outlines some
principles that can help do just that.

## Turning Limitations into a Tool

Combining insights from Haas & Mortensen (2016) with the findings
discussed here, we can use a set of practical questions to help teams
assess their potential and identify areas for improvement. The following
points provide a foundation for building and evaluating team
effectiveness.

**Clear and compelling direction**

- Does the team have a shared goal that is well-defined and motivating?
  Is it challenging enough to inspire without being out of reach?
- Is the goal significant for others outside the team?

**Strong structure**

- Does the team bring a diverse, complementary skill set?
- Is the team kept as small as possible to optimize communication and
  efficiency?
- Are team members individually accountable for completing their tasks?
- Are clear norms in place to guide expected behaviour and
  accountability?

**Supportive environment**

- Are essential resources, information, and training readily available?
- Is there dedicated time and space for team-wide information sharing?
- Is there a separate time for “going meta,” allowing members to reflect
  on team processes and identify improvements?
- Are meaningful rewards or recognition provided for team achievements?
- Does the team invest time to integrate new members, aligning them with
  the team’s goals, roles, and processes?

**Unified mindset**

- Do team members feel a strong, shared identity and sense of belonging?
- Is information easily and openly shared within the team?
- Is there mutual understanding and respect for each member’s unique
  limitations and circumstances?

## Summary

Achieving strong team performance is not simply about adding members or
increasing communication frequency; it requires a thoughtful balance of
team structure and meaningful communication practices. While this
discussion has focused on core aspects of team dynamics, other critical
factors also shape performance. In recent years, psychological safety
has gained attention as it emphasizes the need for open and honest
communication—encouraging team members to share without withholding
vital information (e.g. O’Donovan & McAuliffe, 2020). This foundation of
trust is essential for resilience, equipping teams with the flexibility
to adapt to shifting tasks, project phases, and team dynamics. These
topics deserve in-depth exploration on their own.

Tools and simulations, like those featured in this article, offer
valuable insights, yet successful teams are ultimately built on
intentional, people-centered practices. By cultivating these principles,
teams can effectively manage the complexities of collaboration,
transforming challenges into opportunities for sustained, high-quality
performance.

## Further reading

<div id="refs" class="references csl-bib-body hanging-indent"
line-spacing="2">

<div id="ref-Brooks1995" class="csl-entry">

Brooks, F. P. (1995).
*The mythical man-month: Essays on software engineering*
(Anniversary ed.). Addison-Wesley.

</div>

<div id="ref-DeJong2016" class="csl-entry">

De Jong, B. A., Dirks, K. T., & Gillespie, N. (2016). Trust and team
performance: A meta-analysis of main effects, moderators, and
covariates. *Journal of Applied Psychology*, *101*(8), 1134–1150.
<https://doi.org/10.1037/apl0000110>

</div>

<div id="ref-Dutta2021" class="csl-entry">

Dutta, A., Steiner, E., Proulx, J., Berisha, V., Bliss, D. W., Poole,
S., & Corman, S. (2021). Analyzing the relationship between productivity
and human communication in an organizational setting. *PLOS ONE*,
*16*(7), e0250301. <https://doi.org/10.1371/journal.pone.0250301>

</div>

<div id="ref-Elsayed-Elkhouly1997" class="csl-entry">

Elsayed‐Elkhouly, S. M., Lazarus, H., & Forsythe, V. (1997). Why is a
third of your time wasted in meetings? *Journal of Management
Development*, *16*(9), 672–676.
<https://doi.org/10.1108/02621719710190185>

</div>

<div id="ref-Haas2016" class="csl-entry">

Haas, M., & Mortensen, M. (2016). The secrets of great teamwork.
*Harvard Business Review*, *94*(6), 70–76.

</div>

<div id="ref-Kravitz1986" class="csl-entry">

Kravitz, D., & Martin, B. (1986). Ringelmann rediscovered: The original
article. *Journal of Personality and Social Psychology*, *50*, 936–941.
<https://doi.org/10.1037/0022-3514.50.5.936>

</div>

<div id="ref-Littlepage1991" class="csl-entry">

Littlepage, G. E. (1991). Effects of group size and task characteristics
on group performance: A test of steiner’s model. *Personality and Social
Psychology Bulletin*, *17*(4), 449–456.
<https://doi.org/10.1177/0146167291174014>

</div>

<div id="ref-Marlow2018" class="csl-entry">

Marlow, S. L., Lacerenza, C. N., Paoletti, J., Burke, C. S., & Salas, E.
(2018). Does team communication represent a one-size-fits-all approach?:
A meta-analysis of team communication and performance. *Organizational
Behavior and Human Decision Processes*, *144*, 145–170.
<https://doi.org/10.1016/j.obhdp.2017.08.001>

</div>

<div id="ref-Mueller2012" class="csl-entry">

Mueller, J. S. (2012). Why individuals in larger teams perform worse.
*Organizational Behavior and Human Decision Processes*, *117*(1),
111–124. <https://doi.org/10.1016/j.obhdp.2011.08.004>

</div>

<div id="ref-ODonovan2020" class="csl-entry">

O’Donovan, R., & McAuliffe, E. (2020). A systematic review exploring the
content and outcomes of interventions to improve psychological safety,
speaking up and voice behaviour. *BMC Health Services Research*,
*20*(1). <https://doi.org/10.1186/s12913-020-4931-2>

</div>

<div id="ref-Olivares2024" class="csl-entry">

Olivares, R., Noel, R., Guzmán, S. M., Miranda, D., & Munoz, R. (2024).
Intelligent learning-based methods for determining the ideal team size
in agile practices. *Biomimetics*, *9*(5), 292.
<https://doi.org/10.3390/biomimetics9050292>

</div>

<div id="ref-Overeem2018" class="csl-entry">

Overeem, B. (2018). *Myth 11: In scrum, we spend too much time in
meetings*. Blog at scrum.org.
<https://www.scrum.org/resources/blog/myth-11-scrum-we-spend-too-much-time-meetings>

</div>

<div id="ref-Rodriguez2012" class="csl-entry">

Rodríguez, D., Sicilia, M. A., García, E., & Harrison, R. (2012).
Empirical findings on team size and productivity in software
development. *Journal of Systems and Software*, *85*(3), 562–570.
<https://doi.org/10.1016/j.jss.2011.09.009>

</div>

<div id="ref-Rogelberg2013" class="csl-entry">

Rogelberg, S., Scott, C., Agypt, B., Williams, J., Kello, J.,
McCausland, T., & Olien, J. (2013). Lateness to meetings: Examination of
an unexplored temporal phenomenon. European journal of work and
organizational psychology. *European Journal of Work and Organizational
Psychology*, *23*. <https://doi.org/10.1080/1359432X.2012.745988>

</div>

<div id="ref-Schwaber2020" class="csl-entry">

Schwaber, K., & Sutherland, J. (2020). *The scrum guide* \[Guideline\].
<https://scrumguides.org/docs/scrumguide/v2020/2020-Scrum-Guide-US.pdf>

</div>

</div>

<!--
Quality over quantity
&#10;5.  As outlined above, some unproductive time is required to boost productivity in the remaining time. Do not remove everything that does not directly support productivity. A team needs to maintain itself.
&#10;Self-organising teams may need more time. In self-organisation some aspects that make the team are left to the team to work out by itself. That takes time. The idea is that self-organisation can lead to more effective team *in the long run*. Such teams are not necessarily more effective in the short run and not necessarily more efficient. At least Scrum tends to prioritise quality over quantity. [###LIT###TODO]
&#10;The most important pointer that I can give you is your team colleagues' satisfaction on the job. If you want to know about inefficiencies, just talk to them. 
&#10;-->
