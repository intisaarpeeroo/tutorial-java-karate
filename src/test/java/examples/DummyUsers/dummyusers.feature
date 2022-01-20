Feature: sample karate test script
  
  Background:
    * url 'http://dummy.restapiexample.com/api/v1/'

  Scenario: get all dummy users and then get the first user by id
    Given path 'employees'
    When method get
    Then status 200

    * def first = response.data[0]

    Given path 'employee', first.id
    When method get
    Then status 200

  Scenario: create a dummy user and then get it by id
    * def user =
      """
      {
        "name": "Karate Test User",
        "salary": "3000",
        "age": "35",
      }
      """

    Given path 'create'
    And request user
    When method post
    Then status 200

    * def id = response.data.id
    * print 'created id is: ', id

    Given path 'employee',id
    When method get
    Then status 200
    And match response contains {status:success}
  