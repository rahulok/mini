import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/welcomePage.dart';
import './pages/frontpage.dart';
import './pages/loginPage.dart';
import './pages/signup.dart';
import './pages/question.dart';
// import './pages/diagnosis.dart';
import './pages/about.dart';
// import './pages/whatisit.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    // globals.heightofdevice = MediaQuery.of(context).size.height;
    // globals.widthofdevice = MediaQuery.of(context).size.width;
    // globals.username = 'Bansal';

    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      title: 'How are you',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.latoTextTheme(textTheme).copyWith(
          headline1: GoogleFonts.montserrat(textStyle: textTheme.headline1),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
      initialRoute: '/',
      routes: {
        'frontpage': (context) => Frontpage(),
        'drawer': (context) => Drawer(),
        'login': (context) => LoginPage(),
        'welcome': (context) => WelcomePage(),
        'signup': (context) => SignUpPage(),
        'question': (context) => QuestionPage(),
        // 'diagnosis': (context) => Diagnosis(),
        'about': (context) => Aboutpage(),
        // 'whatisit': (context) => Whatisit(),
      },
    );
  }
}
