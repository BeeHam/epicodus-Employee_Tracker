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

post('/divisions/add') do
  name = params.fetch("name")
  Division.create({:name => name})
  @divisions = Division.all()
  erb(:divisions)
end

get('/division/:id/edit') do
  @division = Division.find(params.fetch('id').to_i)
  @employees = Employee.all()
  erb(:division)
end

patch('/division/add') do
  @division = Division.find(params.fetch('division_id').to_i)
  name = params.fetch('name')
  @division.update({:name => name})
  @employees = Employee.all()
  erb(:division)
end

post('/employees/add') do
    name = params.fetch("name")
    Employee.create({:name => name})
    @employees = Employee.all()
    erb(:employees)
end

delete('/employees/delete') do
  employee = Employee.find(params.fetch('employee_id').to_i())
  employee.destroy()
  @employees = Employee.all()
  erb(:employees)
end

delete('/divisions/delete') do
  division = Division.find(params.fetch('division_id').to_i())
  division.destroy()
  @divisions = Division.all()
  erb(:divisions)
end
