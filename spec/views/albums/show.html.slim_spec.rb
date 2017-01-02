require 'rails_helper'

RSpec.describe "albums/show", type: :view do
  before(:each) do
    @album = assign(:album, Album.create!(
      :album_name => "Album Name",
      :album_description => "MyText",
      :user_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Album Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
  end
end
