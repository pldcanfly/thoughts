require 'test_helper'

class ThoughtsControllerTest < ActionDispatch::IntegrationTest
  include ThoughtsHelper
  # test "the truth" do
  #   assert true
  # end

  test 'get_thoughts_by_author' do


    assert_not get_thoughts_for_thinker(999).nil?, 'Test if a non-existing user yields'

    assert get_thoughts_for_thinker('pldcanfly'), 'Test if an existing user yields using a string'
    assert get_thoughts_for_thinker('non_existant_user').nil?, 'Test if a non-existing user yields using a string'

    #assert get_thoughts_for_thinker('pldcanfly').is_a?(Thought), 'Is this really a Toughts collection?'
  end
end
