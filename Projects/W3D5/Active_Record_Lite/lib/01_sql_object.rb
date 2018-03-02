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
        #{self.table_name}
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
    data = DBConnection.execute(<<-SQL)
      SELECT
        *
      FROM
        cats
    SQL

    data.map { |datum| self.new(datum) }
  end

  def self.parse_all(results)
    results.map do |values|
      self.new(values)
    end
  end

  def self.find(id)
    data = DBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        #{self.table_name}
      WHERE
        id = ?;
    SQL

    data.map { |datum| self.new(datum) }.first
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
    @attributes.values
  end

  def insert
    # self.attributes returns name and owner_id hash
    col_without_id = self.class.columns.drop(1)
    col_to_s = col_without_id.map(&:to_s).join(", ")
    add_question_marks = (['?'] * col_without_id.count).join(', ')

    DBConnection.execute(<<-SQL, *attribute_values)
      INSERT INTO
        #{self.class.table_name} (#{col_to_s})
      VALUES
        (#{add_question_marks})
    SQL

    self.id = DBConnection.last_insert_row_id
  end

  def update
    col_val = self.class.columns.map { |col| "#{col} = ?"}.join(", ")

    DBConnection.execute(<<-SQL, *attribute_values)
      UPDATE
        #{self.class.table_name}
      SET
        #{col_val}
      WHERE
        #{self.class.table_name}.id = #{self.id};
    SQL

  end

  def save
    if self.id.nil?
      self.insert
    else
      self.update
    end
  end
end
