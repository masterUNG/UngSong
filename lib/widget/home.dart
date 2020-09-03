import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ung_song/widget/about_me.dart';
import 'package:ung_song/widget/show_list_singer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildDrawer(),
      appBar: AppBar(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/wall.jpg'), fit: BoxFit.cover),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildCardMale(),
              buildCardFeMale(),
            ],
          ),
        ),
      ),
    );
  }

  Drawer buildDrawer() => Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: Image.asset('images/logo.png'),
              accountName: Text('Ung Song'),
              accountEmail: Text('Slogan'),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('About Me'),
              subtitle: Text('Description About Me'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AboutMe(),
                  ),
                );
              },
            ),
          ],
        ),
      );

  GestureDetector buildCardMale() {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ShowListSinger(
            gendle: 'Male',
          ),
        ),
      ),
      child: Card(
        color: Colors.greenAccent,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 16),
                width: 150,
                child: Image.asset('images/male.png'),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'ၽူႈႁွင်ႉၵႂၢမ်းၸႆၢး',
                    style: GoogleFonts.padauk(textStyle: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector buildCardFeMale() {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ShowListSinger(
            gendle: 'Female',
          ),
        ),
      ),
      child: Card(
        color: Colors.orangeAccent,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 16),
                width: 150,
                child: Image.asset('images/female.png'),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'ၽူႈႁွင်ႉၵႂၢမ်းယိင်း',
                    style: GoogleFonts.padauk(textStyle: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
