class Node:
    def __init__(self, val):
        self.left = None
        self.right = None
        self.val = val

def search(root, key):
    if(root is None or root.val == key):
        return root

    if root.val < key:
        return search(root.right, key)
    else:
        return search(root.left, key)

def insert(root, node):
    if root is None:
        root = node
    else:
        if(root.val < node.val):
            if root.right is None:
                root.right = node
            else:
                insert(root.right, node)
        else:
            if root.left is None:
                root.left = node
            else:
                insert(root.left, node)

def delete(root, key):
    if root is None:
        return root
    if root.val > key:
        root.left = delete(root.left, key)
    elif root.val < key:
        root.right = delete(root.right, key)
    else:
        if root.left is None:
            temp = root.right
            root = None
            return temp

        elif root.right is None:
            temp = root.left
            root = None
            return temp

        temp = minValueNode(root.right)
        root.val = temp.val
        root.right = delete(root.right, temp.val)

    return root

def minValueNode(node):
    cur = node

    while(cur.left is not None):
        cur = cur.left
    return cur


def inorder(root):
    if root:
        inorder(root.left)
        print root.val,
        inorder(root.right)

r = Node(50)
insert(r, Node(30))
insert(r, Node(20))
insert(r, Node(40))
insert(r, Node(70))
insert(r, Node(60))
insert(r, Node(80))

inorder(r)
print
r = delete(r, 20)
inorder(r)
print
r = delete(r, 30)
inorder(r)
print
r = delete(r, 50)
inorder(r)
r = delete(r, 80)
print
inorder(r)
