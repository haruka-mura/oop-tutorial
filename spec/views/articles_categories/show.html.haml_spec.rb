require 'rails_helper'

RSpec.describe "articles_categories/show", type: :view do
  before(:each) do
    @articles_category = assign(:articles_category, ArticlesCategory.create!(
      :article => nil,
      :category => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
