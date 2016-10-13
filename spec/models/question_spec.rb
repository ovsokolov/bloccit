require 'rails_helper'

RSpec.describe Question, type: :model do
  it { should have_many(:answer) }
  let(:question) { Question.create!(title: "New Queston Title", body: "New Question Body", resolved: true) }

   describe "attributes" do
     it "has title, body and resolved attributes" do
       expect(question).to have_attributes(title: "New Queston Title", body: "New Question Body", resolved: true)
     end
   end
end
