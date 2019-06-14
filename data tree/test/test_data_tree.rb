require 'minitest/autorun'
require 'data_tree'

class DataTreeTest < Minitest::Test
  def setup
    @test_tree = Scanner.new.scan('/home/viachaslau/Documents/itechartgit/data tree/test/test_folder')
  end

  def test_for_empty_folder
    assert_equal '5└── folder3', @test_tree[4].join
  end

  def test_for_folder_in_folder
    assert_equal '1├── folder1', @test_tree[0].join
    assert_equal '2│   └── folder4', @test_tree[1].join
  end

  def test_for_file_in_folder
    assert_equal '3├── folder2', @test_tree[2].join
    assert_equal '4│   └── file1', @test_tree[3].join
  end
end
