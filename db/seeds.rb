# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)
time = Time.now

admin = Admin.create(:user_name => 'admin',
  :password => 'admin',
  :create_date => time,
  :login_date => time,
  :email => 'haoniukun@gmail.com'
)
admin.save

auction = Auction.create(
  :auction_name => 'Iphone',
  :description => 'Iphone',
  :image_url  =>'/images/HPDeskJet.png',
  :start_price =>9.99,
  :current_price => 9.99,
  :expire => '2011-12-08 00:30:38',
  :user_name => 'lucazoia',
  :visible => true,
  :status => true,
  :id =>'1'
)
auction.save

auction = Auction.create(
  :auction_name => 'New Phone',
  :description => 'Beautiful Iphone',
  :image_url  =>'/images/iphone.jpg',
  :start_price =>29.99,
  :current_price => 35.99,
  :expire => '2010-12-30 00:31:38',
  :user_name => 'lucazoia',
  :visible => true,
  :status => true,
  :id =>'2'
)
auction.save

auction = Auction.create(
  :auction_name => 'Apple TV',
  :description => 'Brand New Apple TV',
  :image_url  =>'/images/appletv.jpg',
  :start_price =>29.99,
  :current_price => 35.99,
  :expire => '2010-12-30 00:31:38',
  :user_name => 'lucazoia',
  :visible => true,
  :status => true,
  :id =>'3'
)
auction.save


auction = Auction.create(
  :auction_name => 'Blackberry',
  :description => 'blackberry smartphone',
  :image_url  =>'/images/blackberry.jpg',
  :start_price =>29.99,
  :current_price => 35.99,
  :expire => '2011-12-30 00:31:38',
  :user_name => 'lucazoia',
  :visible => true,
  :status => true,
  :id =>'4'
)
auction.save


auction = Auction.create(
  :auction_name => 'Fashion boot',
  :description => 'nice boot for you',
  :image_url  =>'/images/boots3.jpg',
  :start_price =>29.99,
  :current_price => 35.99,
  :expire => '2010-12-30 00:31:38',
  :user_name => 'lucazoia',
  :visible => true,
  :status => true,
  :id =>'5'
)
auction.save


auction = Auction.create(
  :auction_name => 'Boots',
  :description => 'Wow nice boots, leather, beautiful...and confortable',
  :image_url  =>'/images/boots4.jpg',
  :start_price =>300.99,
  :current_price => 450.99,
  :expire => '2010-12-30 00:31:38',
  :user_name => 'lucazoia',
  :visible => true,
  :status => true,
  :id =>'6'
)
auction.save

auction = Auction.create(
  :auction_name => 'CAmera G1',
  :description => 'Only for professional people G1 camera',
  :image_url  =>'/images/camera G1.jpg',
  :start_price =>29.99,
  :current_price => 35.99,
  :expire => '2010-12-30 00:31:38',
  :user_name => 'lucazoia',
  :visible => true,
  :status => true,
  :id =>'7'
)
auction.save


auction = Auction.create(
  :auction_name => 'Canon',
  :description => 'Canon super camera',
  :image_url  =>'/images/canon_camera.jpg',
  :start_price =>29.99,
  :current_price => 35.99,
  :expire => '2011-02-30 00:31:38',
  :user_name => 'lucazoia',
  :visible => true,
  :status => true,
  :id =>'8'
)
auction.save

auction = Auction.create(
  :auction_name => 'New Canon Printer',
  :description => 'Canon printer',
  :image_url  =>'/images/canon_printer.jpg',
  :start_price =>39.99,
  :current_price => 50.99,
  :expire => '2010-12-30 00:31:38',
  :user_name => 'lucazoia',
  :visible => true,
  :status => true,
  :id =>'9'
)
auction.save

auction = Auction.create(
  :auction_name => 'Dvd',
  :description => 'Nice DVE',
  :image_url  =>'/images/dvd.jpg',
  :start_price =>9.99,
  :current_price => 15.99,
  :expire => '2010-12-30 00:31:38',
  :user_name => 'lucazoia',
  :visible => true,
  :status => true,
  :id =>'10'
)
auction.save

auction = Auction.create(
  :auction_name => 'New epson projector',
  :description => 'epson projector',
  :image_url  =>'/images/epson projector.jpg',
  :start_price =>99.99,
  :current_price => 105.99,
  :expire => '2010-12-30 00:31:38',
  :user_name => 'lucazoia',
  :visible => true,
  :status => true,
  :id =>'11'
)
auction.save

auction = Auction.create(
  :auction_name => 'External Hard Drive',
  :description => 'externalHD for every use',
  :image_url  =>'/images/externalHD.jpg',
  :start_price =>9.99,
  :current_price => 25.99,
  :expire => '2010-12-30 00:31:38',
  :user_name => 'lucazoia',
  :visible => true,
  :status => true,
  :id =>'12'
)
auction.save

auction = Auction.create(
  :auction_name => 'funny lcd',
  :description => 'funny lcd ONLY for you',
  :image_url  =>'/images/funny lcd.jpg',
  :start_price =>29.99,
  :current_price => 35.99,
  :expire => '2010-12-30 00:31:38',
  :user_name => 'lucazoia',
  :visible => true,
  :status => true,
  :id =>'13'
)
auction.save


