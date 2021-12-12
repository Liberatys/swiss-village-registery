require "spec_helper"

RSpec.describe "Village Filter" do
  it "reverses string" do
    expect(VillageRepository.reverse("apples")).to eq("selppa")
  end
end
