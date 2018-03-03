require_relative '02_searchable'
require 'active_support/inflector'
module Associatable

  def defaulter(name)
    define_method("class_name") do
      name.to_s.capitalize
    end

    define_method("foreign_key") do
      "#{name}_id".to_sym
    end

    define_method("primary_key") do
      :id
    end
  end

  def defaulter2(name, self_class_name)
    define_method('foreign_key') do
      "#{self_class_name.downcase}_id".to_sym
    end

    define_method('class_name') do
      "#{name.singularize.capitalize}"
    end

    define_method('primary_key') do
      :id
    end
  end

  def overrider(options)
    options.each do |k, v|
      define_method(k.to_s) do
        v
      end
    end
  end

  def belongs_to(name, options = {})
    defaulter(name)
    overrider(options)

    define_method("#{name}") do
      self.class_name.constantize.find(self.foreign_key)
    end
  end

  def has_many(name, options = {})

  end

  def assoc_options
    # Wait to implement this in Phase IVa. Modify `belongs_to`, too.
  end
end

# Phase IIIa
class AssocOptions
  extend Associatable

  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
    self.class_name.constantize
  end

  def table_name
    model_class.table_name
  end
end



class BelongsToOptions < AssocOptions

  def initialize(name, options = {})
    if options.empty?
      self.class.defaulter(name)
    else
      self.class.overrider(options)
    end
  end

end

class HasManyOptions < AssocOptions

  def initialize(name, self_class_name, options = {})
    if options.empty?
      self.class.defaulter2(name, self_class_name)
    else
      self.class.overrider(options)
    end
  end

end



class SQLObject
  extend Associatable
end
