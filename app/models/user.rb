class User
  attr_accessor :username

  def initialize(username)
    @username = username
  end

  def self.authenticate(username, password)
    # Implement a proper authentication logic!
    if username == "eduardo" && password == "cool"
      new(username)
    end
  end
end
