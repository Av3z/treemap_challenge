class CoinEntity {
  String name;
  String symbol;
  String imageUrl;
  double price;
  double change;
  double changePercentage;

  CoinEntity({
    required this.name,
    required this.symbol,
    required this.imageUrl,
    required this.price,
    required this.change,
    required this.changePercentage,
  });

  factory CoinEntity.fromJson(Map<String, dynamic> json) {
    return CoinEntity(
      name: json['name'],
      symbol: json['symbol'],
      imageUrl: json['image'],
      price: json['current_price'],
      change: json['price_change_24h'],
      changePercentage: json['price_change_percentage_24h'],
    );
  }
}

List<CoinEntity> coinList = [];
