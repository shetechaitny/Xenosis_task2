class Node {
    int value;
    Node left;
    Node right;

    public Node(int value) {
        this.value = value;
        left = null;
        right = null;
    }
}
public class BST {
    private Node root;

    public BST() {
        root = null;
    }
public void insert(int value) {
        root = insertRec(root, value);
    }
    private Node insertRec(Node root, int value) {
        if (root == null) {
            root = new Node(value);
            return root;
        }
        if (value < root.value) {
            root.left = insertRec(root.left, value);
        } else if (value > root.value) {
            root.right = insertRec(root.right, value);
        }

        return root;
    }
    public void delete(int value) {
        root = deleteRec(root, value);
    }
    private Node deleteRec(Node root, int value) {
        if (root == null) {
            return root;
        }
        if (value < root.value) {
            root.left = deleteRec(root.left, value);
        } else if (value > root.value) {
            root.right = deleteRec(root.right, value);
        } else {
             if (root.left == null) {
                return root.right;
            } else if (root.right == null) {
                return root.left;
            }
            root.value = minValue(root.right);
            root.right = deleteRec(root.right, root.value);
        }

        return root;
    }
    private int minValue(Node root) {
        int minValue = root.value;
        while (root.left != null) {
            root = root.left;
            minValue = root.value;
        }
        return minValue;
    }
    public boolean search(int value) {
        return searchRec(root, value);
    }
    private boolean searchRec(Node root, int value) {
        if (root == null) {
            return false;
        }
        if (value < root.value) {
            return searchRec(root.left, value);
        } else if (value > root.value) {
            return searchRec(root.right, value);
        } else {
            return true;
        }
    }
    public void inOrder() {
        inOrderRec(root);
        System.out.println();
    }
    private void inOrderRec(Node root) {
        if (root != null) {
            inOrderRec(root.left);
            System.out.print(root.value + " ");
            inOrderRec(root.right);
        }
    }
    public void preOrder() {
        preOrderRec(root);
        System.out.println();
    }
    private void preOrderRec(Node root) {
        if (root != null) {
            System.out.print(root.value + " ");
            preOrderRec(root.left);
            preOrderRec(root.right);
        }
    }
    public void postOrder() {
        postOrderRec(root);
        System.out.println();
    }
    private void postOrderRec(Node root) {
        if (root != null) {
            postOrderRec(root.left);
            postOrderRec(root.right);
            System.out.print(root.value + " ");
        }
    }
    public static void main(String[] args) {
        BST bst = new BST();
        bst.insert(50);
        bst.insert(30);
        bst.insert(20);
        bst.insert(40);
        bst.insert(70);
        bst.insert(60);
        bst.insert(80);
        System.out.print("In-order traversal: ");
        bst.inOrder();
        System.out.print("Pre-order traversal: ");
        bst.preOrder();
        System.out.print("Post-order traversal: ");
        bst.postOrder();
        System.out.println("Search 40: " + bst.search(40));
        System.out.println("Search 90: " + bst.search(90));
        bst.delete(20);
        System.out.print("In-order traversal after deleting 20: ");
        bst.inOrder();
        bst.delete(30);
        System.out.print("In-order traversal after deleting 30: ");
        bst.inOrder();
        bst.delete(50);
        System.out.print("In-order traversal after deleting 50: ");
        bst.inOrder();
    }
}
