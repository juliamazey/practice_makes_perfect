require 'rails_helper'

RSpec.describe Student, type: :model do
  it 'exists' do
    student_data = {:id=>52,
                    :name=>"Gormlaith Gaunt",
                    :house_id=>4,
                    :created_at=>"2019-03-30T17:47:41.195Z",
                    :updated_at=>"2019-03-30T17:47:41.195Z"}

    student = Student.new(student_data)
    expect(student).to be_a(Student)
    expect(student.name).to eq(student_data[:name])
    expect(student.id).to eq(student_data[:id])
  end

end
