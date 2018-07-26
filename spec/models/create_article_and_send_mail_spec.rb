require 'rails_helper'

RSpec.describe CreateArticleAndSendMail, type: :model do
  describe '#save' do
    subject { CreateArticleAndSendMail.new(article).save }
    let(:article) { build(:article) }

    it 'saveが成功する' do
      is_expected.to be_truthy
    end

    it 'Articleレコードが１増える' do
      expect{subject}.to change{Article.count}.by(1)
    end
  end
end
