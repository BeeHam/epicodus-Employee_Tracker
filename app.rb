require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('sinatra/activerecord')
require('./lib/division')
require('./lib/employee')
require('pg')
require('pry')

get('/') do
  erb(:index)
end

get('/employees') do
  @employees = Employee.all()
  erb(:employees)
end

get('/divisions') do
  @divisions = Division.all()
  erb(:divisions)
end
