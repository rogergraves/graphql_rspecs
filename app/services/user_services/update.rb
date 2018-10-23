module UserServices
  class Update

    attr_reader :user

    def initialize(user:)
      @user = user
    end

    def update(params)
      user.update(params.without(:id))
    end

  end
end