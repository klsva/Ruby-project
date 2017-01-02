require 'rails_helper'

RSpec.describe "photos/new", type: :view do
  before(:each) do
    assign(:photo, Photo.new(
      :photo_name => "MyString",
      :album_id => 1,
      :photo_description => "MyText",
      :file => "MyText",
      :ave_value => 1.5
    ))
  end

  it "renders new photo form" do
    render

    assert_select "form[action=?][method=?]", photos_path, "post" do

      assert_select "input#photo_photo_name[name=?]", "photo[photo_name]"

      assert_select "input#photo_album_id[name=?]", "photo[album_id]"

      assert_select "textarea#photo_photo_description[name=?]", "photo[photo_description]"

      assert_select "textarea#photo_file[name=?]", "photo[file]"

      assert_select "input#photo_ave_value[name=?]", "photo[ave_value]"
    end
  end
end