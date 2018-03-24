class Node
  attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
  end
end

def search(root, k)
  if root.nil? || root.data == k
    return root
  end
  if k < root.data
    return search(root.left, k)
  else
    return search(root.right, k)
  end
end

def insert(root, k)
  if root.nil?
    return Node.new(k)
  end
  if k < root.data
    root.left = insert(root.left, k)
  else
    root.right = insert(root.right, k)
  end
  return root
end

def inorder(root)
  if root.nil?
    return
  end
  inorder(root.left)
  print root.data, " "
  inorder(root.right)
end

root = insert(nil, 15)
root = insert(root, 20)
root = insert(root, 25)
root = insert(root, 30)
root = insert(root, 5)
root = insert(root, 10)

puts search(root, 15)

inorder(root)

puts