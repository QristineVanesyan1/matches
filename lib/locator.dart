import 'package:get_it/get_it.dart';
import 'package:matches/repositories/matches_repo.dart';

final serviceLocator = GetIt.instance;
void setup() {
  serviceLocator.registerLazySingleton<MatchesRepo>(() => MatchesRepoImpl());
}
