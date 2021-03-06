module Users
  class SignupUsecase
    def initialize(params)
      @params = params
      @user = User.new(@params)
    end

    def execute
      return false unless password_validation
      @user[:token] = create_token(@params[:email])
      return false unless @user.save
      @user
    end

    private

    def password_validation
      @params[:password] == @params[:password_confirmation]
    end

    def create_token(email)
      ::Sessions::Token.encrypt(email)
    end
  end
end