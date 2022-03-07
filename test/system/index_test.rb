require "application_system_test_case"

class IndexTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit root_url
    assert_selector "h2", text: "Markdown Blog"
  end
end
