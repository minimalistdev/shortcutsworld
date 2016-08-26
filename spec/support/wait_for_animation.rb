module WaitForAnimation
  def wait_for_animation
    Timeout.timeout(Capybara.default_max_wait_time) do
      loop until finished_all_animation?
    end
  end

  def finished_all_animation?
    not page.evaluate_script('$(\'html, body\').is(\':animated\')')
  end
end

RSpec.configure do |config|
  config.include WaitForAnimation, type: :feature
end