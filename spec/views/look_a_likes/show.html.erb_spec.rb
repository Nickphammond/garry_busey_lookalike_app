require 'rails_helper'

RSpec.describe "look_a_likes/show", type: :view do
  before(:each) do
    @look_a_like = assign(:look_a_like, LookALike.create!(
      first_name: "First Name",
      last_name: "Last Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
  end
end
