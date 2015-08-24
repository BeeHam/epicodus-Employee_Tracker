require('spec_helper')
require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exception, false)

describe('The Employee Tracker app', {:type => :feature}) do
  describe('the home page path') do
    it('will navigate to the list of divisions') do
      visit('/')
      click_link('View a List of Divisions')
      expect(page).to have_content('Divisions')
    end

    it('will navigate to the list of employees') do
      visit('/')
      click_link('View a List of Employees')
      expect(page).to have_content('Employees')
    end
  end

  describe('the division form path') do
    it('will post new divisions to division list') do
      visit('/divisions')
      fill_in("name", :with => "Art")
      click_button("Add")
      expect(page).to have_content("Art")
    end

    it('will navigate to the division edit page') do
      visit('/divisions')
      fill_in("name", :with => "Art")
      click_button("Add")
      find.('.glyphicon glyphicon-edit').click
      expect(page).to have_content('Art Division')
    end
  end
end
