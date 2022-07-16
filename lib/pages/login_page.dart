import 'package:flutter/material.dart';
import 'package:prueba_tecnica/data/services/user_preference.dart';
import 'package:prueba_tecnica/pages/home_page.dart';
import 'package:prueba_tecnica/widgets/texfield_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final PrefService _prefserevice = PrefService();

  bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(em);
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailcontroller = new TextEditingController();
    TextEditingController _passwordcontroller = new TextEditingController();

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 232, 232),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(child: Container(), flex: 2),
              TextFieldInput(
                textEditingController: _emailcontroller,
                textInputType: TextInputType.emailAddress,
                hintText: 'Enter your email',
              ),
              SizedBox(height: 20),
              TextFieldInput(
                textEditingController: _passwordcontroller,
                textInputType: TextInputType.text,
                hintText: 'Enter your password',
                isPass: true,
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  //Validate email and password
                  if (isEmail(_emailcontroller.text) &&
                      _passwordcontroller.text.length > 1) {
                    _prefserevice
                        .createCache(_emailcontroller.text)
                        .whenComplete(() => Navigator.of(context)
                            .pushReplacement(MaterialPageRoute(
                                builder: (context) => HomePage())));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Container(
                            child: Text('Invalid email or password'))));
                  }
                },
                child: Container(
                  child: const Text('Log in'),
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                      ),
                      color: Colors.orangeAccent),
                ),
              ),
              Flexible(child: Container(), flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
