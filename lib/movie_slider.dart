import 'package:flutter/material.dart';

import 'constants.dart';
import 'details.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({super.key, required this.snapshot});

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: snapshot.data.length,
          itemBuilder:  (context, index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>
                          DetailsScreen( movies: snapshot.data[index],)));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.network(Constants.imagepath + snapshot.data[index].posterPath,
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
