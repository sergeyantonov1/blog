class SlackMessageJob < ApplicationJob
  def perform(message)
    slack.post_message(message)
  end

  private

  def slack
    @slack = Slack.new
  end
end
