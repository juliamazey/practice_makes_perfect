require 'rails_helper'

describe HogwartsService do
  before :each do
    @hogwarts_service = HogwartsService.new('Slytherin')
  end

  it 'exists' do
    expect(@hogwarts_service).to be_a(HogwartsService)
  end

  it '.get_house' do
    VCR.use_cassette("houses") do
      house = @hogwarts_service.get_house
      expect(house[:id]).to eq(4)
      expect(house[:name]).to eq('Slytherin')
    end
  end


  it '.get_students' do
    VCR.use_cassette("students") do

      @hogwarts_service.get_students
    end
  end

end
