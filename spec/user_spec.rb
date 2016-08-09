describe 'User' do
  describe '#authenticate' do
    let!(:user) do
      User.create(email: "email@gmail.com",
                            password: "password",
                            password_confirmation: "password")
    end

    it 'Authenticates user for correct credentials' do
      authenticated_user = User.authenticate(user.email, user.password)
      expect(authenticated_user).to eq user
    end

    it 'Does not authenticate for incorrect credentials' do
      expect(User.authenticate(user.email, 'wrongwrongpassword')).to be nil
    end
  end
end
