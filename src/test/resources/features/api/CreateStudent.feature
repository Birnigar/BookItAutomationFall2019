@api @create_student
Feature: Create student

  @create-student_1
  Scenario: 1. Create student as a team member and verify status code 403
    Given authorization token is provided for "team member"
    And user accepts content type as "application/json"
    When user sends POST request to "/api/students/student" with following information:
      | first-name | last-name | email             | password | role                | campus-location | batch-number | team-name      |
      | Lesly      | McDonald  | lesslee@email.com | 1111     | student-team-member | VA              | 15           | Online_Hackers |
    And user verifies that response status code is 403

  @create-student_2
  Scenario: 2. Create student as a teacher and verify status code 201
    Given authorization token is provided for "teacher"
    And user accepts content type as "application/json"
    When user sends POST request to "/api/students/student" with following information:
      | first-name | last-name | email              | password | role                | campus-location | batch-number | team-name      |
      | Lesly      | SDET      | niga2020@email.com | 1111     | student-team-member | VA              | 15           | Online_Hackers |
    And user verifies that response status code is 201
    Then user deletes previously added students
      | first-name | last-name | email              | password | role                | campus-location | batch-number | team-name      |
      | Lesly      | SDET      | niga2020@email.com | 1111     | student-team-member | VA              | 15           | Online_Hackers |
#above last step is handled in APIUtilities class, in below method: when we add user -send post request- in step definitions;
#  we just called ensureUserDoesnotExist method and deleted user if already exists


  @create-student_3
  Scenario: 2. Create student as a teacher and verify status code 201
    Given authorization token is provided for "teacher"
    And user accepts content type as "application/json"
    When user sends POST request to "/api/students/student" with following information:
      | first-name | last-name | email             | password | role                | campus-location | batch-number | team-name      |
      | Lesly      | SDET      | nig2020@email.com | 1111     | student-team-member | VA              | 15           | Online_Hackers |
    And user verifies that response status code is 201
    Then user is on the landing page
    When user logs in with "nig2020@email.com" and "1111" password
    And user navigates to personal page
    Then user verifies that information displays correctly
      | first-name | last-name | email             | password | role                | campus-location | batch-number | team-name      |
      | Lesly      | SDET      | nig2020@email.com | 1111     | student-team-member | VA              | 15           | Online_Hackers |
#    we can add only one student
#  so to resolve this issue, we can delete added student at the end of the test