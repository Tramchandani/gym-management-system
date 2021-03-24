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

  def in_cart?(exercise)
    cart = User.find_by_id(session[:user_id]).cart
    cart.exercises.exists?(exercise.id)
  end
end
