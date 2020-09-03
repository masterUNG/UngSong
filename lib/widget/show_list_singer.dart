import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ung_song/models/singlemodel.dart';
import 'package:ung_song/widget/show_list_song.dart';

class ShowListSinger extends StatefulWidget {
  final String gendle;

  ShowListSinger({Key key, this.gendle}) : super(key: key);

  @override
  _ShowListSingerState createState() => _ShowListSingerState();
}

class _ShowListSingerState extends State<ShowListSinger> {
  String gendle;
  List<SingleModel> singleModels = List();
  List<String> documentSingles = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gendle = widget.gendle;
    readData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List $gendle Singer'),
      ),
      body: singleModels.length == 0
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: singleModels.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShowListSong(
                      singleModel: singleModels[index],
                      documentSinger: documentSingles[index],
                      gendle: gendle,
                    ),
                  ),
                ),
                child: Card(color: index % 2 == 0 ? Colors.brown : Colors.brown.shade100 ,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      singleModels[index].name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: index%2 == 0 ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  Future<Null> readData() async {
    Firebase.initializeApp().then((value) async {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      await firestore
          .collection('MainSong')
          .document(gendle)
          .collection('Singer')
          .snapshots()
          .listen((event) {
        for (var snapshot in event.documents) {
          print('idDoc ==>> ${snapshot.documentID}');
          SingleModel model = SingleModel.fromJson(snapshot.data());
          String documentSingle = snapshot.documentID;
          documentSingles.add(documentSingle);
          setState(() {
            singleModels.add(model);
          });
        }
      });
    });
  }
}
