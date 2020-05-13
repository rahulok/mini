import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../classes/account.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController usernamectrl = TextEditingController();
  TextEditingController useridctrl = TextEditingController();
  TextEditingController passwordctrl = TextEditingController();
  var url = 'https://hauloginok.firebaseio.com/user.json';
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  bool isloading = false;

  void maketoast(var text, var color) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Color(color),
        textColor: Colors.white,
        fontSize: 16.0);
  }

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  Widget _entryField(
      String title, TextEditingController ctrl, var thekey, bool isEmail,
      {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          Form(
            key: thekey,
            child: TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'The field can\'t be empty';
                  } else if (isEmail &&
                      !RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                          .hasMatch(ctrl.text.toString())) {
                    print(ctrl.text.toString());
                    return 'Invalid email id';
                  }
                  //return ''; //Just put it there so that warning doesnt come, remove if error comes
                },
                controller: ctrl,
                obscureText: isPassword,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Color(0xfff3f3f4),
                    filled: true)),
          )
        ],
      ),
    );
  }

  Widget _submitButton() {
    return InkWell(
      onTap: () async {
        if (_formKey1.currentState.validate() &&
            _formKey2.currentState.validate() &&
            _formKey3.currentState.validate()) {
          isloading = true;
          setState(() {});
          var flag = true, toproceed = true;
          var user =
              Account(usernamectrl.text, useridctrl.text, passwordctrl.text);
          try {
            List<Account> userlist = [];
            var response = await http.get(url);
            var userdatamap =
                json.decode(response.body) as Map<String, dynamic>;
            print(userdatamap);
            userdatamap.forEach((id, data) {
              userlist.add(Account(
                data['username'],
                data['emailid'],
                data['password'],
              ));
            });
            for (int i = 0; i < userlist.length; i++) {
              if (userlist[i].emailid == useridctrl.text) {
                print('Same mila');
                toproceed = false;
                break;
              }
            }
            if (toproceed)
              http.post(url,
                  body: json.encode({
                    'username': user.username,
                    'emailid': user.emailid,
                    'password': user.password,
                  }));
            else {
              maketoast('User id already exist!', 0xffFF4517);
            }
          } catch (error) {
            print(error);
            flag = false;
            maketoast('Some error occured', 0xffFF4517);
          } finally {
            if (flag && toproceed) {
              maketoast('Registered', 0xff31FC10);
              usernamectrl.clear();
              useridctrl.clear();
              passwordctrl.clear();
              Navigator.pushNamed(context, 'login');
            }
            isloading = false;
            setState(() {});
          }
        } else {
          print('Kuch khali hai');
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xfffbb448), Color(0xfff7892b)])),
        child: !isloading
            ? Text(
                'Register Now',
                style: TextStyle(fontSize: 20, color: Colors.white),
              )
            : SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
      ),
    );
  }

  Widget _loginAccountLabel() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Already have an account ?',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, 'login');
            },
            child: Text(
              'Login',
              style: TextStyle(
                  color: Color(0xfff79c4f),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'How ',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.headline1,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Color(0xffe46b10),
          ),
          children: [
            TextSpan(
              text: 'are ',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            TextSpan(
              text: 'you!',
              style: TextStyle(color: Color(0xffe46b10), fontSize: 30),
            ),
          ]),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField("Name", usernamectrl, _formKey1, false),
        _entryField("Email id", useridctrl, _formKey2, true),
        _entryField("Password", passwordctrl, _formKey3, false,
            isPassword: true),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: SizedBox(),
                ),
                _title(),
                SizedBox(
                  height: 50,
                ),
                _emailPasswordWidget(),
                SizedBox(
                  height: 20,
                ),
                _submitButton(),
                Expanded(
                  flex: 2,
                  child: SizedBox(),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: _loginAccountLabel(),
          ),
          Positioned(top: 40, left: 0, child: _backButton()),
        ],
      ),
    )));
  }
}
