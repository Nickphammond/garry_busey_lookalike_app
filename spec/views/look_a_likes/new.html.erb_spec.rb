require 'rails_helper'

RSpec.describe "look_a_likes/new", type: :view do
  before(:each) do
    assign(:look_a_like, LookALike.new(
      first_name: "MyString",
      last_name: "MyString"
    ))
  end

  it "renders new look_a_like form" do
    render

    assert_select "form[action=?][method=?]", look_a_likes_path, "post" do

      assert_select "input[name=?]", "look_a_like[first_name]"

      assert_select "input[name=?]", "look_a_like[last_name]"
    end
  end
end
