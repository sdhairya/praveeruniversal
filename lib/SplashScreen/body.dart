import 'package:flutter/material.dart';
import 'package:praveer/components.dart';

class body extends StatefulWidget {
  const body({Key? key}) : super(key: key);

  @override
  State<body> createState() => _bodyState();
}

class _bodyState extends State<body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints){
        return AnimatedContainer(duration: Duration(milliseconds: 100),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/img.png"), fit: BoxFit.fill)
          ),
          alignment: Alignment.center,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                components().text("Praveer Universal", FontWeight.bold, Colors.red, 32),
                components().text("Best place for Groceries", FontWeight.normal, Colors.grey, 16)

              ],
            ),
          )

        ),);
      },),
    );
  }
}
