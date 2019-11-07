import 'package:flutter/material.dart';
import 'package:material_search/material_search.dart';
import 'package:pengantar_so/common/widget_builder/text_field.dart';
import 'package:pengantar_so/pages/home_page.dart';

void main() => runApp(ProperApp());

class ProperApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Proper',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'SF',
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

const URL = 'http://localhost:8000/api/login';

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[Color(0xFF89C2CB), Color(0xFFB2A67E)],
          ),
        ),
        child: SafeArea(
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 80.0,
                  ),
                  Image.asset('images/logo.png'),
                  SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    'RSUP WAHIDIN SUDIROHUSODO\nKota Makassar',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 26.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 120.0,
                  ),
                  Text(
                    'Welcome Back!',
                    style: TextStyle(fontSize: 24.0),
                  ),
                  SizedBox(
                    height: 60.0,
                  ),
                  Form(
                    key: _formKey,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 120.0),
                      child: Column(
                        children: <Widget>[
                          BuildTextField(
                            title: 'Username@mail.com',
                            icon: 'images/ic_doctor.png',
                            param: false,
                            paddingIcon: EdgeInsets.symmetric(horizontal: 16.0),
                          ),
                          SizedBox(
                            height: 18.0,
                          ),
                          BuildTextField(
                            title: 'Password',
                            icon: 'images/ic_lock.png',
                            param: true,
                            paddingIcon: EdgeInsets.symmetric(horizontal: 21.0),
                          ),
                          SizedBox(
                            height: 42.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                height: 55.0,
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0)),
                                  color: Color(0xFF8EC2CF),
                                  textColor: Colors.white,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(28.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 22.0,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Image.asset(
                                            'images/ic_login.png',
                                            scale: 1.4,
                                          ),
                                          SizedBox(
                                            width: 14.0,
                                          ),
                                          Text(
                                            'LOGIN',
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    if (_formKey.currentState.validate()) {
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                          builder: (_) => Homepage(),
                                        ),
                                      );
                                    }
                                  },
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 24.0,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
