import 'package:flutter/material.dart';

class CoinItem extends StatelessWidget {
  final String name;
  final String symbol;
  final String imageUrl;
  final double price;
  final double change;
  final double changePercentage;

  const CoinItem({
    super.key,
    required this.name,
    required this.symbol,
    required this.imageUrl,
    required this.price,
    required this.change,
    required this.changePercentage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[900], borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Image.network(height: 68, width: 68, imageUrl),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Text(symbol),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '\$ $price',
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    (change < 0) ? '$change' : '+$change',
                    style: TextStyle(
                        color: (change < 0) ? Colors.red : Colors.green,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    (changePercentage < 0)
                        ? '$changePercentage%'
                        : '+$changePercentage%',
                    style: TextStyle(
                        color:
                            (changePercentage < 0) ? Colors.red : Colors.green,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
