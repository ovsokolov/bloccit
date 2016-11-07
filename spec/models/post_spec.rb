require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:name) { RandomData.random_sentence }
  let(:description) { RandomData.random_paragraph }
  let(:title) { RandomData.random_sentence }
  let(:body) { RandomData.random_paragraph }

  let(:topic) { Topic.create!(name: name, description: description) }

  let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "helloworld") }

  let(:post) { topic.posts.create!(title: title, body: body, user: user) }

  let (:my_post) { nil }

  it { is_expected.to validate_length_of(:title).is_at_least(5) }
  it { is_expected.to validate_length_of(:body).is_at_least(20) }

  it { is_expected.to belong_to(:topic) }
  it { is_expected.to belong_to(:user) }

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:body) }
  it { is_expected.to validate_presence_of(:topic) }
  it { is_expected.to validate_presence_of(:user) }

  it { is_expected.to have_many(:comments) }
  it { is_expected.to have_many(:votes) }
  it { is_expected.to have_many(:favorites) }

   describe "attributes" do
     it "has a title, body, and user attribute" do
       expect(post).to have_attributes(title: title, body: body, user: user)
     end
   end


  describe "voting" do

    before do
      3.times { post.votes.create!(value: 1, user: user) }
      2.times { post.votes.create!(value: -1, user: user) }
      @up_votes = post.votes.where(value: 1).count
      @down_votes = post.votes.where(value: -1).count
    end

    describe "#up_votes" do
      it "counts the number of votes with value = 1" do
        expect( post.up_votes ).to eq(@up_votes)
      end
    end

    describe "#down_votes" do
      it "counts the number of votes with value = -1" do
        expect( post.down_votes ).to eq(@down_votes)
      end
    end

    describe "#points" do
      it "returns the sum of all down and up votes" do
        expect( post.points ).to eq(@up_votes - @down_votes)
      end
    end
  end

  describe "#update_rank" do
     it "calculates the correct rank" do
       post.update_rank
       expect(post.rank).to eq (post.points + (post.created_at - Time.new(1970,1,1)) / 1.day.seconds)
     end

     it "updates the rank when an up vote is created" do
       post.update_rank
       old_rank = post.rank
       post.votes.create!(value: 1, user: user)
       expect(post.rank).to eq (old_rank + 1)
     end

     it "updates the rank when a down vote is created" do
       post.update_rank
       old_rank = post.rank
       post.votes.create!(value: -1, user: user)
       expect(post.rank).to eq (old_rank - 1)
     end
   end

   describe "create_post callback" do
     it "triggers create_post on create" do
       my_post = topic.posts.build(title: title, body: body, user: user)
       expect(my_post).to receive(:create_vote).at_least(:once)
       my_post.save!
       #expect{ topic.posts.create!(title: title, body: body, user: user) }.to change(Vote,:count).by(1)
     end
   end

   describe "create_post favorite callback" do
     before do
       @post_user = User.create!(name: "Bloccit User", email: "ovsokolov@gmail.com", password: "helloworld")
       @another_post =  topic.posts.new(title: title, body: body, user: @post_user)
     end

     it "set user favorites who created the post" do
       #byebug
       @another_post.save!
       expect(@another_post.favorites.last.user).to eq(@post_user )
     end

     it "sends an email to users who have favorited the post" do
       expect(FavoriteMailer).to receive(:new_post).with(@post_user , @another_post).and_return(double(deliver_now: true))
       @another_post.save!
     end
   end

end
