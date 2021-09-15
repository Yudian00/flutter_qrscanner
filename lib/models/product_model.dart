class Product {
  String productName;
  String imageUrl;
  String itemId;
  String height;
  String currentStock;
  String currentPrice;

  Product({
    required this.productName,
    required this.imageUrl,
    required this.itemId,
    required this.height,
    required this.currentPrice,
    required this.currentStock,
  });

  @override
  String toString() {
    return '{productName: $productName, imageUrl: $imageUrl, itemId: $itemId, height: $height,currentPrice: $currentPrice,currentStock: $currentStock}';
  }
}
