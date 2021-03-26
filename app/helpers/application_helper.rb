module ApplicationHelper
  def show_errors(object, field)
    if object.errors.any?
      unless object.errors.messages[field].blank?
        object.errors.messages[field].join(", ")
      end
    end
  end

  def check_user?
    session[:user_id] && User.find_by_id(session[:user_id])
  end

  def full_address(address)
    @full_address = address.house_number.to_s.concat(", ").concat(address.colony).concat(" ")
    @full_address.concat(address.street).concat(" ").concat(address.city).concat(", ")
    @full_address.concat(address.state)
  end
end
