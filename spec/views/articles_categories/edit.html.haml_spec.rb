require 'rails_helper'

RSpec.describe "articles_categories/edit", type: :view do
  before(:each) do
    @articles_category = assign(:articles_category, ArticlesCategory.create!(
      :article => nil,
      :category => nil
    ))
  end

  it "renders the edit articles_category form" do
    render

    assert_select "form[action=?][method=?]", articles_category_path(@articles_category), "post" do

      assert_select "input[name=?]", "articles_category[article_id]"

      assert_select "input[name=?]", "articles_category[category_id]"
    end
  end
end
