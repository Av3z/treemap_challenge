import 'package:treemap_challenge/src/entities/coin_entity.dart';
import 'package:treemap_challenge/src/interfaces/api_repository.dart';
import 'package:treemap_challenge/src/interfaces/http_client.dart';

class ApiRepositoryImp extends ApiRepository {
  HttpClient client;

  ApiRepositoryImp(this.client);

  @override
  Future<List<CoinEntity>> fetchCoin() async {
    coinList = [];
    final response = await client.get(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=20&page=1&sparkline=false');
    if (response.statusCode == 200) {
      List<dynamic> result = [];
      result = response.data;

      if (result.isNotEmpty) {
        for (int i = 0; i < result.length; i++) {
          if (result[i] != null) {
            coinList.add(CoinEntity.fromJson(result[i]));
          }
        }
      }
      return coinList;
    } else {
      throw Exception('Não consegui carregar as moedas');
    }
  }
}
