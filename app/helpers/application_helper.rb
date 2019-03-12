module ApplicationHelper
#START_HIGHLIGHT
  def render_if(condition, record)
    if condition
      render record
    end
  end
#END_HIGHLIGHT
end
