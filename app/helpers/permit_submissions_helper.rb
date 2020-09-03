module PermitSubmissionsHelper
  def sort_link(column, title = nil)
    title ||= column.titleize
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to "#{title}", {column: column, direction: direction}
  end
end
