require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.
require 'byebug'
class SQLObject

  def self.columns
    # Established a connection.
    # For some reason, the question mark didn't work here?
    # Table name here is nil so I added cats

    table = DBConnection.instance.execute(<<-SQL)
      SELECT
        *
      FROM
        cats
    SQL

    table.keys
  end

  def self.finalize!

  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name ||= 'cats'
  end

  def self.all
    # ...
  end

  def self.parse_all(results)
    # ...
  end

  def self.find(id)
    # ...
  end

  def initialize(params = {})

  end

  def attributes
    # ...
  end

  def attribute_values
    # ...
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
