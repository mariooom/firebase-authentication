class Item {
  final String name;
  final String imagePath;

  Item({required this.name, required this.imagePath});
}

List<Item> items = [
  Item(name: "Men Jacket", imagePath: "assets/images/jacket_men.jpeg"),
  Item(name: "Women Jacket", imagePath: "assets/images/jacket_women.jpeg"),
  Item(name: "Kids", imagePath: "assets/images/kids.jpeg"),
  Item(name: "Men", imagePath: "assets/images/men.jpeg"),
  Item(name: "Men Pullover", imagePath: "assets/images/pull_men.jpeg"),
  Item(name: "Women Pullover", imagePath: "assets/images/pull_women.jpeg"),
  Item(name: "Women", imagePath: "assets/images/women.jpeg"),
];
