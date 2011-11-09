class UserMailer < ActionMailer::Base



  def welcome_email(user)
    recipients    user.email
    from          "Phoenix Auction Site Notifications <phoenixsoftwareengineering@gmail.com>"
    subject       "Welcome to Phoenix Auction Site"
    sent_on       Time.now
    body          :user => user, :url => "http://localhost:3000/users/login"

  end

  def bidconfirm_email(user,auction)
    recipients    user.email
    from          "Phoenix Auction Site Notifications <phoenixsoftwareengineering@gmail.com>"
    subject       "Bid confirmation in Phoenix Auction Site"
    sent_on       Time.now
    body          :user => user, :auction => auction, :url => "http://localhost:3000/users/#{user.id}"

  end

  def bidlost_email(previous_user,auction)
    recipients    previous_user.email
    from          "Phoenix Auction Site Notifications <phoenixsoftwareengineering@gmail.com>"
    subject       "There is another bid higher than yours in Phoenix Auction Site"
    sent_on       Time.now
    body          :previous_user => previous_user, :auction => auction, :url => "http://localhost:3000/users/#{previous_user.id}"

  end

  def bidclose_email(auction_user, auction, last_user)
    recipients    auction_user.email
    from          "Phoenix Auction Site Notifications <phoenixsoftwareengineering@gmail.com>"
    subject       "Your auction is closed now in Phoenix Auction Site"
    sent_on       Time.now
    body          :auction_user => auction_user, :auction => auction, :last_user => last_user, :url => "http://localhost:3000/users/#{auction_user.id}"

  end

  def forgotpassword_email(to, username, pass, sent_at = Time.now)
    #    recipients    previous_user.email
    #    from          "Phoenix Auction Site Notifications <phoenixsoftwareengineering@gmail.com>"
    #    subject       "There is another bid higher than yours in Phoenix Auction Site"
    #    sent_on       Time.now
    #    body          :previous_user => previous_user, :auction => auction, :url => "http://localhost:3000/users/#{previous_user.id}"

    @subject    = "Here is your new password at Phoenix Auction Site"
    @body['username']=username
    @body['pass']=pass
    @recipients = to
    @from       = 'Phoenix Auction Site Notifications <phoenixsoftwareengineering@gmail.com>'
    @sent_on    = sent_at
    @headers    = {}
  end

  def getbid_email(last_user, auction)
    recipients    last_user.email
    from          "Phoenix Auction Site Notifications <phoenixsoftwareengineering@gmail.com>"
    subject       "Congratulations! You have won your bid in Phoenix Auction Site"
    sent_on       Time.now
    body          :last_user => last_user, :auction => auction, :url => "http://localhost:3000/users/#{last_user.id}"

  end

end
