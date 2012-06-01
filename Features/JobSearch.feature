Feature: Search for jobs at ThoughtWorks
  As a technical professional, I want to view, research and apply for jobs at ThoughtWorks
  #These are placeholders; the steps have not yet been written.
	Scenario: View jobs in TW San Francisco
		Given I am on the Careers page
		Then I click on 'Jobs'
		Then I click on 'USA'
		Then I click on 'Apply for This'
        Then I should see '#choose what to assert on'

     Scenario: Apply for a job
       Given I am viewing a job posting
       Then I click on the 'Apply' link
       Then I #Put stuff in here, could demo grid inputs.
		