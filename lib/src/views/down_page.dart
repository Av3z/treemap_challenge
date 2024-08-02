import 'package:flutter/material.dart';
import 'package:treemap_challenge/src/controllers/home_controller.dart';
import 'package:treemap_challenge/src/entities/coin_entity.dart';
import 'package:treemap_challenge/src/repositories/api_repository_imp.dart';
import 'package:treemap_challenge/src/repositories/dio_client.dart';
import 'package:treemap_challenge/src/views/components/tree_map_container.dart';
import 'package:treemap_challenge/src/views/components/tree_map_item.dart';

class DownPage extends StatefulWidget {
  const DownPage({super.key});

  @override
  State<DownPage> createState() => _DownPageState();
}

class _DownPageState extends State<DownPage> {
  final HomeController homeController =
      HomeController(ApiRepositoryImp(DioClient()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: FutureBuilder<List<CoinEntity>>(
        future: homeController.fetchCoin(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nenhuma moeda cadastrada!'));
          } else {
            final coinList = snapshot.data!;
            final treeMapItems =
                coinList.where((coin) => coin.changePercentage < 0).map((coin) {
              return TreeMapItem(
                percentage: coin.changePercentage,
                down: true,
                child: Center(
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(text: coin.symbol.toUpperCase()),
                      TextSpan(text: " ${coin.changePercentage.toString()}%"),
                    ]),
                  ),
                ),
              );
            }).toList();

            return TreeMapContainer(widgets: treeMapItems);
          }
        },
      ),
    );
  }
}
