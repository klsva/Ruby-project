require 'rails_helper'

RSpec.describe "photos/edit", type: :view do
  before(:each) do
    @photo = assign(:photo, Photo.create!(
      :photo_name => "MyString",
      :album_id => 1,
      :photo_description => "MyText",
      :file => "MyText",
      :ave_value => 1.5
    ))
  end

  it "renders the edit photo form" do
    render

    assert_select "form[action=?][method=?]", photo_path(@photo), "post" do

      assert_select "input#photo_photo_name[name=?]", "photo[photo_name]"

      assert_select "input#photo_album_id[name=?]", "photo[album_id]"

      assert_select "textarea#photo_photo_description[name=?]", "photo[photo_description]"

      assert_select "textarea#photo_file[name=?]", "photo[file]"

      assert_select "input#photo_ave_value[name=?]", "photo[ave_value]"
    end
  end
end
