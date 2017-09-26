require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("sinatra/activerecord")
require("./lib/survey")
require("./lib/question")
require("pg")
require("pry")

get('/') do
  @surveys = Survey.all
  erb(:index)
end

post('/') do
  Survey.create(name: params['name'])
  @surveys = Survey.all
  erb(:index)
end

get('/survey/:id') do
  @questions= Question.all()
  @survey = Survey.find(params['id'])
  erb(:survey)
end

post('/survey/:id') do
  @survey = Survey.find(params['id'])
  @question = Question.create(name: params['name'], survey_id: params['id'])
  @questions = Question.all
  erb(:survey)
end
