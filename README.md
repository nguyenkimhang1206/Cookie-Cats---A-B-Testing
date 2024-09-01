# Cookie Cats A/B Testing
# 1. Problem Statement

### Company Overview

[Cookie Cats](https://www.facebook.com/cookiecatsgame) is a hugely popular mobile puzzle game developed by [Tactile Entertainment](http://tactile.dk/). It's a classic "connect three" style puzzle game where the player must connect tiles of the same color in order to clear the board and win the level. It also features singing cats. 

As players progress through the game they will encounter gates that force them to wait some time before they can progress or make an in-app purchase. 

### Goal

In this project, we will analyze the result of an A/B test where the first gate in Cookie Cats was moved from level 30 to level 40. In particular, we will **analyze the impact on player retention.**

### Hypothesis

**Null hypothesis (H₀):** The number of players who return to the game 1 day and 7 days after installation is the same for gate_30 and gate_40.

**Alternative hypothesis (Hₐ):** The number of players who return to the game 1 day and 7 days after installation is different for gate_30 and gate_40.

# **2. Dataset Description**

This dataset includes A/B test results of Cookie Cats to examine what happens when the first gate in the game was moved from level 30 to level 40. When a player installed the game, he or she was randomly assigned to either gate_30 or gate_40. 

The data we have is from 90,189 players that installed the game while the AB-test was running. The variables are:

**userid:** A unique number that identifies each player.

**version:** Whether the player was put in the control group (gate_30 - a gate at level 30) or the group with the moved gate (gate_40 - a gate at level 40).

**sum_gamerounds:** the number of game rounds played by the player during the first 14 days after install.

**retention_1:** Did the player come back and play 1 day after installing?

**retention_7:** Did the player come back and play 7 days after installing?

# 3. Insights Summary

### A/B testing findings

![image](https://github.com/user-attachments/assets/b0468899-0265-4fee-806a-05b0d28bc7ee)
We can observe that **gate_30 indeed had a higher percentage of users returning to the game** **within 1 day and 7 days** after installation compared to gate_40. Specifically, 44.82% of users returned after 1 day, compared to 44.23% for gate_40. Similarly, 19.02% of users returned after 7 days, compared to 18.20% for gate_40.

However, is this difference statistically significant, allowing us to reject the null hypothesis that there is no difference? To determine this, we can input our results into an online calculator https://www.evanmiller.org/ab-testing/chi-squared.html 

**1 Day Retention**

For 1 day retention, there is **no statistically significant difference** between gate_30 and gate_40.
![image](https://github.com/user-attachments/assets/d0e7e59e-f699-4767-accb-4e35a0f09904)



**7 Day Retention**

For 7 day retention, the **retention rate for gate_30 is significantly higher** than that of gate_40 at a 95% confidence level. 

![image](https://github.com/user-attachments/assets/ec5a7bf4-de90-4ad4-9b53-afcc80a35f4f)


### Problematic findings

**#1: The majority of players have not reached the first gate within 14 days**
![image](https://github.com/user-attachments/assets/8d609481-dfaf-40e9-b766-20408c66edba)



It can be seen from the chart that only 37.26% of players assigned to the gate_30 version actually reach the first gate.

![image](https://github.com/user-attachments/assets/89682b04-d075-41aa-9572-bae36ccc18ac)



It can be seen from the chart that only 30.4% of players assigned to the gate_40 version actually reach the first gate.

**#2: There is a vague time frame regarding when players encounter the first gate**

Since gamerounds are calculated within the first 14 days, we don’t know whether players who return to the game encounter the first gate within 1 day, 7 days, or later. And we only have retention rates for the 1-day and 7-day timeframes.

# 4. Conclusion

To sum up, **moving the first gate to level 40 is unlikely to affect 1-day retention,** as most players may not encounter the first gate within 1 day.

However, **moving the first gate to level 40 could potentially decrease 7-day retention** because many players might quit the game before reaching level 40. In this context, placing the first gate earlier could serve as an incentive to improve player engagement. Since we do not know if players actually reach the first gate within 7 days, we **cannot definitively conclude that moving the gate to level 40 negatively impacts the retention rate.**

**Further investigation** is needed to understand what actually affects 7-day retention. We **should consider incorporating the time frame** when players reach the first gate into the experiment design to test whether moving the gate impacts 7-day retention rates. This will help us gain more confidence in determining whether our A/B test affects retention.

Therefore, **at present, we should not move the first gate from level 30 to level 40.**
