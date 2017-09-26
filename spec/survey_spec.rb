require('spec_helper')

describe(Survey) do
  it("creates a survey and displays a link to the survey") do
    survey = Survey.create({name: 'Headphone Preferences'})
    expect(survey.name).to(eq('Headphone Preferences'))
  end
  
end
