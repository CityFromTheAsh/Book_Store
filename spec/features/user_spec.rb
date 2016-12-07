require 'rails_helper'
feature 'User management' do
  let(:admin) do
    create(:admin)
  end
  scenario "cheak root path after log in" do
    user_login(admin)
    #find('a', id:'messages')
    expect(root_path).to have_content(current_path)
  end
end