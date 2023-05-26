class Node
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
