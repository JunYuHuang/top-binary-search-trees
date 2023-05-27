class Node
  include Comparable

  def <=>(other)
    # consider Node to be "greater" than nil / null
    return 1 if other.nil?
    @data.to_i <=> other.data.to_i
  end

  def initialize(data = nil, left = nil, right = nil)
    @data = data
    @left = left
    @right = right
  end

  attr_accessor(:data)
  attr_accessor(:left)
  attr_accessor(:right)

  def data
    @data
  end

  def left
    @left
  end

  def right
    @right
  end
end
