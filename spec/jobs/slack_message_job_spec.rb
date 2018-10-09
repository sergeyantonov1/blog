require "rails_helper"

RSpec.describe SlackMessageJob do
  include ActiveJob::TestHelper

  describe "#perform" do
    let(:job) { described_class.perform_later(message) }
    let(:message) { "test" }

    it "queues the job" do
      expect { job }
      .to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
    end

    it 'is in defaultd queue' do
      expect(SlackMessageJob.queue_name).to eq("default")
    end
  end
end
