module ApplicationHelper
  def icon(cls)
    "<span class='glyphicon glyphicon-#{cls}'></span>".html_safe
  end
end
