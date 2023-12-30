import 'package:flutter/material.dart';
import 'package:my_first_flutter/actors.dart';
import 'package:my_first_flutter/model.dart';
import 'constants.dart';



class DetailsScreen extends StatelessWidget {
  const DetailsScreen ({super.key, required this.movies});

  final Movie movies;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            // backgroundColor: Colors.white12,
            leading: Container(
              height: 70,
              width: 70,
              margin: const EdgeInsets.only(top: 16, left: 16),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(16)
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_outlined, color: Colors.white,),
                  onPressed: (){
                  Navigator.pop(context);
                  },
              ),
            ),
            pinned: true,
            expandedHeight: 500,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(movies.title,
                  // textAlign: TextAlign.right,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w700),),
              background: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24)
                ),
                child: Image.network(Constants.imagepath + movies.posterPath,
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 15,),
                const Center(
                    child: Text('Overview',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),)),
                const SizedBox(height: 15,),
                Text(movies.overview,
                      style: const
                      TextStyle( fontSize: 21, fontWeight: FontWeight.w300, color: Colors.white),),
                const SizedBox(height: 15,),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(16)
                      ),
                      child: Row(
                        children:  [
                          const Text('Release Date: ',
                            style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),),
                          Text(movies.releaseDate,
                            style: const TextStyle( color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(16)
                      ),
                      child: Row(
                        children:  [
                          const Row(
                            children: [
                              Text('Ratings: ',
                                style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),),
                              Icon(Icons.star, color: Colors.yellow,)
                            ],
                          ),
                          Text('${movies.voteAverage}/10',
                            style: const TextStyle( color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),)
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 25,),
                Actors(movies.movieId)

              ],
            ),
          ),
        ],
      ),
    );
  }
}