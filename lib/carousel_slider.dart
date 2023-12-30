import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_first_flutter/details.dart';
import 'constants.dart';

class Carousel extends StatelessWidget {
  const Carousel ({super.key, required this.snapshot});
  final AsyncSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: snapshot.data.length,
      itemBuilder: ( context, itemIndex, pageViewIndex){
        return GestureDetector(
          onTap: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context)=>
                DetailsScreen( movies: snapshot.data[itemIndex],)));
          },
          child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: Image.network(Constants.imagepath + snapshot.data[itemIndex].posterPath,
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
        );
      } ,
      options: CarouselOptions(
          height: 275.0,
          enlargeCenterPage: true,
          autoPlay: true,
          aspectRatio: 16/9,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: false,
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          viewportFraction: 0.44,
          scrollDirection: Axis.horizontal
      ),
    ) ;
  }
}
















