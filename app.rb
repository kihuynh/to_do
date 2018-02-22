require('sinatra')
require('sinatra/reloader')
also_reload('lib/**.*.rb')
require('./lib/task')
require('pg')
require('pry')

DB = PG.connect({:dbname => 'to_do'})


get('/') do
  erb(:input)
end

get('/output') do
  erb(:output)
end
