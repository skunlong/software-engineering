class Auction < ActiveRecord::Base
  belongs_to :user
  has_many :bid
  has_one :transaction

  validates_presence_of :auction_name, :image_url, :start_price, :current_price, :expire
  validate :start_price_at_least_one_cent
  validate :current_price_at_least_one_cent
  validates_numericality_of :start_price, :current_price
  validates_format_of :image_url,
    :with => %r{\.(gif|jpg|png)$}i,
    :message=> 'must be a URL for GIF, JPG or PNG image.'
#
#  def self.find_seller_id_by_name_auction
#    return User.find_by_sql( "SELECT m.id, m.read_status, m.send_time, s.username, m.title FROM messages m LEFT JOIN users s ON m.from_id = s.id WHERE m.to_id = #{id}" )
#  end

protected
  def start_price_at_least_one_cent
    errors.add(:start_price, 'The price should be at least 0.01') if (start_price.nil? || start_price <0.01)
  end

  def current_price_at_least_one_cent
    errors.add(:current_price, 'The price should be at least 0.01') if (current_price.nil? || current_price < 0.01)
  end

end
