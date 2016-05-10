module NoticesHelper
  def tag_links(tags)
    tags.split(",").map{|tag| link_to tag, user_path(tag_name: tag) }.join(", ")
  end
end