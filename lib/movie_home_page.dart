import 'package:flutter/material.dart';
import 'package:my_first_flutter/api.dart';
import 'package:my_first_flutter/carousel_slider.dart';
import 'package:my_first_flutter/movie_slider.dart';
import 'package:my_first_flutter/settings.dart';
import 'package:my_first_flutter/watchlist.dart';
import 'model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void onTap(int index){
    setState(() {
      _selectedIndex = index;
      Navigator.push(context, MaterialPageRoute(builder: (context) => _classOptions.elementAt(_selectedIndex)));
    });
  }
   int _selectedIndex = 0;
  static const List<Widget> _classOptions = <Widget>[
    HomePage(),Watchlist(),Settings()
  ];

  late Future<List<Movie>> trendingMovies;
  late Future<List<Movie>> popularMovies;
  late Future<List<Movie>> upcomingMovies;
  late Future<List<Movie>> topRatedMovies;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    trendingMovies = Api().getTrendingMovies();
    popularMovies = Api().getPopularMovies();
    upcomingMovies = Api().getUpcomingMovies();
    topRatedMovies = Api().getTopRatedMovies();
  }

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: Colors.white12,
      drawer:  const Drawer(),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: BottomNavigationBar(
          backgroundColor: Colors.white24,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.red,
          currentIndex: _selectedIndex,
          onTap: onTap,
          items: const  <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.watch_later_rounded),
                label: 'Watchlist'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined),
                label: 'Settings'),
        
          ],
        ),
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData( color: Colors.white, size: 30),
        // elevation: 10,
        // shadowColor: Colors.white24,
        shape:const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20)
            )
        ),
        backgroundColor: Colors.transparent,
        actions: const [
          Padding(
            padding: EdgeInsets.only( right: 15),
            child: Icon(Icons.account_circle, size: 30, color: Colors.white,),
          ),
          SizedBox( width: 5,),
          Icon(Icons.search_rounded, size: 30, color: Colors.white,)
        ],
        title: Padding(
          padding: const EdgeInsets.only(top: 13),
          child: Image.network('https://image.tmdb.org/t/p/w500/wwemzKWzjKYJFfCeiB57q3r4Bcm.png',height: 45),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 25,),
        
            const Padding(
              padding: EdgeInsets.only(right: 300),
              child: Text('Trending', style: TextStyle(fontSize: 20, color: Colors.white),),
            ),
        
            const SizedBox(height: 5,),
        
            SizedBox(
              child: FutureBuilder(
                future: trendingMovies,
                builder: (context,snapshot){
                  if(snapshot.hasError){
                    return Center(child: Text(snapshot.error.toString()));
                  } else if (snapshot.hasData){
                    return Carousel( snapshot: snapshot,);
                  } else{
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
        
            const Padding(
              padding: EdgeInsets.only(right: 300),
              child: Text('Popular', style: TextStyle(fontSize: 20, color: Colors.white),),
            ),
        
            const SizedBox(height: 5,),
        
            SizedBox(
              child: FutureBuilder(
                future: popularMovies,
                builder: (context,snapshot){
                  if(snapshot.hasError){
                    return Center(child: Text(snapshot.error.toString(),));
                  } else if (snapshot.hasData){
                    return MovieSlider( snapshot: snapshot,);
                  } else{
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
        
            ),
        
            const Padding(
              padding: EdgeInsets.only(right: 300),
              child: Text('Top-Rated', style: TextStyle(fontSize: 20, color: Colors.white),),
            ),
        
            const SizedBox(height: 5,),
        
            SizedBox(
              child: FutureBuilder(
                future: topRatedMovies,
                builder: (context,snapshot){
                  if(snapshot.hasError){
                    return Center(child: Text(snapshot.error.toString(), ));
                  } else if (snapshot.hasData){
                    return MovieSlider( snapshot: snapshot,);
                  } else{
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
        
            ),

            const Padding(
              padding: EdgeInsets.only(right: 300),
              child: Text('Upcoming', style: TextStyle(fontSize: 20, color: Colors.white),),
            ),

            const SizedBox(height: 5,),

            SizedBox(
              child: FutureBuilder(
                future: upcomingMovies,
                builder: (context,snapshot){
                  if(snapshot.hasError){
                    return Center(child: Text(snapshot.error.toString(),));
                  } else if (snapshot.hasData){
                    return MovieSlider( snapshot: snapshot,);
                  } else{
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),

            ),





          ],
        ),
      ),
    );
  }
}
