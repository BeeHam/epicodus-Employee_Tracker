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
end
