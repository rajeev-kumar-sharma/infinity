class Node
  attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
  end
end

def inorder(root)
  if root.nil?
    return
  end
  inorder(root.left)
  print root.data, " "
  inorder(root.right)
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

def find_min(root)
  min = root.data
  unless root.left.nil?
    min = root.left.data
    root = root.left
  end
  min
end

def delete(root, k)
  if root.nil?
    return root
  end
  if k < root.data
    root.left = delete(root.left, k)
  elsif k > root.data
    root.right = delete(root.right, k)
  else
    if root.left.nil?
      return root.right
    elsif root.right.nil?
      return root.left
    else
      root.data = find_min(root.right)
      root.right = delete(root.right, root.data)
    end
  end
  return root
end

root = insert(nil, 15)
root = insert(root, 20)
root = insert(root, 25)
root = insert(root, 30)
root = insert(root, 5)
root = insert(root, 10)

inorder(root)

puts

delete(root, 15)

inorder(root)

puts
