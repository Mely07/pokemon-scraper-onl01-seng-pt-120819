class Pokemon
<<<<<<< HEAD
  
=======
>>>>>>> b15596e6533708ab22a80e2cbac789ca49243bfb
  attr_accessor :name, :type, :db
  attr_reader :id
  
  def initialize(id: nil, name:, type:, db:) 
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES (?, ?)
    SQL
  
    db.execute(sql, name, type)
    
    @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0] 
  end

<<<<<<< HEAD
  def self.find(id, db)
=======
  def self.find(id)
>>>>>>> b15596e6533708ab22a80e2cbac789ca49243bfb
    sql = <<-SQL
      SELECT *
      FROM pokemon
      WHERE id = ?
<<<<<<< HEAD
      LIMIT 1
    SQL
    
    result = db.execute(sql, id).first
    
    Pokemon.new(id:result[0], name:result[1], type:result[2], db:db)
  end
  
=======
    SQL
    
    result = db.execute(sql, id)
    id = result[0]
    name =  result[1]
    type = result[2]
    self.new(id, name, type)
  end
>>>>>>> b15596e6533708ab22a80e2cbac789ca49243bfb
end
