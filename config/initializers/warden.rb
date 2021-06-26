Rails.configuration.middleware.use RailsWarden::Manager do |manager|
  manager.default_strategies :custom_auth
  manager.failure_app = ->(env) do
    env["REQUEST_METHOD"] = "GET"
    UserSessionController.action(:new).call(env)
  end
end

Warden::Strategies.add(:custom_auth) do
  def valid?
    params["username"] || params["password"]
  end

  def authenticate!
    user = User.authenticate(params["username"], params["password"])
    user.nil? ? fail!("Quack!") : success!(user)
  end
end

module Warden
  class SessionSerializer
    def serialize(record)
      [record.class.name, record.username]
    end

    def deserialize(keys)
      klass, username = keys
      klass.constantize.new(username)
    end
  end
end
