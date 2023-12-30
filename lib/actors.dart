import 'package:flutter/material.dart';
import 'package:my_first_flutter/api.dart';

import 'constants.dart';

class Actors extends StatefulWidget {
  final int movieId;
  const Actors(this.movieId, {super.key});
  @override
  State<Actors>  createState() => _ActorsState(movieId);
}

class _ActorsState extends State<Actors> {
  late int movieId;
  _ActorsState(this.movieId);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Api().getCast(movieId),
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return  Center(
            child: Text(snapshot.error.toString(),style: const TextStyle(color: Colors.cyan),),
          );
        } else {
          snapshot.data.cast.removeWhere((item) => item['profile_path'] == null);
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 2,
              itemBuilder: (context, index) {
                final String actorImage = Constants.imagepath + snapshot.data[index].profilePath;
                final String actorName = snapshot.data[index]['name'];
                return SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Card(
                    elevation: 5.0,
                    child: Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Image.network(actorImage),
                        ),
                        Text(
                          actorName,
                          style: const TextStyle(
                              fontSize: 11.0, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
