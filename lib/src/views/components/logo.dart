import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: [
          Text(
            'Coin',
            style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                fontSize: 42),
          ),
          Text(
            'Price',
            style: TextStyle(
                color: Colors.green, fontWeight: FontWeight.bold, fontSize: 42),
          )
        ],
      ),
    );
  }
}
