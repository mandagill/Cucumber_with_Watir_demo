class ThoughtWorksCareersPage

  attr_accessor :search_field, :google_search_button

  #allows to parameterize based on environment to run in
  URLS = { :production => "http://join.thoughtworks.com/" }

  #starts browser AND defines actions to be taken on it. This would potentially need to be refactored as the
  #complexity and number of possible actions to take on the page increases
  def initialize(browser)
    @browser = browser
    @view_jobs_link         = @browser.link(:text => "Jobs")
    @graduates_link = @browser.link(:link => "Graduates")
  end

  def method_missing(sym, *args, &block)
    @browser.send sym, *args, &block
  end

  def visit
    @browser.goto URLS[:production]
  end

  def page_title
    @browser.title
  end

  def search_for term
    self.search_field.set term
    self.google_search_button.click
    google_results_page = GoogleResultsPage.new(browser)
    google_results_page.results.wait_until_present if WEBDRIVER
    google_results_page
  end

end