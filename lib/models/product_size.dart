class ProductSize {
  final String name;
  bool isSelected = false;
  ProductSize(this.name);

  void toggleSelected() {
    isSelected = !isSelected;
  }
}
