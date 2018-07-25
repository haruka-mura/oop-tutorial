require 'rails_helper'

RSpec.describe "articles_categories/new", type: :view do
  before(:each) do
    assign(:articles_category, ArticlesCategory.new(
      :article => nil,
      :category => nil
    ))
  end

  it "renders new articles_category form" do
    render

    assert_select "form[action=?][method=?]", articles_categories_path, "post" do

      assert_select "input[name=?]", "articles_category[article_id]"

      assert_select "input[name=?]", "articles_category[category_id]"
    end
  end
end
