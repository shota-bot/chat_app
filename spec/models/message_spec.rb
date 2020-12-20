require 'rails_helper'

RSpec.describe Message, type: :model do
  describe "#create" do
    before do
      @message = FactoryBot.build(:message)
    end

    it "conntentとimageが存在すれば登録できること" do
      expect(@message).to be_valid
    end

    it "contentが空でも登録できること" do
      @message.content = nil
      expect(@message).to be_valid
    end

    it "imageが空でも登録できること" do
      @message.image = nil
      expect(@message).to be_valid
    end

    it "roomに紐づいていないと登録できないこと" do
      @message.room = nil
      @message.valid?
      expect(@message.errors.full_messages).to include("Room must exist")
    end
    
    it "userに紐づいていないと登録できなこと" do
      @message.user = nil
      @message.valid?
      expect(@message.errors.full_messages).to include("User must exist")
      end
  end
end
