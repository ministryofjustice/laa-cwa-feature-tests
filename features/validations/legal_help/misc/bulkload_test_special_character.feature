Feature: Test to check whether 2-byte special characters are accepted by bulkload.
Scenario: Test for tilde and umlaut acceptance by bulkload.
    Given a test firm user is logged in CWA
    When user bulk loads "bulkload_test_special_chars.xml" for the test firm "2P745Q"
    Then user should see the bulk load results page
    And successful outcomes should equal 1
    And there should be no problem outcomes
    When user confirms the submission
    
    