auction = Auction.create(
  :auction_name => 'HAt',
  :description => 'no info. Sorry.',
  :image_url  =>'/images/hat.jpg',
  :start_price =>29.99,
  :current_price => 35.99,
  :expire => '2010-12-30 00:31:38',
  :user_name => 'lucazoia',
  :visible => true,
  :status => true,
  :id =>'14'
)
auction.save

auction = Auction.create(
  :auction_name => 'Another HAt',
  :description => 'This is the best hat',
  :image_url  =>'/images/hat.jpg',
  :start_price =>20.99,
  :current_price => 30.00,
  :expire => '2010-12-30 00:31:38',
  :user_name => 'lucazoia',
  :visible => true,
  :status => true,
  :id =>'15'
)
auction.save

auction = Auction.create(
  :auction_name => 'yet another New Printer',
  :description => 'HP Deskjet printer',
  :image_url  =>'/images/HPDeskJet.png',
  :start_price =>30.00,
  :current_price => 31.99,
  :expire => '2010-12-30 00:31:38',
  :user_name => 'lucazoia',
  :visible => true,
  :status => true,
  :id =>'16'
)
auction.save

auction = Auction.create(
  :auction_name => 'HTC',
  :description => 'Htc THIS IS A SMARTPHONE',
  :image_url  =>'/images/htc.jpg',
  :start_price =>129.99,
  :current_price => 135.99,
  :expire => '2010-12-30 00:31:38',
  :user_name => 'lucazoia',
  :visible => true,
  :status => true,
  :id =>'17'
)
auction.save

auction = Auction.create(
  :auction_name => 'Iphone',
  :description => 'NICE NICE NICE',
  :image_url  =>'/images/iphone.jpg',
  :start_price =>29.99,
  :current_price => 35.99,
  :expire => '2010-12-30 00:31:38',
  :user_name => 'lucazoia',
  :visible => true,
  :status => true,
  :id =>'18'
)
auction.save

auction = Auction.create(
  :auction_name => 'Ipod',
  :description => 'HP Deskjet printer',
  :image_url  =>'/images/ipod.jpg',
  :start_price =>49.99,
  :current_price => 55.99,
  :expire => '2010-12-30 00:31:38',
  :user_name => 'lucazoia',
  :visible => true,
  :status => true,
  :id =>'19'
)
auction.save


auction = Auction.create(
  :auction_name => 'KUN for sale',
  :description => 'Beautiful KUN',
  :image_url  =>'/images/kun.jpg',
  :start_price =>9.99,
  :current_price => 15.99,
  :expire => '2010-12-30 00:31:38',
  :user_name => 'lucazoia',
  :visible => true,
  :status => true,
  :id =>'20'
)
auction.save

auction = Auction.create(
  :auction_name => 'New Laptop',
  :description => 'laptop aspire',
  :image_url  =>'/images/laptop_aspire.jpg',
  :start_price =>60.99,
  :current_price => 61.00,
  :expire => '2010-12-30 00:31:38',
  :user_name => 'lucazoia',
  :visible => true,
  :status => true,
  :id =>'21'
)
auction.save

auction = Auction.create(
  :auction_name => 'lg phone',
  :description => 'incredible phone',
  :image_url  =>'/images/lg phone.jpg',
  :start_price =>29.99,
  :current_price => 35.99,
  :expire => '2010-12-30 00:31:38',
  :user_name => 'lucazoia',
  :visible => true,
  :status => true,
  :id =>'22'
)
auction.save

auction = Auction.create(
  :auction_name => 'lg phone',
  :description => 'LG PHONE ONLY FOR YOU',
  :image_url  =>'/images/lg_phone.jpg',
  :start_price =>9.99,
  :current_price => 23.99,
  :expire => '2010-12-30 00:31:38',
  :user_name => 'lucazoia',
  :visible => true,
  :status => true,
  :id =>'23'
)
auction.save

auction = Auction.create(
  :auction_name => 'Yet another phone',
  :description => 'uffi...',
  :image_url  =>'/images/lg_phone.jpg',
  :start_price =>29.99,
  :current_price => 35.99,
  :expire => '2010-12-30 00:31:38',
  :user_name => 'lucazoia',
  :visible => true,
  :status => true,
  :id =>'24'
)
auction.save


auction = Auction.create(
  :auction_name => 'LG LG LG',
  :description => 'sendo hand phone...',
  :image_url  =>'/images/lg_phone.jpg',
  :start_price =>10.99,
  :current_price => 19.99,
  :expire => '2010-12-30 00:31:38',
  :user_name => 'lucazoia',
  :visible => true,
  :status => true,
  :id =>'24'
)
auction.save

auction = Auction.create(
  :auction_name => 'macbook',
  :description => 'Mac nice...and brand new',
  :image_url  =>'/images/macbook.jpg',
  :start_price =>999.99,
  :current_price => 100.99,
  :expire => '2010-12-30 00:31:38',
  :user_name => 'lucazoia',
  :visible => true,
  :status => true,
  :id =>'26'
)
auction.save

