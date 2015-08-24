ENV['RACK_ENV'] = 'test'

require('rspec')
require('pg')
require('sinatra/activerecord')
require('employee')
require('division')
require('pry')
require('launchy')

RSpec.configure do |config|
  config.after(:each) do
    #code here
  end
end
