import 'package:flutter/material.dart';
import 'package:flutter_mvvm/utils/routes/routes_name.dart';
import 'package:flutter_mvvm/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            Utils.toastMessage('shiran');
           // Navigator.pushNamed(context, RoutesName.home);
            //Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
          },
          child: Text('Click'),
        ),
      ),
    );
  }
}