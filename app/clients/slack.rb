class Slack
  include HTTParty

  base_uri "https://slack.com/api"

  def post_message(text)
    self.class.post("/chat.postMessage",
      body: {
        token: ENV["SLACK_BOT_TOKEN"],
        channel: :random,
        text: text
      })
  end
end
