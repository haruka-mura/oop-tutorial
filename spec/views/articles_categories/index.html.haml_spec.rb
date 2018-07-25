require 'rails_helper'

RSpec.describe "articles_categories/index", type: :view do
  before(:each) do
    assign(:articles_categories, [
      ArticlesCategory.create!(
        :article => nil,
        :category => nil
      ),
      ArticlesCategory.create!(
        :article => nil,
        :category => nil
      )
    ])
  end

  it "renders a list of articles_categories" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
