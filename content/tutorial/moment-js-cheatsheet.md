+++
categories = ["cheatsheet", "javascript"]
date = "2016-11-15T21:31:53+05:30"
description = "All you need to know about using moment js. Date and Time parsing in javascript can be tricky. Moment js to the rescue. Read this and get started with Moment js"
draft = false
keywords = ["moment js", "parse date and time in javascript with moment js", "handle dates in javascript"]
slug = ""
tags = ["javascript", "moment js"]
title = "Moment.js Cheatsheet"
toc = false

+++

Handling date and time in JavaScript could be a pain. I am a ruby enthusiast and one thing which I deeply love about it, is its date and time helper. They are easy to use and very intuitive. In JavaScript world, [moment.js](www.momentjs.com) comes for the rescue. It has a lot of functionality but I somehow find its syntax a bit daunting. This post aims to provide a list of few most used methods. It shall also serve as a cheatsheet and reminder to everyone. So let's get started.

<img src="/images/tutorial/momentjs.png" alt="moment js cheatsheet" title="Moment js cheatsheet"/>

## The Moment
I will speak less and let the code do the talking.

```javascript
// returns the current time, same as new Date()
moment()

// get moment object from string, though we should not use them as they are ambiguous.
moment("10-10-1993")
moment("01/12/2015")

// instead use, it makes sure that your dates are interpreted correctly.
moment("10-10-1993", "DD-MM-YYYY")
moment("01/12/2015", "DD/MM/YYYY")
```

Here is a list of few most used parsing tokens:
<table>
  <tr>
    <th>Token </th>
    <th>Description </th>
    <th>Example </th>
  </tr>

  <tr>
    <td>YYYY</td>
    <td>4 Digit Year</td>
    <td>2016</td>
  </tr>
  <tr>
    <td>YY</td>
    <td>2 Digit Year</td>
    <td>16</td>
  </tr>
  <tr>
    <td>MMMM</td>
    <td>Full Month Name</td>
    <td>January</td>
  </tr>
  <tr>
    <td>MMM</td>
    <td>3 Character Month Name</td>
    <td>Jan</td>
  </tr>
  <tr>
    <td>MM</td>
    <td>2 Digit Month</td>
    <td>02</td>
  </tr>
  <tr>
    <td>M</td>
    <td>1 or 2 Digit Month</td>
    <td>1</td>
  </tr>
  <tr>
    <td>DD</td>
    <td>2 Digit Date</td>
    <td>09</td>
  </tr>
  <tr>
    <td>D</td>
    <td>1 or 2 Digit Date</td>
    <td>9</td>
  </tr>
  <tr>
    <td>M</td>
    <td>1 or 2 Digit Month</td>
    <td>1</td>
  </tr>
  <tr>
    <td>HH or H</td>
    <td>1 or 2 Digit Hour 24hrs</td>
    <td>23</td>
  </tr>
  <tr>
    <td>hh or h</td>
    <td>1 or 2 Digit Hour 12hrs</td>
    <td>01</td>
  </tr>
  <tr>
    <td>a or A</td>
    <td>Am/Pm</td>
    <td>PM</td>
  </tr>
  <tr>
    <td>m or mm</td>
    <td>Minutes</td>
    <td>59</td>
  </tr>
  <tr>
    <td>s or ss</td>
    <td>Seconds</td>
    <td>23</td>
  </tr>
</table>

> Tip: lower case tokens are used for time and upper case tokens are used for date.

## Breaking The Moment

We find ourself most of the time accessing different pieces of information stored in the moment object. It can be `date, hour, seconds, etc`

```javascript
// create the moment object
var now = moment();

// to get todays date
now.date()
now.hour()
now.minute()
now.second()

// we also have get method on moment
now.get('day') // returns day of the week
now.get('millisecond')

// get unix time
now.unix()

// I have specified the list of all possible vales you can use in get, add and subtract method in the below section.
```

## Play the Moment

```javascript
var now = moment()

// clone moment
var current = moment(now)
// change to utc
now.utc()
// validate the time object
now.isValid()

// add value to a time
// prototype: moment().add(value, scale)
now.add(3, 'hours');
now.subtract(7, 'days')

// jumping to some time
now.startOf('day')
now.endOf('month')

// possible fields to use
var possibleScales = [year, month, quarter, week, isoWeek, day, date, hour, minute, second]

// use any available token to format time as you need
now.format('hh:mm a')
```

> moment.js methods like add and subtract mutates the object itself. This can cause an unseen bug if you are not aware!


## Conclusion

Moment.js is very helpful to solve date and time related problems in javascript. It was created to be easy and powerful. With the right exposure we can get our work done easily with `momentjs`. If you liked the post, please let us know how can we improve. Thanks for reading.
