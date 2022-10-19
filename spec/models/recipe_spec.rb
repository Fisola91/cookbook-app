require "spec_helper"

RSpec.describe Recipe, type: :model do
  describe "name" do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe "description" do
    it { is_expected.to validate_presence_of(:description) }
  end
end
