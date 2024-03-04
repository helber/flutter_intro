import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'playlist.dart';

const List<String> genre = <String>[
  'Em cartaz',
  'Populares',
  'Melhores avaliados',
  'Em breve'
];
String selectedGenge = genre.first;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.dark, primaryColor: Colors.lightBlueAccent),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Em cartaz (/movie/now_playing)
  List now_playing = [];
  // Populares (/movie/popular)
  List popular = [];
  // Melhores avaliados (/movie/top_rated)
  List top_rated = [];
  // Em breve (/movie/upcoming)
  List upcoming = [];

  loadNowPlayingMovies() async {
    try {
      await dotenv.load(fileName: "assets/.env");
    } catch (e) {}
    final String read_access_token = dotenv.get('READ_ACCESS_TOKEN');
    final String api_key = dotenv.get('API_KEY');

    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(api_key, read_access_token),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));
    Map now_playing_res =
        await tmdbWithCustomLogs.v3.movies.getNowPlaying(language: "pt");
    Map popular_res = await tmdbWithCustomLogs.v3.movies.getPopular();
    Map top_rated_res = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map upcoming_res = await tmdbWithCustomLogs.v3.movies.getUpcoming();
    // Map query = await tmdbWithCustomLogs.v3.genres.getMovieList();
    setState(() {
      now_playing = now_playing_res['results'];
      popular = popular_res['results'];
      top_rated = top_rated_res['results'];
      upcoming = upcoming_res['results'];
    });
  }

  // void filterMovies(String query) {}

  final controller = TextEditingController();
  @override
  void initState() {
    loadNowPlayingMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var nowPlaingWidget = PlayList(
      playList: now_playing,
    );
    var popularWidget = PlayList(
      playList: popular,
    );
    var topRatedWidget = PlayList(
      playList: top_rated,
    );
    var upcomingWidget = PlayList(
      playList: upcoming,
    );
    // DropdownButton
    var genreWidget = DropdownButton<String>(
      value: selectedGenge,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.white),
      underline: Container(
        height: 2,
        color: Colors.white,
      ),
      onChanged: (String? value) {
        setState(() {
          selectedGenge = value!;
        });
      },
      items: genre.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
    // Search Field
    // var searchWidget = TextField(
    //   onChanged: filterMovies,
    //   controller: controller,
    //   decoration: InputDecoration(
    //       hintText: "Hello what do you want to watch?",
    //       border: OutlineInputBorder(
    //           borderRadius: BorderRadius.circular(10),
    //           borderSide: const BorderSide(color: const Color(0x0000FA)))),
    // );
    // Current Widget
    Widget getCurrentWidget(String genre) {
      print(genre);
      switch (genre) {
        case 'Populares':
          return popularWidget;
        case 'Melhores avaliados':
          return topRatedWidget;
        case 'Em breve':
          return upcomingWidget;
      }
      // 'Em cartaz'
      return nowPlaingWidget;
    }

    // Return new widget
    return Scaffold(
        appBar: AppBar(title: genreWidget),
        body: getCurrentWidget(selectedGenge));
  }
}
