require_relative 'node'

class Knight

  attr_reader :movement

  def initialize
    @movement = [1, 2]
  end

  def knights_travails(start, last)

    return puts "Not a valid position" if start.length != 2
    return puts "Not a valid position" if last.length != 2
    return puts "Not a valid position" if !start[0].is_a? Numeric
    return puts "Not a valid position" if !start[1].is_a? Numeric
    return puts "Not a valid position" if !last[0].is_a? Numeric
    return puts "Not a valid position" if !last[1].is_a? Numeric
    
    start[0] = start[0].truncate
    start[1] = start[1].truncate
    last[0] = last[0].truncate
    last[1] = last[1].truncate

    return puts "Not a valid position" if !start[0].between?(0,7)
    return puts "Not a valid position" if !start[1].between?(0,7)
    return puts "Not a valid position" if !last[0].between?(0,7)
    return puts "Not a valid position" if !last[1].between?(0,7)

    target_node = Node.new(nil, last, 0)
    
    unless start == last
      all_visits = []
      all_visits.push(last)
      root = Node.new(nil, last, 0)
      target_node = shortest_route([root], all_visits, start, last)
    end

    puts "It took #{target_node.distance} move(s) to get from #{start} to #{last}"

    stored_path = []

    until target_node.nil?
      stored_path.push(target_node.value)
      target_node = target_node.parent
    end

    puts "The path taken was: "

    stored_path.each do |coords|
      puts "#{coords}"
    end
    
    stored_path

  end


  def shortest_route(queue, all_visits, start, last)
    cur_node = queue.pop
    current_coord = cur_node.value
    all_pos_coords = all_possible_moves(current_coord)
    all_pos_coords.each do |value|
      if !all_visits.include?(value)
        all_visits.push(value)
      else
        all_visits.delete(value)
      end
    end
    all_pos_coords.each do |value|
      if value == start
        return Node.new(cur_node, value, cur_node.distance + 1)
      else
        queue.unshift(Node.new(cur_node, value, cur_node.distance + 1))
      end
    end
    shortest_route(queue, all_visits, start, last)
  end

  def valid_coord?(x_val, y_val)
    return false unless x_val.between?(0, 7) && y_val.between?(0, 7)

    true
  end

  def all_possible_moves(current_coord)

    coordinates = []

    positive_y = current_coord[1] + self.movement[1]
    negative_y = current_coord[1] - self.movement[1]
    positive_x = current_coord[0] + self.movement[0]
    negative_x = current_coord[0] - self.movement[0]

    coordinates.push([positive_x, positive_y]) if valid_coord?(positive_x, positive_y)
    coordinates.push([negative_x, positive_y]) if valid_coord?(negative_x, positive_y)
    coordinates.push([positive_x, negative_y]) if valid_coord?(positive_x, negative_y)
    coordinates.push([negative_x, negative_y]) if valid_coord?(negative_x, negative_y)

    positive_x = current_coord[0] + self.movement[1]
    negative_x = current_coord[0] - self.movement[1]
    positive_y = current_coord[1] + self.movement[0]
    negative_y = current_coord[1] - self.movement[0]

    coordinates.push([positive_x, positive_y]) if valid_coord?(positive_x, positive_y)
    coordinates.push([positive_x, negative_y]) if valid_coord?(positive_x, negative_y)
    coordinates.push([negative_x, positive_y]) if valid_coord?(negative_x, positive_y)
    coordinates.push([negative_x, negative_y]) if valid_coord?(negative_x, negative_y)

    coordinates
  end
end

