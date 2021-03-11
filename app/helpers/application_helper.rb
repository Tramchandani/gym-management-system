module ApplicationHelper
  def show_errors(object, field)
    if object.errors.any?
      if !object.errors.messages[field].blank?
        object.errors.messages[field].join(", ")
      end
    end
  end
end
