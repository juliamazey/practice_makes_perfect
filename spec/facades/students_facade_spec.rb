require 'rails_helper'

describe StudentsFacade do
  it 'exists' do
    students_facade = StudentsFacade.new('Slytherin')

    expect(students_facade).to be_a(StudentsFacade)
  end
end
