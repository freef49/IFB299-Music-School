module ApplicationHelper
  
  # Returns the full title on a per-page basis. Base title is "Mika Music School"
  def full_title(page_title = '')
    base_title = "Mika Music School"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
  
end
