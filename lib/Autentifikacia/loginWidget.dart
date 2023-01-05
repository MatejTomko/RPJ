import 'package:flutter/cupertino.dart';

class LoginWidget extends StatefulWidget{
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget>{
  final emailController = TextEditingController();
  final passwordController= TextEditingController();

  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}