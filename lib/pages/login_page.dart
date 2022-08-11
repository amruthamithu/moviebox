import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double? _deviceHeight, _deviceWidth;

  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  String? _email;
  String? _password;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: _deviceWidth! * 0.05),
            child: Center(
                child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                _titleWidget(),
                const SizedBox(
                  height: 100,
                ),
                _loginForm(),
                const SizedBox(
                  height: 50,
                ),
                _loginButton(),
                const SizedBox(
                  height: 25,
                ),
                _registerPageLink(),
              ],
            )),
          ),
        ),
      ),
    );
  }

  Widget _titleWidget() {
    return const Text(
      "MOVIE BOX",
      style: TextStyle(
        color: Color.fromARGB(255, 43, 111, 175),
        fontSize: 40,
        fontWeight: FontWeight.w600,
        fontFamily: "ArchitectsDaughter",
      ),
    );
  }

  Widget _loginForm() {
    return Container(
      height: _deviceHeight! * 0.23,
      child: Form(
        key: _loginFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _emailTextFeild(),
            _passwordTextFeild(),
          ],
        ),
      ),
    );
  }

  Widget _emailTextFeild() {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
      onSaved: (value) {
        setState(() {
          _email = value;
        });
      },
      validator: (value) {
        bool result = value!.contains(
          RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"),
        );
        return result ? null : "Please enter a valid email";
      },
    );
  }

  Widget _passwordTextFeild() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
      onSaved: (value) {
        setState(() {
          _password = value;
        });
      },
      validator: (value) => value!.length > 6
          ? null
          : "Please enter a password greater than 6 characters.",
    );
  }

  Widget _loginButton() {
    return Material(
      borderRadius: BorderRadius.circular(30),
      color: const Color(0xff01A0C7),
      child: MaterialButton(
        onPressed: _loginUser,
        minWidth: _deviceWidth! * 0.85,
        height: _deviceHeight! * 0.06,
        child: const Text(
          "Login",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget _registerPageLink() {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, 'register'),
      child: const Text(
        "Don't have an account?",
        style: TextStyle(
            color: Color.fromARGB(255, 13, 60, 99),
            fontSize: 15,
            fontWeight: FontWeight.w400),
      ),
    );
  }

  void _loginUser() {
    //print(_loginFormKey.currentState!.validate());

    if (_loginFormKey.currentState!.validate()) {
      _loginFormKey.currentState!.save();
    }
  }
}
