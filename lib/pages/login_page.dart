import 'package:flutter/material.dart';
import 'package:prueba_tecnica/pages/home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
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
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: 'Enter your email',
                    fillColor: Colors.white,
                    border: inputBorder,
                    focusedBorder: inputBorder,
                    enabledBorder: inputBorder,
                    contentPadding: const EdgeInsets.all(8)),
              ),
              SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'Enter your password',
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    focusedBorder: inputBorder,
                    enabledBorder: inputBorder,
                    contentPadding: const EdgeInsets.all(8)),
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HomePage())),
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
