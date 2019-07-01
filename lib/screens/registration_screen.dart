import 'package:flutter/material.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bigin_app/screens/user_profile_screen.dart';
import 'package:bigin_app/screens/login_screen.dart';
class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> with SingleTickerProviderStateMixin {
  bool _showPass = false;
  AnimationController controller;
  Animation animation;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  var _firstNameErr = 'Your first name is required';
  var _lastNameErr = 'Your last name is required';
  var _emailErr = 'Email is not valid';
  var _passErr = 'Password must be 6 characters and above';
  bool _emailInvalid = false;
  bool _passInvalid = false;
  bool _firstNameInvalid = false;
  bool _lastNameInvalid = false;
  String email;
  String password;
  String firstName;
  String lastName;
  //final _auth = FirebaseAuth.instance;
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

  @override
  Widget build(BuildContext context) {
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
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "BigIn",
                    style: TextStyle(fontSize: 43.0, fontFamily: "Poppins Bold"),
                  ),
                  SizedBox(width: 10.0),
                  RotateAnimatedTextKit(
                      text: ["OP", "HR", "Dev", "BA", "QC"],
                      textStyle: TextStyle(fontSize: 40.0, fontFamily: "Horizon"),
                      textAlign: TextAlign.start,
                      alignment:
                      AlignmentDirectional.topStart // or Alignment.topLeft
                  ),
                ],
              ),
            ),
            TextField(
              onChanged: (value) {
                firstName = value;
              },
              controller: _firstNameController,
              style: TextStyle(
                fontSize: 17.0,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                labelText: 'FIRST NAME',
                errorText: _firstNameInvalid ? _firstNameErr : null,
                labelStyle: TextStyle(
                  color: Color(0xff888888),
                  fontSize: 15.0,
                ),
                hintText: 'e.g John',
              ),
            ),
            TextField(
              onChanged: (value) {
                lastName = value;
              },
              controller: _lastNameController,
              style: TextStyle(
                fontSize: 17.0,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                labelText: 'LAST NAME',
                errorText: _lastNameInvalid ? _lastNameErr : null,
                labelStyle: TextStyle(
                  color: Color(0xff888888),
                  fontSize: 15.0,
                ),
                hintText: 'e.g Smith',
              ),
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                email = value;
              },
              controller: _emailController,
              style: TextStyle(
                fontSize: 17.0,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                labelText: 'EMAIL',
                errorText: _emailInvalid ? _emailErr: null,
                labelStyle: TextStyle(
                  color: Color(0xff888888),
                  fontSize: 15.0,
                ),
                hintText: 'name@bigin.vn',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: <Widget>[
                  TextField(
                    onChanged: (value) {
                      password = value;
                    },
                    controller: _passController,
                    style: TextStyle(
                      fontSize: 17.0,
                      color: Colors.black,
                    ),
                    obscureText: !_showPass,
                    decoration: InputDecoration(
                      labelText: 'PASSWORD',
                      errorText: _passInvalid ? _passErr : null,
                      labelStyle: TextStyle(
                        color: Color(0xff888888),
                        fontSize: 13.0,
                      ),
                      hintText: 'Must be 6 characters and above',
                    ),
                  ),
                  GestureDetector(
                    onTap: onToggleShowPass,
                    child: Text(
                      _showPass? 'HIDE' : 'SHOW',
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
                  bottom: 40.0,
              left: 100.0,
              right: 100.0),
              child: SizedBox(
                width: 140.0,
                height: 56.0,
                child: RaisedButton(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0))
                  ),
                  onPressed: onSignInClicked,
                  child: Text(
                    'REGISTER',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Already have an account?',
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
                      Navigator.pushNamed(context, LoginScreen.id);
                    },
                    child: Text(
                      'LOG IN',
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
  }
  void onSignInClicked () {
    setState(() {
      if(_emailController.text.length < 6 || !_emailController.text.contains('@')) {
        _emailInvalid = true;
      } else
        _emailInvalid = false;
      if(_passController.text.length < 6) {
        _passInvalid = true;
      } else
        _passInvalid = false;
      if(_firstNameController.text.length < 1)
        _firstNameInvalid = true;
      else
        _lastNameInvalid = false;
      if(_lastNameController.text.length < 1)
        _lastNameInvalid = true;
      if(!_emailInvalid && !_passInvalid && !_firstNameInvalid && !_lastNameInvalid) {
//        try {
//          final newUser = _auth.createUserWithEmailAndPassword(
//              email: email, password: password);
//          if(newUser != null) {
//            Navigator.pushNamed(context, UserProfileScreen.id);
//          }
//        }
//        catch (e) {
//          print(e);
//        }
      }
    });
  }
  void onToggleShowPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }
}

