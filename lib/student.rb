class Student
  attr_accessor :name, :grade
  attr_reader :id

  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]  
  
  def initialize(name,grade,id=nil)
    @id = id
    @name = name
    @grade = grade
  end
  
  def self.create_table
    sql = <<-SQL
      CREATE TABLE IF NOT EXISTS students (
        id INTEGER PRIMARY KEY,
        name TEXT,
        grade INTEGER
        )
        SQL
      DB[:conn].execute(sql)
  end
  
  def self.drop_table
  end
  
  def self.save
    sql = <<-SQL
      INSERT INTO students (name,grade) 
      VALUES (?,?)
      SQL
    DB[:conn].execute(sql,self.name,self.grade)
  end
  
  
end
