require 'rails_helper'

RSpec.describe "通知", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @note = FactoryBot.create(:note)
    Capybara.default_max_wait_time = 5
  end

  pending "add some scenarios (or delete) #{__FILE__}"
end
