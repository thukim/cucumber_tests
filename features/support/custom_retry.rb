require 'cucumber'

class CustomRetry < Cucumber::Core::Filter.new(:configuration)
  MAX_RETRIED_TIME = 3

  def test_case(test_case)
    configuration.on_event(:test_case_finished) do |event|
      next unless retry_needed?(test_case, event)
      test_case.describe_to(receiver)
    end

    super
  end

  private

  def retry_needed?(test_case, event)
    event.test_case == test_case && event.result.failed? && test_case_counts[test_case] < MAX_RETRIED_TIME
  end

  def test_case_counts
    @test_case_counts ||= Hash.new { |h, k| h[k] = 0 }
  end
end
