+++
categories = ["algorithms", "problem solving", "logical reasoning"]
date = "2016-05-25T00:36:36+05:30"
description = "Boggle is a grid of alphabets from which you have to find out recurring counts of given word."
draft = true
slug = "python_boggle_solver"
tags = ["algorithms", "boggle solver algorithm", "boggle solver program", "boggle solver python" ]
title = "Can you Boggle Solve?"
toc = false

+++

Boggle is a word game designed by Allan Turoff and originally distributed by Parker Brothers. The game is played using a plastic grid of lettered dice, in which players attempt to find words in sequences of adjacent letters... [Wikipedia](https://en.wikipedia.org/wiki/Boggle)

## Problem Statement

This problem is also *said as* **Jigsaw Crossword Puzzle**. You are given a board containing MxN cells, each letter containing an alphabet of the English language.
The goal of the program is to traverse through different cells to find a given word such that the following conditions are satisfied.

1. The letters of the word must be formed by traveling through a series of adjacent cells. i.e, the next letter in the word can be in any of the eight cells surrounding it.

2. If there is a path drawn as the letters of the words are discovered, the path must not cross over itself.
[crossover image](..)

3. The word should not use multiple instances of the same cell.
[reuse image](..)

**The Input:**
```
findme - (the word to be found)
M - (the number of rows)
N - (the number of columns)
a b c d e … (n elements)
.
.
.
.(m rows)
z y s x o …
```

**Input Format:**

```
'word'

5 x 3

r a y x d
w e t r o
o r d o z
```

**Output Format:**
```
output : 1
```


## Algorithm

## Code
