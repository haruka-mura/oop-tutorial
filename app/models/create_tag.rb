class CreateTag
  include ActiveModel::Model
  attr_accessor :title

  def article_title
    tags_and_title = title.match(/(\[(.+?)\])?\s*　*(.+)/)
    ariticle_title = tags_and_title[3]
    ariticle_title
  end

  def tags
    tags_and_title = title.match(/(\[(.+?)\])?\s*　*(.+)/)
    tags = tags_and_title[2]&.split(/\s+|　+/)
    tags
  end
end
