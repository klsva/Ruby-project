require 'rails_helper'

RSpec.describe "albums/edit", type: :view do
  before(:each) do
    @album = assign(:album, Album.create!(
      :album_name => "MyString",
      :album_description => "MyText",
      :user_id => 1
    ))
  end

  it "renders the edit album form" do
    render

    assert_select "form[action=?][method=?]", album_path(@album), "post" do

      assert_select "input#album_album_name[name=?]", "album[album_name]"

      assert_select "textarea#album_album_description[name=?]", "album[album_description]"

      assert_select "input#album_user_id[name=?]", "album[user_id]"
    end
  end
end