auction = Auction.create(
  :auction_name => 'Smartphone',
  :description => 'Motorola  A855 new!!!',
  :image_url  =>'/images/Motorola  A855.jpg',
  :start_price =>119.99,
  :current_price => 135.99,
  :expire => '2010-12-30 00:31:38',
  :user_name => 'lucazoia',
  :visible => true,
  :status => true,
  :id =>'27'
)
auction.save

auction = Auction.create(
  :auction_name => 'Phone Motorola',
  :description => 'Razr..',
  :image_url  =>'/images/motorola razr.jpg',
  :start_price =>29.99,
  :current_price => 35.99,
  :expire => '2010-12-30 00:31:38',
  :user_name => 'lucazoia',
  :visible => true,
  :status => true,
  :id =>'28'
)
auction.save

auction = Auction.create(
  :auction_name => 'Monitor',
  :description => 'no info',
  :image_url  =>'/images/monitor.jpg',
  :start_price =>29.99,
  :current_price => 35.99,
  :expire => '2010-12-30 00:31:38',
  :user_name => 'lucazoia',
  :visible => true,
  :status => true,
  :id =>'29'
)
auction.save

auction = Auction.create(
  :auction_name => 'playstation',
  :description => 'just for gaming',
  :image_url  =>'/images/ps3_control.jpg',
  :start_price =>29.99,
  :current_price => 35.99,
  :expire => '2010-12-30 00:31:38',
  :user_name => 'lucazoia',
  :visible => true,
  :status => true,
  :id =>'30'
)
auction.save

auction = Auction.create(
  :auction_name => 'complement for PS',
  :description => 'stuff...',
  :image_url  =>'/images/ps3.jpg',
  :start_price =>29.99,
  :current_price => 35.99,
  :expire => '2010-12-30 00:31:38',
  :user_name => 'lucazoia',
  :visible => true,
  :status => true,
  :id =>'31'
)
auction.save

auction = Auction.create(
  :auction_name => 'samsung cell',
  :description => 'yet another cell',
  :image_url  =>'/images/samsung_cell.jpg',
  :start_price =>29.99,
  :current_price => 35.99,
  :expire => '2010-12-30 00:31:38',
  :user_name => 'lucazoia',
  :visible => true,
  :status => true,
  :id =>'32'
)
auction.save


auction = Auction.create(
  :auction_name => 'Sony for you',
  :description => 'sony camera',
  :image_url  =>'/images/sony_camera.jpg',
  :start_price =>29.99,
  :current_price => 35.99,
  :expire => '2010-12-30 00:31:38',
  :user_name => 'lucazoia',
  :visible => true,
  :status => true,
  :id =>'33'
)
auction.save

auction = Auction.create(
  :auction_name => 'Vaio',
  :description => 'Sony computer',
  :image_url  =>'/images/sony_vaio.jpg',
  :start_price =>9.99,
  :current_price => 35.99,
  :expire => '2010-12-30 00:31:38',
  :user_name => 'lucazoia',
  :visible => true,
  :status => true,
  :id =>'34'
)
auction.save

auction = Auction.create(
  :auction_name => 'tv one',
  :description => 'TV for great vision',
  :image_url  =>'/images/tv one.jpg',
  :start_price =>29.99,
  :current_price => 35.99,
  :expire => '2010-12-30 00:31:38',
  :user_name => 'lucazoia',
  :visible => true,
  :status => true,
  :id =>'35'
)
auction.save


auction = Auction.create(
  :auction_name => 'Weapon',
  :description => 'for you safety',
  :image_url  =>'/images/weapon.jpg',
  :start_price =>29.99,
  :current_price => 35.99,
  :expire => '2010-12-30 00:31:38',
  :user_name => 'lucazoia',
  :visible => true,
  :status => true,
  :id =>'36'
)
auction.save

auction = Auction.create(
  :auction_name => 'WII',
  :description => 'gaming for you',
  :image_url  =>'/images/wii.jpg',
  :start_price =>29.99,
  :current_price => 35.99,
  :expire => '2010-12-30 00:31:38',
  :user_name => 'lucazoia',
  :visible => true,
  :status => true,
  :id =>'36'
)
auction.save

auction = Auction.create(
  :auction_name => 'WII',
  :description => 'gaming for you',
  :image_url  =>'/images/wii.jpg',
  :start_price =>29.99,
  :current_price => 35.99,
  :expire => '2010-12-30 00:31:38',
  :user_name => 'lucazoia',
  :visible => true,
  :status => true,
  :id =>'36'
)
auction.save

message = Message.create(
  :from_id => '1',
  :to_id => '3',
  :read_status => 'false',
  :send_time => '2010-11-15 05:23:44',
  :content => 'MyText',
  :title => 'title',
  :id =>'1'
)
message.save

message = Message.create(
  :from_id => '3',
  :to_id => '2',
  :read_status => 'true',
  :send_time => '2010-11-15 05:23:44',
  :content => 'MyText',
  :title => 'title',
  :id =>'2'
)
message.save

