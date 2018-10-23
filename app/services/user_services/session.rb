module UserServices
  class Session

    attr_reader :user

    def initialize(user:)
      @user = user
    end

    # Write unit tests for this class in /spec/services/user_services/session_spec.rb (preferably TDD style)
    def login
      user.sessions.create.key
    end

  end
end