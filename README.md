# Lab 11 - Counters and Dividers

In this lab, we learned how to make clock dividers from two types of counters.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Names

## Summary

In this lab, We learned how ripple counters and modulo counters work as clock dividers. We got a better understanding of how each flip-flop in a ripple counter changes the frequency, and how a modulo counter can be designed to reset at a certain count to make different divide values. We also learned how full adders, D flip-flops, and T flip-flops can all work together in one circuit. This lab was definately the most confusing and technical and we ended up staying until the very end of class.

## Lab Questions

### 1 - Why does the Modulo Counter actually divide clocks by 2 * Count?
The modulo counter divides the clocks by 2 * Count because it toggles whenever we reach our desired count. A full clock period requires one toggle to go high and one toggle to go low (one for the rising edge and one for the falling edge). A modulo counter counts from 0 to Count - 1 and resets to 0 when it reaches Count - 1 and toggles the output bit. It take Count input clocks to toggle once, so it takes 2 * Count input clocks to complete a full High + Low cycle. Therefore, each FF in a counter divides the input clock frequency by 2, which creates a new clook signal with half the frequency. 
### 2 - Why does the ring counter's output go to all 1s on the first clock cycle?
The ring counter's output does not go to all 1s on the first cycle because it's inital state is one high, while the rest low. The output is then shifted by the first clock edge. 
### 3 - What width of ring counter would you use to get to an output of ~1KHz?
A ring counter goes through N states per clock and the ring width is equal to the division ratio N. In order to get an output of ~1KHz, it would depend on the input clock's frequency. For example, a 1 MHz input clock would need 1000 width of ring counter with a 10 bit ring counter. 
