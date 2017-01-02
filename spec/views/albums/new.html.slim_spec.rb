require 'rails_helper'

RSpec.describe "albums/new", type: :view do
  before(:each) do
    assign(:album, Album.new(
      :album_name => "MyString",
      :album_description => "MyText",
      :user_id => 1
    ))
  end

  it "renders new album form" do
    render

    assert_select "form[action=?][method=?]", albums_path, "post" do

      assert_select "input#album_album_name[name=?]", "album[album_name]"

      assert_select "textarea#album_album_description[name=?]", "album[album_description]"

      assert_select "input#album_user_id[name=?]", "album[user_id]"
    end
  end
end
