require 'rails_helper'

RSpec.describe "look_a_likes/index", type: :view do
  before(:each) do
    assign(:look_a_likes, [
      LookALike.create!(
        first_name: "First Name",
        last_name: "Last Name"
      ),
      LookALike.create!(
        first_name: "First Name",
        last_name: "Last Name"
      )
    ])
  end

  it "renders a list of look_a_likes" do
    render
    assert_select "tr>td", text: "First Name".to_s, count: 2
    assert_select "tr>td", text: "Last Name".to_s, count: 2
  end
end
