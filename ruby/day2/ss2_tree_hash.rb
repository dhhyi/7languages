puts '-----------------------------------------'

class Tree
  attr_accessor :children, :node_name

  def initialize(name, children = [])
    @children = children
    @node_name = name
    # puts "initializing #{name} with #{children.class} children"
  end

  def visit_all(&block)
    visit(&block)
    children.each do |c|
      # puts "visiting #{c}"
      c.visit_all(&block)
    end
  end

  def visit(&block)
    block.call self
  end

  def to_s
    "'#{node_name}' has #{children.length} children"
  end

  def self.from(hash, first: true)
    children = hash.collect do |key, value|
      # puts "key: #{key}, value: #{value}"
      Tree.new(key, from(value, first: false))
    end
    first ? children.first : children
  end
end

# ruby_tree = Tree.new('Ruby', [Tree.new('Reia'), Tree.new('MacRuby')])

# ruby_tree = from({ 'grandpa' => { 'father' => { 'son' => {}, 'daughter' => {} },
#   'uncle' => { 'nephew' => {}, 'niece' => {} } } })

ruby_tree = Tree.from({ 'grandpa' => {
                        'father' => {
                          'brother' => {
                            'nephew' => {},
                            'niece' => {}
                          },
                          'sister' => {},
                          'me' => {}
                        },
                        'uncle' => {
                          'cousin' => {}
                        }
                      } })

puts 'Visiting a node'
ruby_tree.visit { |node| puts node.node_name }
ruby_tree.visit { |node| puts node.children[1].node_name }
puts 'Visiting entire tree'
ruby_tree.visit_all { |node| puts node.node_name }
