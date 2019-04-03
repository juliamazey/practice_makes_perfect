require 'rails_helper'

describe 'as a visitor' do
  it 'I can get Slytherin students' do
    VCR.use_cassette("students") do

      visit '/'

      select "Slytherin", from: :house

      click_on 'Get Students'

      expect(page).to have_css("#Students")
      expect(page).to have_content("22 Students")

      within "#Students" do
        expect(page).to have_css(".student", count: 22)
          within (all(".student").first) do
            expect(page).to have_content("Name: Gormlaith Gaunt")
            expect(page).to have_content("Id: 52")
        end
      end
    end
  end
end
