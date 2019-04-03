class Student < ApplicationRecord
  attr_reader :name,
              :id
              
  def initialize(student_data)
    @id = student_data[:id]
    @name = student_data[:name]
  end
end
