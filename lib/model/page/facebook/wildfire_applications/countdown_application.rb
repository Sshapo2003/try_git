class Model::Page::Facebook::WildfireApplications::CountdownApplication < SitePrism::Page
  element :iframe, 'iframe'
  def header_text_should_be(text)
    has_content = false
    
    tries = 0
    max_tries = 5
    while tries < max_tries
      tries = tries + 1
      begin
        within_frame iframe[:id] do
          has_content = page.has_content?(text)
        end
      rescue Excetion => e
        # iframe is probably not loaded yet! Wait a while. If still not valid then raise.
        sleep 0.5
        raise e unless tries == max_tries
      end
    end

    return has_content
  end
end
