import '../diagonal_clipper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../pages/drawer.dart';
import '../classes/global.dart' as globals;

class Aboutpage extends StatefulWidget {
  Aboutpage({Key key}) : super(key: key);
  @override
  _MainPageState createState() => new _MainPageState();
}

class _MainPageState extends State<Aboutpage> {
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
      body: SingleChildScrollView(
        child: new Stack(
          children: <Widget>[
            _buildIamge(),
            _buildTopHeader(),
            _buildProfileRow(),
            _buildBottomPart(),
          ],
        ),
      ),
    );
  }

  Widget _buildIamge() {
    return new Positioned.fill(
      bottom: null,
      child: new ClipPath(
        clipper: new DialogonalClipper(),
        child: new Image.asset(
          './images/about2.jpg',
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
    return Padding(
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
    return Padding(
      padding: new EdgeInsets.only(left: 50.0,right: 5.0,),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text(
            'About the App',
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
            'What is the first thing we do when you start feeling under the weather? Do we wait for the symptoms to become more prominent or do we immediately start taking precautions? We probably Google your symptoms on the web.\nBut more often than not this self-diagnosis on the internet always points towards something more sinister. For example, if you search for ‘headache’, you are most likely going to find around 20 results, each scarier than the other. There are chances that your headache might also be diagnosed as a tumour and your perpetual fatigue could be a sign of an underlying disease including cancer.\nThere is a lot of junk present on the internet that might be nowhere even near to the actual solution to our problem. It is important to know the difference between the reliable source of information and complete gibberish. In addition to incorrect diagnoses, self-diagnosing your symptoms using Google can actually mask a potentially dangerous disease. So, apart from the sketchy and inaccurate diagnosis of innumerable medical websites on the internet, it is the risk of not being able to identify a disease correctly that is worse. Nobody can vouch for the quality and credibility of the content available online. While it can provide you information from credible sources, it can also get you links of some sketchy websites that have bogus information.\nThis is how the application is different from the results from search engines. It does not conclude based upon only one or two inputs but takes various parameters and only then tells what may be the problem. It poses a series of questions that are personalized by its algorithm based on the responses from each user. It then uses that information to suggest possible health issues. The key was putting the problem first, rather than building AI and figuring out a use later. The app is like a personal health companion. All the questions asked relate to the answers previously given. It can help people, their family and friends analyse symptoms and receive personal health assessments.\nThe app will empower patients to make more informed decisions about their health. Or, to put it more bluntly, to ensure we only visit a doctor when we need to and, more generally, can be proactive in our healthcare without adding the need for greater human doctor resources.\n',
            style: GoogleFonts.sahitya(
              textStyle: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
