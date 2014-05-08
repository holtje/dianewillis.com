module Mercury
  # A mechanism for authentication.
  module Authentication
    def can_edit?
      session[:user_id] && User.find(session[:user_id])
    end
  end
end
