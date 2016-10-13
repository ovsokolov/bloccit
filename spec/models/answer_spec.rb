require 'rails_helper'

RSpec.describe Answer, type: :model do
  it { should belong_to(:question) }
  let(:question) { Question.create!(title: "New Queston Title", body: "New Question Body", resolved: true) }
  let(:answer) { Answer.create!(body: "Answer Body", question: question) }

   describe "attributes" do
     it "has body attributes" do
       expect(answer).to have_attributes(body: "Answer Body")
     end
   end

end
