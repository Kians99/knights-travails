class Node

  attr_accessor :parent, :value, :distance

  def initialize(parent, value, distance)

    @parent = parent
    @value = value
    @distance = distance

  end

end