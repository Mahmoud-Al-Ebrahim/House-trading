import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_bloc_map_provider/Views/My%20Main%20Screen.dart';

class AuthScreen extends StatelessWidget {
  static const routeName = '/Auth_Screen';

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Colors.purpleAccent.withOpacity(0.4),
              Colors.purple.withOpacity(0.7),
              Colors.deepPurple.withOpacity(0.89)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0, 0.45, 0.9],
          )),
        ),
        SingleChildScrollView(
          child: Container(
            height: deviceSize.height,
            width: deviceSize.width,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(left: 20),
                    width: deviceSize.width * 0.9,
                    transform: Matrix4.rotationZ(-10 * pi / 180)
                      ..translate(-10.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).accentColor,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 15,
                              //spreadRadius: 5,
                              color: Colors.deepPurple,
                              offset: Offset(0, 0))
                        ]),
                    child: Text(
                      'MY Sweat Home',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Flexible(child: AuthCard(), flex: 2)
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

class AuthCard extends StatefulWidget {
  @override
  _AuthCardState createState() => _AuthCardState();
}

enum AuthMode { Login, SignUp }

class _AuthCardState extends State<AuthCard>
    with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AuthMode _authMode = AuthMode.Login;
  Map<String, String> _authData = {'email': '', 'password': ''};
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _emailController = TextEditingController();
  AnimationController _controller;
  Animation<double> _opacityAnimation;
  bool _passwordVisible = true;
  bool _confirmPasswordVisible = true;
  Icon _passwordVisibleIcon = Icon(Icons.remove_red_eye);
  Icon _confirmPasswordVisibleIcon = Icon(Icons.remove_red_eye);
  final _focusNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: 300,
        ));
    _opacityAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  Future<void> _submit() async {
    _formKey.currentState.save();
    if (_emailController.text.isEmpty || !_emailController.text.contains('@')) {
      pushToast('Invalid E-mail');
      return;
    }
    if (_passwordController.text.isEmpty ||
        _passwordController.text.length < 8) {
      pushToast('Password is too short!');
      return;
    }
    if (_confirmPasswordController.text != _passwordController.text &&
        _authMode == AuthMode.SignUp) {
      pushToast('Password does not match!');
      return;
    }
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      print(sharedPreferences.getString('email'));
      print(sharedPreferences.getString('password'));
      print(_authData['email']);
      print(_authData['password']);
      if (_authMode == AuthMode.Login) {
        if (sharedPreferences.getString('email') == null) {
          pushToast("you don't have this account,please sign up");
        } else if (sharedPreferences
                    .getString('email')
                    .compareTo(_authData['email']) !=
                0 ||
            sharedPreferences
                    .getString('password')
                    .compareTo(_authData['password']) !=
                0) {
          pushToast("E-mail or Password wrong!");
        } else {
          Navigator.of(context).pushReplacementNamed(MyMainScreen.routeName);
        }
      } else {
        if (sharedPreferences.getString('email') == null) {
          sharedPreferences.setString('email', _authData['email']);
          sharedPreferences.setString('password', _authData['password']);
          Navigator.of(context).pushReplacementNamed(MyMainScreen.routeName);
        } else {
          pushToast("You already Signed up, please login");
        }
      }
    } catch (error) {}
  }

  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.SignUp;
      });
      _controller.forward();
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 8.0,
      child: AnimatedContainer(
        height: _authMode == AuthMode.SignUp ? 330 : 280,
        constraints: BoxConstraints(
          minHeight: _authMode == AuthMode.SignUp ? 330 : 280,
          maxHeight: _authMode == AuthMode.SignUp ? 400 : 300,
        ),
        curve: Curves.easeIn,
        duration: Duration(
          milliseconds: 300,
        ),
        width: deviceSize.width * 0.9,
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              AnimatedContainer(
                height: _authMode == AuthMode.SignUp ? 60 : 60,
                constraints: BoxConstraints(
                  minHeight: _authMode == AuthMode.SignUp ? 60 : 60,
                  maxHeight: _authMode == AuthMode.SignUp ? 120 : 120,
                ),
                duration: Duration(milliseconds: 300),
                curve: Curves.easeIn,
                child: TextFormField(
                  focusNode: _focusNodes[0],
                  onTap: () {
                    setState(() {});
                  },
                  controller: _emailController,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple),
                    ),
                    icon: Icon(
                      Icons.email_outlined,
                      color: _focusNodes[0].hasFocus
                          ? Colors.deepPurple
                          : Colors.black54,
                    ),
                    labelText: 'E-Mail',
                    hintText: 'test@gmail.com',
                    errorStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: _focusNodes[0].hasFocus
                          ? Colors.deepPurple
                          : Colors.black54,
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (val) {
                    _authData['email'] = val;
                  },
                ),
              ),
              AnimatedContainer(
                height: _authMode == AuthMode.SignUp ? 60 : 60,
                constraints: BoxConstraints(
                  minHeight: _authMode == AuthMode.SignUp ? 60 : 60,
                  maxHeight: _authMode == AuthMode.SignUp ? 120 : 120,
                ),
                duration: Duration(milliseconds: 300),
                curve: Curves.easeIn,
                child: TextFormField(
                  onTap: () {
                    setState(() {});
                  },
                  focusNode: _focusNodes[1],
                  obscureText: _passwordVisible,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple),
                    ),
                    suffixIcon: IconButton(
                      icon: _passwordVisibleIcon,
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                          _passwordVisibleIcon = _passwordVisible == false
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.remove_red_eye);
                        });
                      },
                      color: _focusNodes[1].hasFocus
                          ? Colors.deepPurple
                          : Colors.black54,
                    ),
                    icon: Icon(
                      Icons.vpn_key,
                      color: _focusNodes[1].hasFocus
                          ? Colors.deepPurple
                          : Colors.black54,
                    ),
                    hintText: 'Abc@#123',
                    errorStyle: TextStyle(fontWeight: FontWeight.bold),
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: _focusNodes[1].hasFocus
                          ? Colors.deepPurple
                          : Colors.black54,
                    ),
                  ),
                  controller: _passwordController,
                  onSaved: (val) {
                    _authData['password'] = val;
                  },
                ),
              ),
              AnimatedContainer(
                height: _authMode == AuthMode.SignUp ? 60 : 0,
                constraints: BoxConstraints(
                  minHeight: _authMode == AuthMode.SignUp ? 60 : 0,
                  maxHeight: _authMode == AuthMode.SignUp ? 120 : 0,
                ),
                duration: Duration(milliseconds: 300),
                curve: Curves.easeIn,
                child: FadeTransition(
                  opacity: _opacityAnimation,
                  child: TextFormField(
                    onTap: () {
                      setState(() {});
                    },
                    focusNode: _focusNodes[2],
                    controller: _confirmPasswordController,
                    obscureText: _confirmPasswordVisible,
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple),
                        ),
                        suffixIcon: IconButton(
                          icon: _confirmPasswordVisibleIcon,
                          onPressed: () {
                            setState(() {
                              _confirmPasswordVisible =
                                  !_confirmPasswordVisible;
                              _confirmPasswordVisibleIcon =
                                  _confirmPasswordVisible == false
                                      ? Icon(Icons.visibility_off)
                                      : Icon(Icons.remove_red_eye);
                            });
                          },
                          color: _focusNodes[2].hasFocus
                              ? Colors.deepPurple
                              : Colors.black54,
                        ),
                        labelText: 'Confirm Password',
                        icon: Icon(
                          Icons.repeat,
                          color: _focusNodes[2].hasFocus
                              ? Colors.deepPurple
                              : Colors.black54,
                        ),
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: _focusNodes[2].hasFocus
                              ? Colors.deepPurple
                              : Colors.black54,
                        ),
                        enabled: _authMode == AuthMode.SignUp),
                  ),
                ),
              ),
              SizedBox(height: 20),
              RaisedButton(
                onPressed: _submit,
                child: Text(
                  _authMode == AuthMode.SignUp ? 'SIGN UP' : 'LOGIN',
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                textColor: Colors.white,
                color: Colors.deepPurple,
              ),
              FlatButton(
                onPressed: _switchAuthMode,
                child: Text(
                  _authMode == AuthMode.SignUp
                      ? 'LOGIN' + ' INSTEAD'
                      : 'SIGN UP' + ' INSTEAD',
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 30),
                textColor: Colors.deepPurple,
              )
            ],
          ),
        ),
      ),
    );
  }

  void pushToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.deepPurple,
      textColor: Colors.white,
    );
  }
}
