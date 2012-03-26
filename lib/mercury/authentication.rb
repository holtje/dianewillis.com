module Mercury
  module Authentication

    def can_edit?
      return session[:user_id] && User.find(session[:user_id])
    end
  end
end
