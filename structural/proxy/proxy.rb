# Subject
class BlogAccount
  def post(article)
    puts "posting \"#{article}\""
  end

  def write_comment(comment)
    puts "writing \"#{comment}\""
  end
end

# Proxy
class AccountProxy
  def initialize(account, user_name)
    @account = account
    @user_name = user_name
  end

  def method_missing(name, *args)
    check_user
    @account.send(name, *args)
  end
  
  private
  def check_user
      raise "Illegal Access Error: #{@user_name} can't access"  unless "CorrectUsername" == @user_name
  end  
end


############## Usage ##############
account = BlogAccount.new
proxy = AccountProxy.new(account, "CorrectUsername")
proxy.post("I ate sushi")
#=> posting "I ate sushi"
proxy.write_comment("Souds good")
#=> writing "Souds good"

account = BlogAccount.new
proxy = AccountProxy.new(account, "InCorrectUsername")
proxy.post("I ate sushi")
#=> `check_user': Illegal Access Error: InCorrectUsername can't access (RuntimeError)