import 'package:flutter/material.dart';
import 'package:treemap_challenge/src/views/down_page.dart';
import 'package:treemap_challenge/src/views/home_page.dart';
import 'package:treemap_challenge/src/views/up_page.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: (value) {
          if (value == 0) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ));
          }

          if (value == 1) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const UpPage(),
                ));
          }

          if (value == 2) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DownPage(),
                ));
          }
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded), label: 'Inicio'),
          BottomNavigationBarItem(
            icon: Icon(Icons.upload_rounded),
            label: 'Positivas',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.download_rounded), label: 'Negativas')
        ]);
  }
}
