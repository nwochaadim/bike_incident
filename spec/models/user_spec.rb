require "rails_helper"

describe User, type: :model do
  subject { create(:user) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
end
