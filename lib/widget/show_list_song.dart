import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ung_song/models/singlemodel.dart';
import 'package:ung_song/models/songmodel.dart';
import 'package:ung_song/widget/detail_song.dart';

class ShowListSong extends StatefulWidget {
  final SingleModel singleModel;
  final String documentSinger, gendle;

  ShowListSong({Key key, this.singleModel, this.documentSinger, this.gendle})
      : super(key: key);

  @override
  _ShowListSongState createState() => _ShowListSongState();
}

class _ShowListSongState extends State<ShowListSong> {
  SingleModel singleModel;
  String documentSinger, gendle;
  List<SongModel> songModels = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    singleModel = widget.singleModel;
    documentSinger = widget.documentSinger;
    gendle = widget.gendle;
    Firebase.initializeApp().then((value) => readData());
  }

  Future<Null> readData() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    await firestore
        .collection('MainSong')
        .document(gendle)
        .collection('Singer')
        .document(documentSinger)
        .collection('Song')
        .snapshots()
        .listen((event) {
      for (var map in event.documents) {
        SongModel model = SongModel.fromJson(map.data());
        setState(() {
          songModels.add(model);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(singleModel == null ? 'Singer' : singleModel.name),
      ),
      body: songModels.length == 0
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(padding: EdgeInsets.all(16),
              itemCount: songModels.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailSong(
                      songModel: songModels[index],
                    ),
                  ),
                ),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.settings_voice),
                      ),
                        Text(songModels[index].name),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
