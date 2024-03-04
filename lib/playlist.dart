import 'package:flutter/material.dart';
import 'movie_icon.dart';

class PlayList extends StatelessWidget {
  final List playList;

  const PlayList({Key? key, required this.playList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
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
