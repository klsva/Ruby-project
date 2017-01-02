require 'rails_helper'

RSpec.describe "photos/index", type: :view do
  before(:each) do
    assign(:photos, [
      Photo.create!(
        :photo_name => "Photo Name",
        :album_id => 2,
        :photo_description => "MyText",
        :file => "MyText",
        :ave_value => 3.5
      ),
      Photo.create!(
        :photo_name => "Photo Name",
        :album_id => 2,
        :photo_description => "MyText",
        :file => "MyText",
        :ave_value => 3.5
      )
    ])
  end

  it "renders a list of photos" do
    render
    assert_select "tr>td", :text => "Photo Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
  end
end
