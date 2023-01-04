import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:praveer/signupScreen/getAddress/getAddress.dart';

import '../../components.dart';

class body extends StatefulWidget {
  const body({Key? key}) : super(key: key);

  @override
  State<body> createState() => _bodyState();
}

class _bodyState extends State<body> {

  TextEditingController _mobileController = TextEditingController();
  bool isLoading = false;

  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      resizeToAvoidBottomInset: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                  builder: (context) => getAddress()));
        },
        backgroundColor: Color(0xFF1D2A3A),
        child: CircleAvatar(child: Icon(Icons.arrow_forward_ios_rounded),backgroundColor:Color(0xFF1D2A3A) ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/img.png"), fit: BoxFit.fill)
        ),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: LayoutBuilder(builder: (context, constraints){
            return AnimatedContainer(duration: Duration(milliseconds: 100),
              child: Container(
                  constraints: BoxConstraints(maxWidth: kIsWeb ? 500 : double.infinity),
                  alignment: Alignment.center,
                  child: Center(
                      child: Padding(padding: EdgeInsets.only(left: 35,right: 35), child:
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          components().text("Enter Your Mobile Number", FontWeight.bold, Color(0xFF1D2A3A), 24),
                          SizedBox(height: 70,),
                          components().text("Mobile Number", FontWeight.normal, Colors.black26, 16),
                          components().textField("Enter Mobile Number", TextInputType.phone, _mobileController),

                        ],
                      ),)
                  )

              ),
            );
          },),
        ),
      ),
    ));
  }
}
