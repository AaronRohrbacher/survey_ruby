require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("sinatra/activerecord")
require("./lib/survey")
require("./lib/question")
require("./lib/survey_data")
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

patch('/survey/:id') do
  @survey = Survey.find(params['id'])
  @survey.update({name: params['name']})
  @questions = @survey.questions
  @surveys = Survey.all
  erb(:survey)
end

delete('/survey/:id') do
  @survey = Survey.find(params['id'])
  @survey.delete
  @questions = @survey.questions
  @surveys = Survey.all
  redirect('/')
end

get('/survey/:id') do
  @survey = Survey.find(params['id'])
  @questions = @survey.questions
  erb(:survey)
end

post('/survey/:id') do
  @survey = Survey.find(params['id'])
  @question = Question.create(name: params['name'], survey_id: params['id'])
  @questions = @survey.questions
  erb(:survey)
end

get('/question/:id') do
  @question = Question.find(params['id'])
  @answers = @question.answers
  erb(:question)
end

post('/question/:id') do
  @question = Question.find(params['id'])
  @answer = Answer.create(name: params['name'], question_id: params['id'])
  @answers = @question.answers
  erb(:question)
end

patch('/question/:id') do
  @question = Question.find(params['id'])
  @question.update({name: params['name']})
  @questions = @question.survey
  erb(:question)
end

delete('/question/:id') do
  @question = Question.find(params['id'])
  @question.delete
  @questions = @question.survey
  redirect('/')
end

get('/take_survey/:id') do
  @survey = Survey.find(params['id'])
  @questions = @survey.questions
  @@survey_questions = []
  @@survey_answers = []
  erb(:take_survey)
end
