module Random
  def db_random
    case ActiveRecord::Base.connection.adapter_name
    when 'MySQL'
      'rand()'
    when 'SQLite'
      'random()'
    when 'PostgreSQL'
      'random()'
    end
  end
end
