The Surprising Math of Team Performance
================
2024-11-13

<!-- README.md is generated from README.Rmd. Please edit that file. -->

Communication is arguably the most cohesive force within a team. By
exchanging information, team members build relationships, establish
roles, and achieve goals. Yet, communication can also have unintended
negative effects, sometimes reducing team performance. This can result
from issues like…

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

  unless you follow a sophisticated scientific approach.

In essence, **the link between team communication and performance seems
to be stronger when you focus on the quality, rather than the quantity
of communication**. Yet, it is still essential that quantity does not
necessarily improve performance and that every change disrupts an
effective systems causing at least temporary performance losses and
maybe also a long-term decrease of cost-benefit ratio.

Furthermore, you can use the assumptions behind Brooks Law and convert
them into a tool. That is what the next section is about.

## Making tools out of flaws or How productive is my team?

Would it not be fantastic to have a formula for that? Unfortunately, we
do not. The relationships are convoluted. The law is based on several
limiting assumptions:

1.  Time is only one factor for productivity. An important one, for
    sure. But there are other factors, as well. Such factors are clarity
    of roles, work speed, experience of team members, degree of
    specialisation in the team, cultural diversity, type of task, … the
    list goes on.

2.  Also noteworthy is the fact that team performance must not only be
    understood in terms of output volume. Quality is essential, too.

3.  In teams, there is necessary unproductive time and then there is
    wasted time.

    1.  Teams need to maintain internal and external social
        relationships, rules and routines. If this is neglected, it can
        have a negative impact on productivity. The best example is
        retrospective meetings in Scrum. Their purpose is to identify
        obstacles, eliminate time wasters and misunderstandings and
        ensure quality standards. This time is unproductive in a sense
        that it does not directly contribute to the output, but if we
        ignore this, team performance will suffer.
    2.  Additionally, there is wasted time. Inviting someone to a
        meeting to which they cannot contribute. The quest to exceed
        necessary quality standards, striving for a more elegant
        solution that does not help the business. Department meetings
        filled with information employees cannot relate to. These are
        common examples. Wasted time can be eliminated. You can find the
        most obvious cases of wasted time by simply asking around.

4.  As outlined above, some unproductive time is required to boost
    productivity in the remaining time. Do not remove everything that
    does not directly support productivity. A team needs to maintain
    itself.

5.  The law reduces team dynamics to pairwise relationships. If there
    was a problem, then Tom talks to Deborah, Deborah talks to Maria,
    and Maria talks to Tom. This way we have three conversations, each
    of them takes - let us say - 10 minutes. But what if the three come
    together and talk together? The threewise conversation may take
    longer then a pairwise one but it should be briefer than 30 minutes.

It depends on many factors

- Self-organising teams may need more time.
- Let us not forget that it changes over time. A newly assembled team
  needs extra time. And every time the team setup changes, the team may
  need to renegotiate some rules. (if only for a few weeks)
- Meeting lateness alone can have a considerable impact. In the study by
  Rogelberg et al. (2013) 1/3 of the meetings did not start at the
  appointed time. Apart from numerous side effects, that can be a
  considerable loss of time.

Here are a few pointers:

- In one study, Elsayed‐Elkhouly, Lazarus, and Forsythe (1997) found
  that executives spend 30% of their time in meetings and 35% of it can
  be considered wasted. That makes around 10% of wasted time.
- In a scrum process the official recommendations for scrum meetings sum
  up to a percentage between 12.5% and 22.5% (incl. refinement meetings)
  (Overeem 2018; Schwaber and Sutherland 2020). In my opinion, the real
  percentage is most likely lower, because to a degree these meetings
  serve productive purposes, as well, especially refinement and planning
  meetings.
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


## Further reading

<div id="refs" class="references csl-bib-body hanging-indent"
line-spacing="2">

<div id="ref-Brooks1995" class="csl-entry">

Brooks, F. P. (1995).
*The mythical man-month: Essays on software engineering*
(Anniversary ed.). Addison-Wesley.

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
