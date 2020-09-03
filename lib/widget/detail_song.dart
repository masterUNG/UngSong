import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ung_song/models/songmodel.dart';

class DetailSong extends StatefulWidget {
  final SongModel songModel;

  DetailSong({Key key, this.songModel}) : super(key: key);

  @override
  _DetailSongState createState() => _DetailSongState();
}

class _DetailSongState extends State<DetailSong> {
  SongModel songModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    songModel = widget.songModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(songModel == null ? 'Name Song' : songModel.name),
      ),
      body: Center(
        child: CachedNetworkImage(errorWidget: (context, url, error) => Image.asset('images/question.png'),
          imageUrl: songModel.note,
          placeholder: (context, url) => Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
