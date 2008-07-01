class ActiveRecord::ConnectionAdapters::MysqlAdapter
  def type_to_sql(type, limit = nil, precision = nil, scale = nil)
    return super unless type.to_s == 'integer'
 
    case limit
    when 1; 'tinyint'
    when 2; 'smallint'
    when 3; 'mediumint'
    when nil, 4, 11; 'int(11)' # compatibility with MySQL default
    when 5..8; 'bigint'
    else raise(ActiveRecordError, "No integer type has byte size #{limit}")
    end
  end
end