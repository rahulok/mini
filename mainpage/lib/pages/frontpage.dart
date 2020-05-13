import '../diagonal_clipper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../pages/drawer.dart';
import '../classes/global.dart' as globals;

class Frontpage extends StatefulWidget {
  Frontpage({Key key}) : super(key: key);
  @override
  _MainPageState createState() => new _MainPageState();
}

class _MainPageState extends State<Frontpage> {
  final double _imageHeight = 256.0;
  bool showOnlyCompleted = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    globals.heightofdevice = MediaQuery.of(context).size.height;
    globals.widthofdevice = MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      drawer: MyDrawer(),
      // appBar: AppBar(
      //   title: Text("Dumb"),
      //   // backgroundColor: Colors.transparent,
      // ),
      body: new Stack(
        children: <Widget>[
          _buildIamge(),
          _buildTopHeader(),
          _buildProfileRow(),
          _buildBottomPart(),
        ],
      ),
    );
  }

  Widget _buildIamge() {
    return new Positioned.fill(
      bottom: null,
      child: new ClipPath(
        clipper: new DialogonalClipper(),
        child: new Image.asset(
          './images/birds.jpg',
          fit: BoxFit.cover,
          height: _imageHeight,
          colorBlendMode: BlendMode.srcOver,
          color: new Color.fromARGB(120, 20, 10, 40),
        ),
      ),
    );
  }

  Widget _buildTopHeader() {
    return new Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 32.0),
      child: new Row(
        children: <Widget>[
          InkWell(
            onTap: () {
              print('hua');
              // Scaffold.of(context).openDrawer();
              _scaffoldKey.currentState.openDrawer();
            },
            child: new Icon(
              Icons.menu,
              size: 32.0,
              color: Colors.white,
            ),
          ),
          new Expanded(
            child: new Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: new Text(
                "How are you",
                style: new TextStyle(
                    fontSize: 23.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileRow() {
    return new Padding(
      padding: new EdgeInsets.only(left: 16.0, top: _imageHeight / 2.5),
      child: new Row(
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Hello ${globals.username}',
                  style: GoogleFonts.lobster(
                      textStyle: TextStyle(
                          fontSize: 30.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w400)),
                ),
                new Text(
                  globals.emailid,
                  style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomPart() {
    return new Padding(
      padding: new EdgeInsets.only(top: _imageHeight),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildMyTasksHeader(),
        ],
      ),
    );
  }

  Widget _buildMyTasksHeader() {
    return new Padding(
      padding: new EdgeInsets.only(left: 64.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text(
            'How it works',
            style: GoogleFonts.sahitya(
              textStyle: TextStyle(
                fontSize: 37.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Container(
            height: 20,
          ),
          new Text(
            'We will ask you some questions for which you have to answer with either yes or no, you can also click the \'What is it\' button to gain more insight into the disease.',
            style: GoogleFonts.sahitya(
              textStyle: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            width: globals.widthofdevice * 0.70,
            child: RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'question');
              },
              child: Text(
                'Start!',
                style: GoogleFonts.aBeeZee(
                  textStyle: TextStyle(fontSize: 20),
                ),
              ),
              color: Colors.blue[400],
              colorBrightness: Brightness.dark,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(7),
              elevation: 5,
            ),
          )
        ],
      ),
    );
  }
}
