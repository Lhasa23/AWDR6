module ApplicationHelper
  def render_if(condition, record, render_hash)
    if condition
      render record, render_hash
    end
  end
end
