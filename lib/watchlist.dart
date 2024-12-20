import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Watchlist extends StatefulWidget {

   const Watchlist({super.key});

  @override
  State<Watchlist> createState() => WatchlistState();
}
class WatchlistState extends State<Watchlist> {
  List<String> newlist =[];
  // late SharedPreferences sp;
  loadSharedPreferences ()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    readData();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadSharedPreferences();
  }
  saveData()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setStringList('Watchlist', Datastore().watchlist);
    readData();
  }
  readData()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    newlist = (await sp.getStringList('Watchlist'))!;
    // setState(() {
    //   Datastore().watchlist = newList;
    //   print(newList);
    // });
    Datastore().watchlist = newlist;
    print(newlist);

  }
   @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white12,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
        title: const  Padding(
          padding: EdgeInsets.only(left: 35, top: 10),
          child:  Row(
            children: [
              Text('Watchlist', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.red),),
              SizedBox(width: 10,),
              Icon(Icons.table_rows_sharp, color: Colors.red, size: 30,)
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: newlist.isEmpty
          ? const Center(child:  Text('Your Watchlist Is Empty !',
            style: TextStyle(fontSize: 25, color: Colors.white),))
          : Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: <Widget>[
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 15),
                itemCount: newlist.length,
                itemBuilder: (context, index) {
                  return ScopedModelDescendant<Datastore>(
                    builder: (context, child, model){
                      return ListTile(
                        trailing: const Icon(Icons.favorite, color: Colors.red,size: 30,),
                        title: Text(newlist[index],style:
                        const TextStyle(fontSize: 25,color: Colors.white),),
                      );
                    },
                  );
                },
              ),
            ),])),);}}

class Datastore extends Model{
   List<String> watchlist = List.empty(growable: true);
   int get total => watchlist.length;
   void setValue (String title,)async{
     SharedPreferences prefs = await SharedPreferences.getInstance();
     List<String>? watchlist= await prefs.getStringList('Watchlist') ?? [];
    watchlist.add(title);
    prefs.setStringList('Watchlist', watchlist);
    print('correct');
    print(watchlist.length);
    print('adding');
    WatchlistState().saveData;
    print('saving');
    WatchlistState().readData();
    notifyListeners();
  }
}