require 'rails_helper'
feature 'User management' do
  let(:admin) do
    create(:admin)
  end
  scenario "adds a new user" do
    user_login(admin)
    expect(root_path).to have_content(current_path)
  end
end