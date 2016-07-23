module TravelHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to({:sort => column, :direction => direction}, {:class => "travels__results-header-link"}) do
      content_tag(:span, title) +
      content_tag(:span, nil, class: css_class)
    end
  end
end
