import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Watchlist extends StatefulWidget {

   const Watchlist({super.key});

  @override
  State<Watchlist> createState() => WatchlistState();
}

class WatchlistState extends State<Watchlist> {
  late SharedPreferences sp;
  loadSharedPreferences ()async{
    sp = await SharedPreferences.getInstance();
    readData();
  }
  @override
  void initState() {
    // TODO: implement initState
    loadSharedPreferences();
    super.initState();
  }
  saveData()async{
    sp.setStringList('Watchlist', Datastore().watchlist);
    readData();
  }
  readData()async{
    List<String>? newList = await sp.getStringList('Watchlist');
    if (newList!= null){
      setState(() {
        Datastore().watchlist = newList;
        print(newList);
      });
    }

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
      body: ScopedModel.of<Datastore>(context, rebuildOnChange: true)
          .watchlist.isEmpty
          ? const Center(child:  Text('Your Watchlist Is Empty !',
            style: TextStyle(fontSize: 25, color: Colors.white),))
          : Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: <Widget>[
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 15),
                itemCount: ScopedModel.of<Datastore>(context,
                    rebuildOnChange: true)
                    .total,
                itemBuilder: (context, index) {
                  return ScopedModelDescendant<Datastore>(
                    builder: (context, child, model) {
                      return ListTile(
                        trailing: const Icon(Icons.favorite, color: Colors.red,size: 30,),
                        title: Text(model.watchlist[index],style:
                        const TextStyle(fontSize: 25,color: Colors.white),),
                      );
                    },
                  );
                },
              ),
            ),])),);
  }

}

class Datastore extends Model{
   List<String> watchlist = List.empty(growable: true);
   int get total => watchlist.length;
   setValue (String title) async {
    watchlist.add(title);
    WatchlistState().saveData;
    notifyListeners();
  }
}