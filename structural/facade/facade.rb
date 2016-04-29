# Class1
class Database 
  def get_password(id)
    "CorrectPassword"
  end
end

# Class2
class Login
  def initialize(password)
    @pwd_from_db = password
  end

  def login(password)
    @pwd_from_db == password
  end
end

# Facade
class AdminPage
  def get_page(id, password)
    db = Database.new
    pwd_from_db = db.get_password(id)
    login = Login.new(pwd_from_db)
    login.login(password) ? "#{id}: Admin Page" : "NG"
  end
end


############## Usage ##############
admin_page = AdminPage.new
puts admin_page.get_page("Ko", "CorrectPassword")
#=> Ko: Admin Page
puts admin_page.get_page("Ko", "WrongPassword")
#=> NG