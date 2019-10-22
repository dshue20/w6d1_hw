class GraphNode

  attr_accessor :value, :neighbors

  def initialize(value)
    @value = value
    @neighbors = []
  end

end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

def bfs(start,target)
    checked = [start]
    queue = [start]
    until queue.empty?
        first = queue.shift
        return first if first.value == target
        first.neighbors.each do |neighbor|  
            if !checked.include?(neighbor)
                queue << neighbor
                checked << neighbor
            end
        end
    end
    nil
end

p bfs(a,"f")