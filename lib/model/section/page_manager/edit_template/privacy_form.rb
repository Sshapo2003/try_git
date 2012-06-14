class Model::Section::PageManager::EditTemplate::PrivacyForm  < SitePrism::Section
  element :save_and_continue_button, "button[value='Save & Continue']"
  element :public_radio_button, "input[name='page_template[privacy]'][value='public']"
  element :private_radio_button, "input[name='page_template[privacy]'][value='private']"

  def set_privacy privacy
    case privacy
    when "Public Template" then public_radio_button.click
    when "Private Template" then private_radio_button.click
    else raise "Unknown privacy option: #{privacy}"
    end
    save
  end

  def save
    save_and_continue_button.click
    wait_for_ajax
  end

  def privacy_value
    if public_radio_button[:checked] then return "Public Template" end
    if private_radio_button[:checked] then return "Private Template" end
  end
end
