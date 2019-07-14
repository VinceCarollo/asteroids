# Module 3 Assessment

In this assessment you will:

* Demonstrate mastery of all parts of the Rails stack
* Demonstrate mastery of Ruby throughout the process
* Write tests for the added features

## Areas of Knowledge

Areas to be tested is explained in the [Areas of Knowledge](https://github.com/turingschool/lesson_plans/blob/master/ruby_03-professional_rails_applications/assessment.md#areas-of-knowledge) section of the Assessment doc.

## Expectations

Criteria is explained in the [Expectations section](http://backend.turing.io/module3/lessons/assessment#expectations) of the Assessment doc.


## Preparation

> Clone down and run through the README for [Asteroids](https://github.com/turingschool-examples/asteroids)

[Sign up for an API key through NASA](https://api.nasa.gov/index.html#apply-for-an-api-key)

## Assessment Challenges

Work through the following challenges and get as far as you can in the allotted time. The first section is easier so it should not take half the time if you plan on finishing both.

### Feature 1: Most Dangerous Day

```
Background:
* This story should use the Asteroids Neo - Feed: https://api.nasa.gov/api.html#neows-feed

Feature: A guest user visits the root page and enters a start date and end date. The resulting page will display the most dangerous day in that range based on which day has the most `is_potentially_dangerous_asteroid` set to `true`. Given the scenario below, it should be January 1, 2018 with 3 potentially dangerous asteroids.

As a guest user
When I visit "/"
And I enter "2018-01-01" into the start date
And I enter "2018-01-07" into the end date
And I click "Determine Most Dangerous Day"

Then I should be on "/most_dangerous_day"
And I should see a heading for "Most Dangerous Day"
And I should see "January 1, 2018 - January 7, 2018"
And I should see a heading for the most dangerous day in that range "January 1, 2018"
And I should see 3 asteroids in that list

And I should see "Name: (2014 KT76)"
And I should see "NEO Reference ID: 3672906"

And I should see "Name: (2001 LD)"
And I should see "NEO Reference ID: 3078262"

And I should see "Name: (2017 YR1)"
And I should see "NEO Reference ID: 3794979"
```

Page should look something like this:

![feature mockup](./images/asteroids_mockup.png)

### Feature 2: API - Retrieving a user's favorites

Background: This story assumes the base data from running `rake db:seed`. Registered user has an `api_key` of `abc123`.

```
As a registered user
When I send a 'GET' request to '/api/v1/user/favorites?api_key=abc123'
Then I should receive a JSON response as follows:
```

```
[
  {
    "id":1,
    "neo_reference_id": "2153306",
    "user_id": 1,
    "asteroid": {
      "name": "153306 (2001 JL1)",
      "is_potentially_hazardous_asteroid": false,
    }
  }
]
```

### Feature 3: API - Favoriting an Asteroid

Background: This story assumes the base data from running `rake db:seed`
This SHOULD NOT save the asteroid data into the database. Asteroid data should be returned from the NASA API. You should save the `neo_reference_id` in the favorites table.

```
When I send a POST request to "/api/v1/user/favorites" with an 'api_key' of 'abc123' and a 'neo_reference_id' of '2021277'
Then I should receive a response with a status code of 200
And the body should be JSON as follows:
```

```
{
  "id":2,
  "neo_reference_id": "2021277",
  "user_id": 1,
  "asteroid": {
    "name": "21277 (1996 TO5)",
    "is_potentially_hazardous_asteroid": false,
  }
}
```

## Evaluation Criteria

The criteria is located in the [Assessment](http://backend.turing.io/module3/lessons/assessment) file.
