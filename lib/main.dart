import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'now_playing.dart';
// import 'default_text.dart';
// import 'package:tmdb_api/tmdb_api.dart';
// import 'tmdb_api.dart';

// https://pub.dev/packages/flutter_dotenv
// Future main() async {
//   runApp(MyApp());
// }

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

  // List now_playing_movies = [];

  _handleSearch(String input) {
    print(input);
  }

  loadNowPlayingMovies() async {
    await dotenv.load(fileName: "assets/.env");
    final String read_access_token = dotenv.get('READ_ACCESS_TOKEN');
    final String api_key = dotenv.get('API_KEY');

    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(api_key, read_access_token),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));
    Map now_playing_res = await tmdbWithCustomLogs.v3.movies.getNowPlaying();
    Map popular_res = await tmdbWithCustomLogs.v3.movies.getPopular();
    Map top_rated_res = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map upcoming_res = await tmdbWithCustomLogs.v3.movies.getUpcoming();
    setState(() {
      now_playing = now_playing_res['results'];
      popular = popular_res['results'];
      top_rated = top_rated_res['results'];
      upcoming = upcoming_res['results'];
    });
  }

  @override
  void initState() {
    loadNowPlayingMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var nowPlaing = NowPlaing(
      nowPlaing: now_playing,
    );
/*
    var search = SizedBox(
      height: 45,
      width: 360,
      child: TextField(
        style: GoogleFonts.poppins(
          color: const Color(0xff020202),
          fontSize: 20,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
        ),
        onChanged: _handleSearch,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xfff1f1f1),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          hintText: "Search",
          hintStyle: GoogleFonts.poppins(
              color: const Color(0xffb2b2b2),
              fontSize: 20,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.5,
              decorationThickness: 6),
          prefixIcon: const Icon(Icons.search),
          prefixIconColor: Colors.black,
        ),
      ),
    );
    */
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello what do you want to watch?'),
      ),
      body: nowPlaing,
    );
  }
}
