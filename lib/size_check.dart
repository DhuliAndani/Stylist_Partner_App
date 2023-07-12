import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SizeCheckScreen extends StatefulWidget {
  const SizeCheckScreen({Key key}) : super(key: key);

  @override
  State<SizeCheckScreen> createState() => _SizeCheckScreenState();
}

class _SizeCheckScreenState extends State<SizeCheckScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Hello World",style:
            TextStyle(
                color: Colors.black, fontSize: 10, fontWeight: FontWeight.w400),),
            Text("Hello World",style:
            TextStyle(
                color: Colors.black, fontSize: Get.height * 0.0124, fontWeight: FontWeight.w400),),



          ],
        ),
      ),
    );
  }
}
