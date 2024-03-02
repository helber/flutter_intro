import 'package:flutter/material.dart';
import 'movie_icon.dart';

class NowPlaing extends StatelessWidget {
  final List nowPlaing;

  const NowPlaing({Key? key, required this.nowPlaing}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: ListView.builder(
        itemCount: nowPlaing.length,
        itemBuilder: (context, index) {
          return MovieIcon(
            movie: nowPlaing[index],
          );
        },
      ),
    );
    /*
        return Container(
      padding: EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Now playing'),
            Container(
              height: 80,
              child: ListView.builder(
                itemCount: nowPlaing.length,
                itemBuilder: (context, index) {
                  return MovieIcon(
                    movie: nowPlaing[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
    */
  }
}
