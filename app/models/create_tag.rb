class CreateTag
  include ActiveModel::Model
  attr_accessor :title

  def save
    tag = title.slice(/^\[(.+?)\]/).gsub(/[\[\]]/,"").split(" ")
    binding.pry
    article_title = title.slice(/\].*/).gsub(/[\s\]]/,"")
  end
end
