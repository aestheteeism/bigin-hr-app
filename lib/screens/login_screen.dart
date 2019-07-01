import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bigin_app/screens/registration_screen.dart';
import 'package:bigin_app/screens/user_profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  bool _showPass = false;
  AnimationController controller;
  Animation animation;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  var _emailErr = 'Email is not valid';
  var _passErr = 'Password must be 6 characters and above';
  bool _emailInvalid = false;
  bool _passInvalid = false;
  String email;
  String password;
  final _auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    animation =
        ColorTween(begin: Colors.grey, end: Colors.white).animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget horizontalLine() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          width: 70.0,
          height: 1.0,
          color: Colors.black26.withOpacity(.2),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return Scaffold(
          backgroundColor: animation.value,
          body: Container(
            padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
            constraints: BoxConstraints.expand(),
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                Container(
                    width: 120.0,
                    height: 120.0,
                    child: Image.asset('assets/images/bigin_logo.png')),
                Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        "BigIn",
                        style: TextStyle(
                          fontSize: 43.0,
                          fontFamily: "Poppins Bold",
                        ),
                      ),
                      SizedBox(width: 10.0),
                      RotateAnimatedTextKit(
                          text: ["OP", "HR", "Dev", "BA", "QC"],
                          textStyle:
                              TextStyle(fontSize: 40.0, fontFamily: "Horizon"),
                          textAlign: TextAlign.start,
                          alignment: AlignmentDirectional
                              .topStart // or Alignment.topLeft
                          ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      email = value;
                    },
                    controller: _emailController,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      labelText: 'EMAIL',
                      errorText: _emailInvalid ? _emailErr : null,
                      labelStyle: TextStyle(
                        color: Color(0xff888888),
                        fontSize: 15.0,
                      ),
                      hintText: 'Enter your email',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Stack(
                    alignment: AlignmentDirectional.centerEnd,
                    children: <Widget>[
                      TextField(
                        onChanged: (value) {
                          password = value;
                        },
                        controller: _passController,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                        ),
                        obscureText: !_showPass,
                        decoration: InputDecoration(
                          labelText: 'PASSWORD',
                          errorText: _passInvalid ? _passErr : null,
                          labelStyle: TextStyle(
                            color: Color(0xff888888),
                            fontSize: 15.0,
                          ),
                          hintText: 'Enter your password',
                        ),
                      ),
                      GestureDetector(
                        onTap: onToggleShowPass,
                        child: Text(
                          _showPass ? 'HIDE' : 'SHOW',
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 13.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 15.0,
                      left: 100.0,
                      right: 100.0,),
                  child: SizedBox(
                    width: 140.0,
                    height: 56.0,
                    child: RaisedButton(
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(30.0))),
                      onPressed: onSignInClicked,
                      child: Text(
                        'SIGN IN',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'Forgot password?',
                    style: TextStyle(
                      fontFamily: "Poppins Bold",
                      color: Colors.blueAccent,
                      fontSize: 13.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0, bottom: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      horizontalLine(),
                      Text(
                        'Log In with',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: "Poppins Bold",
                        ),
                      ),
                      horizontalLine(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 45.0,
                        width: 45.0,
                        child: Image.asset('assets/images/facebook_logo.png'),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Container(
                        height: 50.0,
                        width: 50.0,
                        child: Image.asset('assets/images/zalo_logo.png'),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Container(
                        height: 45.0,
                        width: 45.0,
                        child: Image.asset('assets/images/google_logo.png'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'New user?',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, RegistrationScreen.id);
                        },
                        child: Text(
                          'REGISTER',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontFamily: "Poppins Bold",
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void onSignInClicked() {
    setState(() {
      if (_emailController.text.length < 6 ||
          !_emailController.text.contains('@')) {
        _emailInvalid = true;
      } else
        _emailInvalid = false;
      if (_passController.text.length < 6) {
        _passInvalid = true;
      } else
        _passInvalid = false;
      if (!_emailInvalid && !_passInvalid) {
        try {
          final user = _auth.signInWithEmailAndPassword(
              email: email, password: password);
          if (user != null) {
            Navigator.pushNamed(context, UserProfileScreen.id);
            print('Signed in');
          }
        }
        catch(e) {
          print(e);
        }
      }
    });
  }

  void onToggleShowPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }
}
