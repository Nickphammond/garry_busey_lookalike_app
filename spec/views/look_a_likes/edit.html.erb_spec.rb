require 'rails_helper'

RSpec.describe "look_a_likes/edit", type: :view do
  before(:each) do
    @look_a_like = assign(:look_a_like, LookALike.create!(
      first_name: "MyString",
      last_name: "MyString"
    ))
  end

  it "renders the edit look_a_like form" do
    render

    assert_select "form[action=?][method=?]", look_a_like_path(@look_a_like), "post" do

      assert_select "input[name=?]", "look_a_like[first_name]"

      assert_select "input[name=?]", "look_a_like[last_name]"
    end
  end
end
