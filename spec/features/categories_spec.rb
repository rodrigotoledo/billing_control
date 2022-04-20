require "rails_helper"

RSpec.feature "Categories management", :type => :feature do
  describe 'Create Category' do
    before do
      visit categories_url
      click_link 'New category'
    end
    scenario "User creates a new category" do
      fill_in "Name",	with: "Category of example" 
      fill_in_trix_editor "category_description",	with: "Repellat et qui illum amet et aut."
      click_button "Create Category"

      expect(page).to have_text("Category was successfully created.")
    end
    
    scenario "User cant creates a new category" do
      click_button "Create Category"

      expect(page).not_to have_text("Category was successfully created.")
      expect(page).to have_css '#category_name.is-invalid'
    end
  end

  describe 'Update Category' do
    before do
      category = create(:category)
      visit categories_url
      click_link 'Show this category', href: category_path(category)
      click_link 'Edit this category'
    end

    scenario "User update the category category" do
      fill_in "Name",	with: "New Category" 
      click_button "Update Category"

      expect(page).to have_text("Category was successfully updated.")
      expect(page).to have_text("New Category")
    end
    
    scenario "User cant update a category" do
      fill_in "Name",	with: ""
      click_button "Update Category"

      expect(page).not_to have_text("Category was successfully updated.")
      expect(page).to have_css '#category_name.is-invalid'
    end
  end
  
end