import 'package:tmdb_api/tmdb_api.dart';

Future<void> main(List<String> args) async {
  //api with out console logs
  final tmdb =
      TMDB(ApiKeys('c326c9631afa3b3e06ef3723affc61b1', 'apiReadAccessTokenv4'));
  print(await tmdb.v3.movies.getPopular());

  //api with showing all console logs
  final tmdbWithLogs = TMDB(
    ApiKeys('c326c9631afa3b3e06ef3723affc61b1', 'apiReadAccessTokenv4'),
    logConfig: const ConfigLogger.showAll(),
  );
  print(await tmdbWithLogs.v3.movies.getPopular());

  //api with showing all console logs
  final tmdbWithCustomLogs = TMDB(
    ApiKeys('c326c9631afa3b3e06ef3723affc61b1', 'apiReadAccessTokenv4'),
    logConfig: const ConfigLogger(
      //must be true than only all other logs will be shown
      showLogs: true,
      showErrorLogs: true,
    ),
  );
  print(await tmdbWithCustomLogs.v3.movies.getPopular());
}
