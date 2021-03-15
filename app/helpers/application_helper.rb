module ApplicationHelper
  def show_errors(object, field)
    if object.errors.any?
      unless object.errors.messages[field].blank?
        object.errors.messages[field].join(", ")
      end
    end
  end

  def check_user?(user_id)
    session[:user_id] && User.find_by_id(session[:user_id])
  end
end
