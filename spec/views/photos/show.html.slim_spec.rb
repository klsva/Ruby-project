require 'rails_helper'

RSpec.describe "photos/show", type: :view do
  before(:each) do
    @photo = assign(:photo, Photo.create!(
      :photo_name => "Photo Name",
      :album_id => 2,
      :photo_description => "MyText",
      :file => "MyText",
      :ave_value => 3.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Photo Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/3.5/)
  end
end
