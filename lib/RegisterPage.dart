import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:social/Pages/Feed/Screen/FeedScreen.dart';

import 'LoginPage.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({required this.title});

  final String title;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

  late String email;
  late String password;
  late String username;
  bool loading = false;

  void handleSignup() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        loading = true;
      });
      _formKey.currentState!.save();
      createUserWithEmailAndPassword(email.trim(), password, username, context)
          .then((value) {
        if (value != null) {
          Fluttertoast.showToast(
            msg: "Your Account has been added, Please Login",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
          );
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => FeedScreen(),
              ));
        }
      });
      /* Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ListOfHouse(),
          ));*/
    }
  }

  bool validateEmail(String value, {required String field}) {
    if (field == "Email id") {
      String pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regex = new RegExp(pattern);
      return (!regex.hasMatch(value)) ? false : true;
    }
    return false;
  }

  String? validatePassword(String value) {
    String b = r'(?=.*[a-z])';
    String A = r'^(?=.*[A-Z])';
    String c = r'(?=.*?[0-9])';
    String d = r'(?=.*?[!@#\$&*~]).{8,}$';
    if (!new RegExp(A).hasMatch(value)) {
      return "upper";
    }
    if (!new RegExp(b).hasMatch(value)) {
      return "lower";
    }
    if (!new RegExp(c).hasMatch(value)) {
      return "digit";
    }
    if (!new RegExp(d).hasMatch(value)) {
      return "char";
    }

    return null;
  }

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: buildContainerForInkWellOfBackButton(),
    );
  }

  Container buildContainerForInkWellOfBackButton() {
    return Container(
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
    );
  }

  Widget _entryField(String title, Icon _icon,
      {bool isPassword = false, var controler}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildTextFormFieldForEntryFieldWidget(isPassword, title, _icon,
              controler: controler),
        ],
      ),
    );
  }

  TextFormField buildTextFormFieldForEntryFieldWidget(
      bool isPassword, String title, Icon _icon,
      {var controler}) {
    return TextFormField(
      controller: controler,
      obscureText: isPassword,
      decoration: InputDecoration(
          hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.teal[500]),
          hintText: title,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Colors.teal,
              width: 2,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Colors.teal,
              width: 3,
            ),
          ),
          prefixIcon: Padding(
            child: IconTheme(
              data: IconThemeData(color: Colors.teal),
              child: _icon,
            ),
            padding: EdgeInsets.only(left: 30, right: 10),
          )),
      validator: (value) {
        if (title == "Username") {
          if (value!.isEmpty) {
            return "Username can not be Empty";
          }
        }
        if (title == "Email id") {
          if (value!.isEmpty) {
            return "Email id can not be Empty";
          }
          if (!validateEmail(value, field: title)) {
            return "Enter a valid Email";
          }
        }
        if (title == "Password") {
          if (value!.length <= 5) {
            return "password must contain at least 6 Values";
          }
          if (validatePassword(value) == "upper") {
            return " should contain at least one upper case";
          }
          if (validatePassword(value) == "lower") {
            return "should contain at least one lower case";
          }
          if (validatePassword(value) == "digit") {
            return "should contain at least one digit";
          }
          if (validatePassword(value) == "char") {
            return "should contain at least one Special character";
          }
        }
        if (title == "Confirm Password") {
          if (value != _pass.text) return 'Password must be same as above';
        }
        return null;
      },
      onChanged: (val) {
        if (title == "Username") {
          username = val;
        }
        if (title == "Email id") {
          email = val;
        }
        if (title == "Password") {
          password = val;
        }
      },
    );
  }

  Text buildTextWidgetForEntryField(String title) {
    return Text(
      title,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
    );
  }

  Widget _signupButton() {
    return SizedBox(
      height: 50,
      width: double.infinity,
      // ignore: deprecated_member_use
      child: RaisedButton(
        highlightElevation: 0.0,
        splashColor: Colors.white,
        highlightColor: Colors.teal,
        elevation: 0.0,
        color: Colors.teal,
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
            side: BorderSide(color: Colors.white, width: 3)),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            handleSignup();
          }
        },
        child: Text(
          "SignUp",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }

  // Widget buildContainerForChildOfInkwellOfSignupButton() {
  //   return SizedBox(
  //     height: 50,
  //     width: double.infinity,
  //     // ignore: deprecated_member_use
  //     child: RaisedButton(
  //       highlightElevation: 0.0,
  //       splashColor: Colors.white,
  //       highlightColor: Colors.teal,
  //       elevation: 0.0,
  //       color: Colors.teal,
  //       shape: RoundedRectangleBorder(
  //           borderRadius: new BorderRadius.circular(30.0),
  //           side: BorderSide(color: Colors.white, width: 3)),
  //       onPressed: () {  if (_formKey.currentState!.validate()) {
  //         handleSignup();
  //       } },
  //       child: Text(
  //         "label",
  //         style: TextStyle(
  //             fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
  //       ),
  //     ),
  //   );
  // }

  BoxDecoration buildBoxDecorationForContainerOfSignupButton() {
    return BoxDecoration(
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
            colors: [Color(0xfffbb448), Color(0xfff7892b)]));
  }

  Widget _loginAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login()));
      },
      child: buildContainerForChildOfInkwellOfLoginAccountLabel(),
    );
  }

  Container buildContainerForChildOfInkwellOfLoginAccountLabel() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      padding: EdgeInsets.all(15),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Already have an account ?',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'Login',
            style: TextStyle(
                color: Color(0xfff79c4f),
                fontSize: 13,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: buildTextSpanFOrTitle(),
    );
  }

  TextSpan buildTextSpanFOrTitle() {
    return TextSpan(text: 'R',
//         style: GoogleFonts.portLligatSans(
// // ignore: deprecated_member_use
//           textStyle: Theme.of(context).textTheme.display1,
//           fontSize: 30,
//           fontWeight: FontWeight.w700,
//           color: Color(0xffe46b10),
//         ),
        children: [
          TextSpan(
            text: 'oo',
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
          TextSpan(
            text: 'mi',
            style: TextStyle(color: Color(0xffe46b10), fontSize: 30),
          ),
        ]);
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField("Username", Icon(Icons.person)),
        _entryField("Email", Icon(Icons.email)),
        _entryField("Password", Icon(FontAwesomeIcons.lock),
            isPassword: true, controler: _pass),
        _entryField("Confirm Password", Icon(FontAwesomeIcons.key),
            isPassword: true, controler: _confirmPass),
      ],
    );
  }

  Widget _facebookButton() {
    return Container(
      height: 96,
      margin: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          // SignInButton(
          //   Buttons.Google,
          //   onPressed: () {},
          // ),
          // SignInButton(
          //   Buttons.FacebookNew,
          //   onPressed: () {},
          // ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? CircularProgressIndicator()
        : Scaffold(
            backgroundColor: Colors.teal,
            body: Container(
              padding: EdgeInsets.only(top: 80, left: 15, right: 15),
              child: Form(
                key: _formKey,
                child: DecoratedBox(
                  decoration:
                      BoxDecoration(color: Theme.of(context).canvasColor),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                        bottomLeft: Radius.circular(40.0),
                        bottomRight: Radius.circular(40.0)),
                    child: Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: buildContainerForStackOfBuildWidget(),
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          );
  }

  // Container(
  // child: buildContainerForStackOfBuildWidget(height),
  // padding: EdgeInsets.only(top: 50, left: 20, right: 20),
  // ),
  Container buildContainerForStackOfBuildWidget() {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 10,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.close,
                      size: 30.0,
                      color: Colors.teal,
                    ),
                  ),
                ),
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 60,
                    ),
                    Text(
                      "SignUp",
                      style: TextStyle(
                        fontSize: 54,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal[600],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    _emailPasswordWidget(),
                    SizedBox(
                      height: 30,
                    ),
                    _signupButton(),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
