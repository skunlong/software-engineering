class Message < ActiveRecord::Base
  belongs_to :user, :foreign_key => "from_id"
  belongs_to :user, :foreign_key => "to_id"
  validates_uniqueness_of :id
  validates_presence_of :title
  validates_presence_of :content
  validates_presence_of :from_id
  validates_presence_of :to_id
  validate :from_and_to_not_the_same

  def self.find_message_and_user_name_by_id(id)
    return Message.find_by_sql( "SELECT m.id, m.read_status, m.send_time, s.username, m.title, m.content FROM messages m LEFT JOIN users s ON m.from_id = s.id WHERE m.to_id = #{id}" )
  end

  private
  def from_and_to_not_the_same
    errors.add(:to_id, "from person and to person should not be the same") if from_id == to_id
  end
end
