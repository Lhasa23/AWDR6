module ApplicationHelper
  def render_if(condition, *props)
    if condition
      render *props
    end
  end
end
