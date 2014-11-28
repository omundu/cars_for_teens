require 'test_helper'

class CarExtractorTest < ActiveSupport::TestCase
  test "should remove empty arrays" do
    array1 = [[], [1, 2, 3], [4, 5, 6], [7, 8, 9]]
    array2 = [[1, 2, 3], [], [4, 5, 6], [7, 8, 9]]
    array3 = [[1, 2, 3], [4, 5, 6], [], [7, 8, 9]]
    array4 = [[1, 2, 3], [4, 5, 6], [7, 8, 9], []]
    array5 = [[], [1, 2, 3], [], [4, 5, 6], [], [7, 8, 9], []]
    array6 = [[], [], [], [1, 2, 3], [], [], [], [4, 5, 6], [], [], [], [7, 8, 9], [], [], []]
    array7 = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]

    [array1, array2, array3, array4, array5, array6, array7].each do |test_array|
      assert_equal CarExtractor.new.remove_empty_arrays(test_array), [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    end
  end
  
  test "should handle empty arrays" do
    array1 = [[]]
    array2 = [[], [], []]
    array3 = []
    
    [].each do |test_array|
      assert_equal CarExtractor.new.remove_empty_arrays(test_array), []
    end
  end
end
