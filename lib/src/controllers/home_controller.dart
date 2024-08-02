import 'package:treemap_challenge/src/entities/coin_entity.dart';
import 'package:treemap_challenge/src/interfaces/api_repository.dart';

class HomeController {
  final ApiRepository _apiRepository;

  HomeController(this._apiRepository);

  Future<List<CoinEntity>> fetchCoin() async {
    return await _apiRepository.fetchCoin();
  }
}
