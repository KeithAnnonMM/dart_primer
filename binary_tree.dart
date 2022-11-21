import 'dart:io';

import 'node.dart';

class BinarySearchTree {
  TreeNode root;
  List<int> duplicates = [];
  List<int> tree = [];

  BinarySearchTree({required this.root});

  void addNode(TreeNode node) {
    tree.add(root.key);
    while (true) {
      if (node.key > root.key) {
        if (root.right == null) {
          root.right = node;
          tree.add(node.key);
          break;
        } else {
          root = root.right;
        }
      } else if (node.key < root.key) {
        if (root.left == null) {
          root.left = node;
          tree.add(node.key);
          break;
        } else {
          root = root.left;
        }
      } else {
        duplicates.add(node.key);
        break;
      }
    }
  }

  void checkduplicates() {
    print('Duplicates:$duplicates');
  }

  void returnTree() {
    print('Tree $tree');
  }
}

void main() {
  TreeNode treeRoot = TreeNode(key: 14);
  BinarySearchTree tree = BinarySearchTree(root: treeRoot);
  int x = 0;
  while (x < 4) {
    print('Enter node:');
    int value = int.parse(stdin.readLineSync().toString());
    tree.addNode(TreeNode(key: value));
    x++;
  }
  tree.returnTree();
  tree.checkduplicates();
}
