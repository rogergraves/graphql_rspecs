module Resolvers
  class User
    attr_reader :user

    def initialize(user:)
      @user = user
    end

    # Write unit tests for this class in /spec/graphql/resolvers/user_spec.rb (preferably TDD style)

    def address
      ([:street, :number, :postcode, :city, :country].map do |a|
        user.send(a)&.strip
      end.compact - ['']).join(', ')
    end
  end
end