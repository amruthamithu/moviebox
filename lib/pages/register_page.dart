import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  double? _deviceHeight, _deviceWidth;

  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();

  String? _fname, _lname, _email, _password;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: _deviceWidth! * 0.05,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 70,
                ),
                _titleWidget(),
                const SizedBox(
                  height: 70,
                ),
                _registrationForm(),
                const SizedBox(
                  height: 20,
                ),
                _registerButton(),
              ],
            ),
          ),
        ),
      ),
    ));
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

  Widget _registrationForm() {
    return Container(
      height: _deviceHeight! * 0.5,
      child: Form(
        key: _registerFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _fnameTextField(),
            _lnameTextField(),
            _emailTextFeild(),
            _passwordTextFeild(),
          ],
        ),
      ),
    );
  }

  Widget _fnameTextField() {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "First Name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
      validator: (value) =>
          value!.isNotEmpty ? null : "Please enter first name",
      onSaved: (value) {
        setState(() {
          _fname = value;
        });
      },
    );
  }

  Widget _lnameTextField() {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "First Name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
      validator: (value) => value!.isNotEmpty ? null : "Please enter last name",
      onSaved: (value) {
        setState(() {
          _lname = value;
        });
      },
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

  Widget _registerButton() {
    return Material(
      borderRadius: BorderRadius.circular(30),
      color: const Color(0xff01A0C7),
      child: MaterialButton(
        onPressed: _registerUser,
        minWidth: _deviceWidth! * 0.85,
        height: _deviceHeight! * 0.06,
        child: const Text(
          "Register",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  void _registerUser() {
    if (_registerFormKey.currentState!.validate()) {
      _registerFormKey.currentState!.save();
      // print("Valid");
    }
  }
}
