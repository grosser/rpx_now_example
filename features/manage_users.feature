Feature: Manage users
	In order to keep my information up to date
	As a User
	I want to be able to manage my profile
  
  Scenario: Show logged on user
	Given the following users:
	| name		| identifier	| email					|
	| Batman	| 123			| batman@batcave.org	|
	And I am logged in as "Batman"
    When I go to the home page
    Then I should see "Hello Batman"
