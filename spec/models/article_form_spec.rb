require 'rails_helper'

RSpec.describe ArticleForm, type: :model do
  describe '#save' do
    subject { article_form.save }
    let(:article_form) { ArticleForm.new(article_form_params) }
    let(:article_form_params) { { title: 'TITLE', body: 'BODY', category1: category1, category2: category2 } }
    let(:category1) { create(:category) }
    let(:category2) { create(:category) }

    it do
      is_expected.to be_truthy
    end
  end
end
