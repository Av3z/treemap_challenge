import 'package:flutter/material.dart';
import 'package:treemap_challenge/src/controllers/home_controller.dart';
import 'package:treemap_challenge/src/entities/coin_entity.dart';
import 'package:treemap_challenge/src/repositories/api_repository_imp.dart';
import 'package:treemap_challenge/src/repositories/dio_client.dart';
import 'package:treemap_challenge/src/views/components/bottom_bar.dart';
import 'package:treemap_challenge/src/views/components/coin_item.dart';
import 'package:treemap_challenge/src/views/components/logo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController homeController = HomeController(ApiRepositoryImp(DioClient()));
  List<CoinEntity> coinList = [];

  loadCoins() async {
    coinList = await homeController.fetchCoin();
  }

  @override
  void initState() {
    loadCoins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomBar(),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Logo(),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height,
                child: FutureBuilder(
                  future: homeController.fetchCoin(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData) {
                      return const Center(
                          child: Text('Nenhuma moeda cadastrada!'));
                    } else {
                      final coinList = snapshot.data!;
                      return ListView.builder(
                        itemCount: coinList.length,
                        itemBuilder: (context, index) {
                          final coin = coinList[index];
                          return CoinItem(
                            name: coin.name,
                            symbol: coin.symbol,
                            imageUrl: coin.imageUrl,
                            price: coin.price,
                            change: coin.change,
                            changePercentage: coin.changePercentage,
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
