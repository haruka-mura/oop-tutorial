class ArticleLengthValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    validator = Validator.new(record, value, options)
    unless validator.valid?
      record.errors[attribute] << "#{validator.attribute}と合わせて#{validator.minimum}文字以上入力してください"
    end
  end

  class Validator
    attr_reader :record, :value, :options

    def initialize(record, value, options)
      @record = record
      @value = value
      @options = options
    end

    def column
      record.send(options[:attribute])
    rescue NoMethodError
      ""
    end

    def attribute
      options[:attribute] || 10
    end

    def minimum
      options[:minimum] || 10
    end

    def valid?
      (value.length + column.length) >= minimum
    end
  end
end
