require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable

  def where(params)
    columns = params.map.with_index do |(col, val), idx|
      if idx == params.count - 1
        "#{col} = '#{val}'"
      else
        "#{col} = '#{val}' AND"
      end
    end.join(" ")

    cat_ob = DBConnection.execute(<<-SQL)
      SELECT
        id
      FROM
        #{self.table_name}
      WHERE
        #{columns};
    SQL

    cat_ob.map do |id_hsh|
      self.find(id_hsh.values)
    end
  end

end

class SQLObject
  self.extend Searchable
end
