class StudentsFacade
  def initialize(house)
    @house = house
  end

  def students
    house_id = service.get_house[:id]
    response = service.get_students(house_id)
    response.map do |student_data|
      Student.new(student_data)
    end
  end

  def service
    HogwartsService.new(@house)
  end

end
