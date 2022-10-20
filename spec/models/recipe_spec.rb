require "spec_helper"

RSpec.describe Recipe, type: :model do
  describe "name" do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe "description" do
    it { is_expected.to validate_presence_of(:description) }
  end

  # it "is boolean" do
  #   expect(subject).to validate_inclusion_of(:completed).in_array([true, false])
  # end
end
