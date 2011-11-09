require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "get user name by id" do
    @results = Message.find_message_and_user_name_by_id(1)
    @results.each do |result|
      assert result[:username], "user1"
    end
  end

  test "from to the same" do
    @message = Message.new
    @message.send_time = Time.now
    @message.from_id = 1
    @message.to_id = 1
    @message.title = "hello"
    @message.content = "world"
    @message.read_status = false
    assert !@message.save
  end

  test "from to not the same" do
    @message = Message.new
    @message.send_time = Time.now
    @message.from_id = 1
    @message.to_id = 2
    @message.title = "hello"
    @message.content = "world"
    @message.read_status = false
    assert @message.save
  end

end
