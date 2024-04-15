/* BST contains two columns: N and P, where N represents the value of a node in Binary Tree, 
and P is the parent of N*/
/* Write a query to find the node type of Binary Tree */
SELECT N AS node, 
CASE 
WHEN P IS NULL THEN 'Root'
WHEN N IN (SELECT P FROM BST) THEN 'Inner'
ELSE 'Leaf'
END AS n_type
FROM BST
/* order by the value of the node*/
ORDER BY node;