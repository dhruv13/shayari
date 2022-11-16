import 'package:flutter/material.dart';
import 'package:shayari/main.dart';

import 'main.dart';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("S H A Y A R I...",style: TextStyle(fontSize: 40,color: Colors.blueGrey),),),

    );
  }
  @override
  void initState(){

    super.initState();
    next();
  }
  next() async {

    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return shayari();
    },
    ));
  }

}
