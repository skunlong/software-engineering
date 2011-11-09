# To change this template, choose Tools | Templates
# and open the template in the editor.
require 'test_helper'


class AuctionCloseJobTest < ActiveSupport::TestCase
  test "perform_test" do
    @auction_job = AuctionCloseJob.new(1)
    @auction_job.perform
  end
end
