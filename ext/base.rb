class Capybara::Driver::Base
  def wait_for_ajax! wait_time=Capybara.default_wait_time
    page.wait_until wait_time do
      pending_xhr_count == 0
    end
  end

  def pending_xhr_count
    page.evaluate_script 'jQuery.active'
  end
end
