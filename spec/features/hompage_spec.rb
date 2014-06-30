require "spec_helper"

feature "Homepage" do
  scenario "should have a greeting" do
    visit "/"

    expect(page).to have_content("Welcome")

    click_link "Profile"

    expect(page).to have_content "Profile Page"

    click_link "Homepage"

    expect(page).to have_content("Welcome")

    expect(page).to have_css("img[src='http://www.zooborns.com/.a/6a010535647bf3970b015433fc97e2970c-500wi']")
  end
end
