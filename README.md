Test task:
```
Create simple application for restaurant tables reservations.

Write a migration and ActiveRecord model that tracks restaurant reservations.  Assume there is a table in your relational database named "reservations".
Reservations have a start time, an end time and a table number.

Write some ActiveRecord validations that check new reservations for overbooking of the
same table in the restaurant.  For example, table #10 cannot have 2 reservations
for the same period of time.  This validation(s) should check time overlap for both
record creation and updates.

Unit tests are a must to make sure your double booking validations are working.
```

## [Demo](http://46.101.187.243/tables)


## Ruby version
  * 2.2.1

## Rails version
  * 4.1.9

## System dependencies
  * mysql2
  * twitter-bootstrap v3
  * turbolinks
  * simple_form

## Deployment stuff
  * mina

* * *
* * *
Screenshots:

![Tables view](https://dl.dropboxusercontent.com/u/2759137/tables.png "Tables view")

![Reservation view](https://dl.dropboxusercontent.com/u/2759137/reservations.png "Reservation view")