require('sinatra')
require('sinatra/reloader')
also_reload('lib/**.*.rb')
require('./lib/task')
require('./lib/list')
require('pg')
require('pry')

DB = PG.connect({:dbname => 'to_do'})

# dat home
get('/') do
  erb(:home)
end

# dat list form page
get('/lists/new') do
  erb(:list_form)
end

# Fetch new list name from parameter. Create new list object. id will remain nil until assigned by DB. Save list. Render success page
post('/lists') do
  name = params.fetch("name")
  list = List.new({:name => name, :id => nil})
  list.save()
  erb(:list_success)
end
