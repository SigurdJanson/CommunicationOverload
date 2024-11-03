Team Communication Load
================
2024-11-03

<!-- README.md is generated from README.Rmd. Please edit that file. -->

Communication is probably the one positive and cohesive force in a team.
Through the exchange of information the team accomplishes tasks, it
builds relationships, and establishes roles. Sometimes, however,
communication can have unwanted side effects and reduce the performance
of a team. That can caused by …

- Coordination problems, e.g.
  - an increased difficulty to develop quality relationships
  - or unrelated communication that does not contribute to performance;
- Motivation problems, e.g.
  - less recognition when other team members get some of the attention,
  - less clarity of goals when more people try to influence them,
  - or a decreased visibility of free-riding behaviour.

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

$$ R = \frac{M * (M-1)}{2} $$ with `M` being the number of team members.
The chart visualises the relationships. Each dot is a team member
connected to all the other team members.

The **bottom panel** simulates a possible negative effects it may have
to add team members. Instead of an increase in performance it may very
well happen that performance decreases. Adjust the slider to get a
feeling for this.

## What does the simulation mean?

**What it can do**. This app illustrates a basic relationship between
team size and performance. It can be used to instil awareness and teach
about the topic:

> There is no linear relationship between team size and output.

**What it cannot do**. Please note that Brooks’ law and the simulation
cannot predict what happens in your team. Brooks (1995) himself stated
that the law was “outrageously simplified” (Brooks 1995, chap. 19). For
two reasons:

- The assumed “mechanics” in the team may be very different in your
  case. The simulation makes assumptions to **illustrate a basic
  principle**. It does not make a specific prediction.

- The quantitative view on the team does not say anything about the
  **quality of communication**. That is more important than the
  quantity. Quantitative effects may be superimposed by qualitative
  ones. That does not mean that the quantitative approach loses meaning.
  It means, that it may be impossible to observe what this app predicts
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

## Further reading

<div id="refs" class="references csl-bib-body hanging-indent">

<div id="ref-Brooks1995" class="csl-entry">

Brooks, Frederick Phillips. 1995.
*The Mythical Man-Month: Essays on Software Engineering*.
Anniversary ed. Addison-Wesley.

</div>

<div id="ref-Elsayed-Elkhouly1997" class="csl-entry">

Elsayed‐Elkhouly, Sayed M., Harold Lazarus, and Volville Forsythe. 1997.
“Why Is a Third of Your Time Wasted in Meetings?” *Journal of Management
Development* 16 (9): 672–76.
<https://doi.org/10.1108/02621719710190185>.

</div>

<div id="ref-Marlow2018" class="csl-entry">

Marlow, Shannon L., Christina N. Lacerenza, Jensine Paoletti, C. Shawn
Burke, and Eduardo Salas. 2018. “Does Team Communication Represent a
One-Size-Fits-All Approach?: A Meta-Analysis of Team Communication and
Performance.” *Organizational Behavior and Human Decision Processes*
144: 145–70. <https://doi.org/10.1016/j.obhdp.2017.08.001>.

</div>

<div id="ref-Overeem2018" class="csl-entry">

Overeem, Barry. 2018. “Myth 11: In Scrum, We Spend Too Much Time in
Meetings.” Blog at scrum.org.
<https://www.scrum.org/resources/blog/myth-11-scrum-we-spend-too-much-time-meetings>.

</div>

<div id="ref-Rogelberg2013" class="csl-entry">

Rogelberg, Steven, Cliff Scott, Brett Agypt, Jason Williams, John Kello,
Tracy McCausland, and Jessie Olien. 2013. “Lateness to Meetings:
Examination of an Unexplored Temporal Phenomenon. European Journal of
Work and Organizational Psychology.” *European Journal of Work and
Organizational Psychology* 23 (January).
<https://doi.org/10.1080/1359432X.2012.745988>.

</div>

<div id="ref-Schwaber2020" class="csl-entry">

Schwaber, Ken, and Jeff Sutherland. 2020. “The Scrum Guide.” Guideline.
<https://scrumguides.org/docs/scrumguide/v2020/2020-Scrum-Guide-US.pdf>.

</div>

</div>
