require 'rails_helper'

RSpec.describe Series, type: :model do
  it { should have_many(:game_sets) }
  it { should validate_presence_of(:name) }
end
