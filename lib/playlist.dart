import 'package:flutter/material.dart';
import 'movie_icon.dart';

class PlayList extends StatelessWidget {
  final List playList;

  const PlayList({super.key, required this.playList});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: ListView.builder(
        itemCount: playList.length,
        itemBuilder: (context, index) {
          return MovieIcon(
            movie: playList[index],
          );
        },
      ),
    );
  }
}
