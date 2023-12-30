// import 'package:flutter/material.dart';
// import 'package:my_first_flutter/api.dart';
//
// import 'constants.dart';
//
//
// class Actors extends StatefulWidget {
//
//   const Actors( {super.key});
//   @override
//   _ActorsState createState() => _ActorsState();
// }
//
// class _ActorsState extends State<Actors> {
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: Api().getCast(),
//       builder: (context, AsyncSnapshot snapshot) {
//         if (!snapshot.hasData) {
//           return Center(
//             child: Image.asset('lib/images/google.png'),
//           );
//         } else {
//           final List castData = snapshot.data.cast;
//           castData.removeWhere((item) => item['profile_path'] == null);
//           return SizedBox(
//             height: MediaQuery.of(context).size.height * 0.3,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: castData.length,
//               itemBuilder: (context, index) {
//                 final String actorImage = castData[index]['profile_path'];
//                 final String actorName = castData[index]['name'];
//                 return Container(
//                   width: MediaQuery.of(context).size.width * 0.3,
//                   child: Card(
//                     elevation: 5.0,
//                     child: Column(
//                       children: <Widget>[
//                         Container(
//                           width: MediaQuery.of(context).size.width * 0.3,
//                           child: FadeInImage.assetNetwork(
//                               placeholder: 'assets/images/loading.gif',
//                               image:
//                               'http://image.tmdb.org/t/p/w780/$actorImage'),
//                         ),
//                         Text(
//                           actorName,
//                           style: TextStyle(
//                               fontSize: 11.0, fontWeight: FontWeight.bold),
//                         )
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           );
//         }
//       },
//     );
//   }
// }