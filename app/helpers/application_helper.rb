module ApplicationHelper
  def render_if(condition, *render_params)
    if condition
      render *render_params
    end
  end
end
