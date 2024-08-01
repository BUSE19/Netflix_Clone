import 'package:flutter/material.dart';
import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/models/upcoming_model.dart';
import 'package:netflix_clone/screens/movie_detailed_screen.dart';

class MovieCardWidget extends StatelessWidget {
  final Future<UpcomingMovieModel> future;
  final String headLineText;
  const MovieCardWidget(
      {super.key, required this.future, required this.headLineText});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data?.results;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  headLineText,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.all(10),
                      itemCount: data!.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MovieDetailedScreen(
                                        movieId: data[index].id)));
                          },
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            child: Image.network(
                                "$imageUrl${data[index].posterPath}"),
                          ),
                        );
                      }),
                )
              ],
            );
          } else {
            return const SizedBox.shrink();
          }
        });
  }
}
