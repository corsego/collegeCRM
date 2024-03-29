# frozen_string_literal: true

module UsersHelper
  def ban_status(user)
    if user.access_locked?
      'Unban'
    else
      'Ban'
    end
  end
end
