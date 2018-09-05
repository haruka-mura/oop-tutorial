require 'rails_helper'

RSpec.describe CreateTag, type: :model do
  let(:tags_and_title) { CreateTag.new(title: title) }

  describe "#article_title" do
    subject { tags_and_title.article_title }

    context 'タグとタイトルがフォーマット通り入力された時' do
      let(:title) { "[tag1 tag2] タイトル" }

      it { is_expected.to eq "タイトル" }
    end

    context 'タイトルだけ入力された時' do
      let(:title) { "タイトル" }

      it { is_expected.to eq "タイトル" }
    end

    context 'タグの閉じ括弧がない時' do
      let(:title) { "[tag1 tag2 タイトル" }

      it { is_expected.to eq "[tag1 tag2 タイトル" }
    end

    context 'タグが空白の時' do
      let(:title) { "[　　　　] タイトル" }

      it { is_expected.to eq "タイトル" }
    end

    context 'タイトルが空白の時' do
      let(:title) { "[tag1 tag2]" }

      it { is_expected.to be_nil }
    end

    context 'カッコが逆の時' do
      let(:title) { "]tag1 tag2[ タイトル" }

      it { is_expected.to eq "]tag1 tag2[ タイトル" }
    end
  end

  describe "#tags" do
    subject { tags_and_title.tags }

    context 'タグとタイトルがフォーマット通り入力された時' do
      let(:title) { "[tag1 tag2] タイトル" }

      it { is_expected.to eq ["tag1", "tag2"] }
    end

    context 'タグとカッコの間にスペースがある時' do
      let(:title) { "[tag1 tag2　] タイトル" }

      it { is_expected.to eq ["tag1", "tag2"] }
    end

    context 'カッコが逆の時' do
      let(:title) { "]tag1 tag2[ タイトル" }

      it { is_expected.to be_nil }
    end

    context 'タイトルだけ入力された時' do
      let(:title) { "タイトル" }

      it { is_expected.to be_nil }
    end

    context 'タグの閉じ括弧がない時' do
      let(:title) { "[tag1 tag2 タイトル" }

      it { is_expected.to be_nil }
    end

    context 'タグが空白の時' do
      let(:title) { "[　　　　] タイトル" }

      it { is_expected.to be_nil }
    end

    context 'タイトルが空白の時' do
      let(:title) { "[tag1 tag2]" }

      it { is_expected.to eq ["tag1", "tag2"] }
    end
  end
end
