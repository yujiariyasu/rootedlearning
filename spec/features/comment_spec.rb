require 'rails_helper'

feature 'Comments', type: :feature do
  include FeaturesSpecHelper
  before do
    create(:user)
    login(User.first, 'password')
    @learning = create(:learning)
  end
  scenario 'コメント投稿', js: true do
    visit learning_path(@learning)
    fill_in 'comment_body', with: 'test'
    click_button '投稿'
  end
end
