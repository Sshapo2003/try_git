class Model::Section::Facebook::TimelineUnit < SitePrism::Section
  element :status, 'div.statusUnit'
  element :story_content, 'div.storyContent'
  element :story_content_message, 'div.storyContent h6.uiStreamMessage span'
  element :link_title, 'div.uiAttachmentTitle'
  element :link_url, 'div.storyContent div.fbMainStreamAttachment span.caption'

  def has_message?
    is_status_unit? or is_story?
  end

  def status_message
    if is_status_unit? then return status end
    if is_story? then return story_content_message end
  end

  def has_attachment?
    has_link_title?
  end

  def is_status_unit?
    has_status?
  end

  def is_story?
    has_story_content?
  end
end
