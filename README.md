Team Communication Load
================
2022-07-17

<!-- README.md is generated from README.Rmd. Please edit that file. -->

Communication is probably the one positive and cohesive force in a team.
Through the exchange of information the team accomplishes tasks, it
builds relationships, and establishes roles. Sometimes, however,
communication can have unwanted side effects and reduce the performance
of a team. That can caused by …

-   Coordination problems, e.g.
    -   an increased difficulty to develop quality relationships
    -   or unrelated communication that does not contribute to
        performance;
-   Motivation problems, e.g.
    -   less recognition when other team members get some of the
        attention,
    -   less clarity of goals when more people try to influence them,
    -   or a decreased visibility of free-riding behaviour.

Observations like this are often summarised as the [Ringelmann
Effect](https://en.wikipedia.org/wiki/Ringelmann_effect).

This simple [Shiny](https://shiny.rstudio.com/) app to demonstrate how
it affects a team when you add people. This quantitative perspective is
inspired by Brooks (1995) and various posts on the net. Though a
quantitative view only tells a part of the story the misunderstandings
about team performance usually start there. “How many people do I need
to …?” To some degree there lurks an assumption behind that question.
That people were Lego™ bricks that could be randomly rearranged.

**Use the simulation of this app to get a glimpse how misleading it can
be to just look at the number of people in a team.**

The code for the app is hosted
[here](https://github.com/SigurdJanson/CommunicationOverload) on
[GitHub](https://github.com). You can also find a [live-version of the
app on
shinyapps.io](https://js-rapps.shinyapps.io/communicationoverload/).

## App overview

Screenshot of the App [![Screenshot of the
App](./vignettes/img/TeamCommunication_Overview.png)](https://js-rapps.shinyapps.io/communicationoverload/)
.

The **top panel** shows [Brooks’
law](https://en.wikipedia.org/wiki/Brooks%27s_law): the number of
relationships a team has to establish and maintain depending on the
number of team members. Brooks’ law computes the number of relationships
`R` as

![ R = \\frac{M \* (M-1)}{2} ](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;%20R%20%3D%20%5Cfrac%7BM%20%2A%20%28M-1%29%7D%7B2%7D%20 " R = \frac{M * (M-1)}{2} ")

with `M` being the number of team members. The chart visualises the
relationships. Each dot is a team member connected to all the other team
members.

The **bottom panel** simulates a possible negative effects it may have
to add team members. Instead of an increase in performance it may very
well happen that performance decreases. Adjust the slider to get a
feeling for this.

## What does the simulation mean?

**What it can do**. This app illustrates basic relationships between
team size and performance. It can be used to instill awareness and teach
about the topic.

**What it cannot do**. Please note that Brooks’ law and the simulation
cannot predict what happens in your team. For two reasons:

-   The assumed “mechanics” in the team may be very different in your
    case. The simulation makes assumptions to **illustrate a basic
    principle**. It does not make a specific prediction.
-   The quantitative view on the team does not say anything about the
    **quality of communication**. That is more important than the
    quantity. Quantitative effects may be superimposed by qualitative
    ones. That does not mean that the quantitative approach loses
    meaning. It means, that it may be impossible to observe what this
    app predicts unless you follow a sophisticated scientific approach.

In essence, **the link between team communication and performance seems
to be stronger when you focus on the quality, rather than the quantity
of communication**. Yet, it is still essential that quantity does not
necessarily improve performance and that every change disrupts an
effective systems causing at least temporary performance losses and
maybe also a long-term decrease of cost-benefit ratio.

## Further reading

Brooks, F. (1995).
[*The mythical man-month: essays on software engineering*](https://en.wikipedia.org/wiki/The_Mythical_Man-Month)
(Anniversary ed.). Addison-Wesley.

Marlow, S., Lacerenza, C., Paoletti, J., Burke, C., & Salas, E. (2018).
[*Does team communication represent a one-size-fits-all approach?: A
meta-analysis of team communication and
performance*](https://www.sciencedirect.com/science/article/abs/pii/S074959781630125X).
Organizational Behavior and Human Decision Processes, 144, 145–170.
<https://doi.org/10.1016/j.obhdp.2017.08.001>
