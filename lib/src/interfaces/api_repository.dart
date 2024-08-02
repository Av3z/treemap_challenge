import 'package:treemap_challenge/src/entities/coin_entity.dart';

abstract class ApiRepository {
  Future<List<CoinEntity>> fetchCoin();
}
