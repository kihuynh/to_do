require('sinatra')
require('sinatra/reloader')
also_reload('lib/**.*.rb')
require('./lib/task')
require('./lib/list')
require('pg')
require('pry')

DB = PG.connect({:dbname => 'to_do_test'})

# dat home
get('/') do
  erb(:home)
end

get('/lists') do
  @lists = List.all()
  erb(:lists)
end

# route to view a specific list
get('/lists/:id') do
  @list = List.find(params.fetch("id").to_i())
  erb(:list)
end
# dat list form page
get('/lists/new') do
  erb(:list_form)
end

# Fetch new list name from parameter. Create new list object with fetch info. id will remain nil until assigned by DB. Save list. Render success page
post('/lists') do
  name = params.fetch("name")
  list = List.new({:name => name, :id => nil})
  list.save()
  erb(:list_success)
end

post('/tasks') do
  description = params.fetch("description")
  list_id = params.fetch("list_id").to_i()
  @list = List.find(list_id)
  @task = Task.new({:description => description, :list_id => list_id})
  @task.save()
  erb(:task_success)
end
