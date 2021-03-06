module BST where

data BST a = Empty | Node (BST a) a (BST a) deriving (Show, Eq, Ord, Read)

--- Takes a list and returns a Binary Search Tree that contains all of the elements from the list.
inserter :: Ord a => [a] -> BST a
inserter xs = foldl (\acc a -> insert acc a) Empty xs


--- Takes a BST and an Element and returns a new Binary Search Tree with that element in it.
insert :: Ord a => BST a -> a -> BST a
insert Empty x = Node Empty x Empty
insert (Node left y right) x=
	if x == y
		then (Node left y right)
		else
			if x < y 
			then Node (insert left x) y right
			else Node left y (insert right x)


--- Takes a Binary Search Tree and an Element, Returns True if the tree contains that element, False otherwise 
inTree :: Ord a => BST a -> a -> Bool
inTree Empty _ = False
inTree (Node left x right) y = if x == y then True
	else
		if y < x then inTree left y
			else inTree right y

--- Takes a Binary Search Tree and an Element, Returns a new Binary Search Tree without the element.
delete :: Ord a => BST a -> a -> BST a
delete t@(Node left x right) y = if inTree t y 
	then
		if y < x 
		then (Node (delete left y) x right)
		else 
			if y > x
			then (Node left x (delete right y))
			else deleteNode t
	else t

--- Takes a Binary Search Tree, Deletes the root and returns the rest of the Binary Search Tree
deleteNode :: Ord a => BST a -> BST a
deleteNode (Node left x right) = if left == Empty 
								 then right
								 else
									 if right == Empty
									 then left
									 else (Node left (leftMost right) (update right))

--- Takes a Binary Search Tree, Returns the element in the left-most Node.
leftMost :: Ord a => BST a -> a
leftMost (Node Empty x _) = x
leftMost (Node left x _) = leftMost left

--- Takes a Binary Search Tree, Returns a new Binary Search Tree after removing the left-most Node from the original tree.
update :: Ord a => BST a -> BST a
update Empty = Empty
update t@(Node left x right) =  if x == (leftMost t)
								then delete t x
							 	else 
									if x < (leftMost t) 
									then Node left x (update right)
									else Node (update left) x right