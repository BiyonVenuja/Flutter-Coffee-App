import 'package:coffe_app/models/util.dart';
import 'package:coffe_app/pages/home.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _controller2;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _controller2 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    _controller.addListener(() {
      setState(() {});
    });
    _controller2.addListener(() {
      setState(() {});
    });
    wait();
  }

  Future wait() async {
    await Future.delayed(Duration(seconds: 1));
    _controller.forward();
    await Future.delayed(Duration(seconds: 1));
    _controller2.forward();
    await Future.delayed(Duration(seconds: 1));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (builder) => Home()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: _controller.value * 60,
              backgroundImage:
                  NetworkImage('http://biyonvenuja.ml/profile.jpg'),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Developed By',
                  style: TextStyle(
                      fontSize: _controller.value * 20,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                Text(
                  'Biyon Venuja',
                  style: TextStyle(
                    color: accentColor,
                    fontSize: _controller2.value * 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
