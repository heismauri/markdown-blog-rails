require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  test "creating a post" do
    login_as users(:bella)
    visit "/posts/new"
    assert_selector "h2", text: "New post"

    fill_in "post_title", with: "Le Wagon rulessssssssssss"
    fill_in "thumbnail-upload", with: fixture_file_upload('thumbnail.png', 'image/png')
    save_and_open_screenshot
    click_on 'Create Post'
    save_and_open_screenshot
  end
end
