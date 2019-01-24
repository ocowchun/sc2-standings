require 'rails_helper'

RSpec.describe GameSet, type: :model do
  it { should belong_to(:winner) }
  it { should belong_to(:loser) }
  it { should belong_to(:series) }
  it { should validate_presence_of(:winner_id) }
  it { should validate_presence_of(:loser_id) }
end
