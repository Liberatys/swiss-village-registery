require "spec_helper"

class RutieRubyExampleTest < Minitest::Test
  def test_it_reverses
    assert_equal "selppa", RutieExample.reverse("apples")
  end
end

describe 'Village Filter' do
  it 'reverses string' do
    expect(RutieExample.reverse("apples")).to eq('selppa')
  end
end
