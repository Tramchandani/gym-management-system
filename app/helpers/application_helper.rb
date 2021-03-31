module ApplicationHelper
  def show_errors(object, field)
    if object.errors.any?
      unless object.errors.messages[field].blank?
        object.errors.messages[field].join(", ")
      end
    end
  end

  def check_user?
    session[:user_id] && current_user
  end

  def full_address(address)
    @full_address = address.house_number.to_s.concat(", ").concat(address.colony).concat(" ")
    @full_address.concat(address.street).concat(" ").concat(address.city).concat(", ")
    @full_address.concat(address.state)
  end

  def current_user
    User.find_by_id(session[:user_id])
  end
end
