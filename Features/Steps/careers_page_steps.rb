#So at the Given in line 4, I don't know where 'Object' is coming from, as it's pretty generic.
#But then I need that at line 9 so I know what instance methods I can use...how to figure out?

Given /^I am on the (.+)$/ do |page_name|
  #this line takes the string and looks for a class with that string to instantiate the page class here.
  #This allows the user to put a human readable name in the feature and translate that to a class file (page object)
  @thoughtworks_career_page = Object.const_get(page_name.gsub(" ","")).new(@browser)
  @thoughtworks_career_page.visit
end

Then /^I click on the ([\d,]+) link$/ do |link_name|
  @thoughtworks_career_page.
end




When /^I search for a? ?"([^"]*)"$/ do |term|
  @google_results_page = @google_home_page.search_for term
end

When /^I search for a?n? ?([^"].+[^"])$/ do |term|
  term = Common.get_search_term_data term
  @google_results_page = @google_home_page.search_for term
end

Then /^I should see at least ([\d,]+) results$/ do |exp_num_results|
  @google_results_page.number_search_results.should >= exp_num_results.gsub(",","").to_i
end

Then /^I should see at most ([\d,]+) results$/ do |exp_num_results|
  @google_results_page.number_search_results.should <= exp_num_results.gsub(",","").to_i
end

When /^I convert (.+)$/ do |conversion_statement|
  @google_results_page = @google_home_page.search_for "convert #{conversion_statement}"
end

Then /^I should see the conversion result "([^"]*)"$/ do |exp_conversion_result|
  @google_results_page.conversion_result.text.should == exp_conversion_result
end
