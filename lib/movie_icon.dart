// MovieIcon

import 'package:flutter/material.dart';

class MovieIcon extends StatelessWidget {
  final Map movie;

  const MovieIcon({super.key, required this.movie});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(movie['original_title']),
        Image.network(
          "https://image.tmdb.org/t/p/original" + movie['backdrop_path'],
          fit: BoxFit.cover,
          height: 200,
          width: double.infinity,
          alignment: Alignment.center,
        )
      ],
    );
    // return Column(children: [
    //   Text(movie['original_title']),
    //   Image.network(
    //     "https://image.tmdb.org/t/p/original" + movie['backdrop_path'],
    //     fit: BoxFit.cover,
    //     height: 200,
    //     width: double.infinity,
    //     alignment: Alignment.center,
    //   )
    // ]);
  }
}

// {adult: false, backdrop_path: /4woSOUD0equAYzvwhWBHIJDCM88.jpg, genre_ids: [28, 27, 53], id: 1096197, original_language: en, original_title: No Way Up, overview: Characters from different backgrounds are thrown together when the plane they're travelling on crashes into the Pacific Ocean. A nightmare fight for survival ensues with the air supply running out and dangers creeping in from all sides., popularity: 2757.43, poster_path: /hu40Uxp9WtpL34jv3zyWLb5zEVY.jpg, release_date: 2024-01-18, title: No Way Up, video: false, vote_average: 5.7, vote_count: 65}

