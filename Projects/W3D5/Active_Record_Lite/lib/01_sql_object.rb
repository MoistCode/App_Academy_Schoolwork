require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.
require 'byebug'
class SQLObject

  def self.columns
    return @columns if @columns
    table = DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        cats
      LIMIT
        1
    SQL

    table.first.map!(&:to_sym)
    @columns = table.first
  end

  def self.finalize!

    columns.each do |column|

      define_method(column.to_s) do
        self.attributes[column]
      end

      define_method("#{column}=") do |new_val|
        self.attributes[column] = new_val
      end

    end

  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name ||= 'cats'
  end

  def self.all
    DBConnection.execute(<<-SQL)
    
    SQL
  end

  def self.parse_all(results)
    # ...
  end

  def self.find(id)
    # ...
  end

  def initialize(params = {})

    params.each do |attr_name, value|

      if self.methods.include?("#{attr_name.to_s}=".to_sym)
        send("#{attr_name.to_s}=", value)
      else
        raise "unknown attribute '#{attr_name}'"
      end

    end

  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values

  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
