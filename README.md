# README

Timesheet application to view and create timesheet entries.
Also displays the calculated dollar value of each entry.

Assumptions:
Calculation according to 15 minute increments only

Calculation of pay is located in helpers/timesheet_helper.rb
A monkey patch to find the intersection of the hourly range is located
in config/initializers/monkey_patches.rb
