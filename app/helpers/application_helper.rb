module ApplicationHelper
  def render_if(condition, content, props)
    if condition
      render content, props
    end
  end
end
