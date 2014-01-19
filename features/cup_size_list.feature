Feature: Cup size list
  In order to make a great smoothie
  I need a cup of the right size

  Scenario: List cup sizes
    Given the system knows about the following cup sizes:
      | name    | fluid ounces |
      | Regular | 12           |
      | Large   | 16           |
    When the client requests a list of cup sizes
    Then the response is a list containing two cup sizes
    And one cup sizes has the following attributes:
      | attribute    | type    | value   |
      | name         | String  | Regular |
      | fluid ounces | Integer | 12      |
    And one cup sizes has the following attributes:
      | attribute    | type    | value |
      | name         | String  | Large |
      | fluid ounces | Integer | 16    |