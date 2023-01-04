import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
floatingActionButton: Icon(Icons.arrow_back_ios_new_rounded, size: 40, ),
floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
// appBar: AppBar(backgroundColor: Colors.transparent,elevation: 0, leading: Icon(Icons.arrow_back_ios_new)),
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
                          Container(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("assets/images/location_img.png",width: MediaQuery.of(context).size.width * 0.6),
                                SizedBox(height: 20,),
                                components().text("Your Location", FontWeight.bold, Color(0xFF1D2A3A), 24),
                              ],
                            ),
                          ),

                          SizedBox(height: 70,),
                          components().text("Your Address", FontWeight.normal, Colors.black26, 16),
                          components().textField("Address Line 1", TextInputType.text, _mobileController),
                          SizedBox(height: 10,),
                          components().textField("Address Line 2", TextInputType.text, _mobileController),
                          SizedBox(height: 30,),
                          components().text("Your City", FontWeight.normal, Colors.black26, 16),
                          components().textField("Enter City", TextInputType.text, _mobileController),
                          SizedBox(height: 20,),

                          Container(
                            alignment: Alignment.center,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xFF1D2A3A),
                                padding: EdgeInsets.all(3),
                                textStyle: TextStyle(fontSize: 20),
                                minimumSize: Size.fromHeight(50),
                                shape: StadiumBorder(),
                                enableFeedback: true,
                              ),
                              child: isLoading
                                  ? const CircularProgressIndicator(
                                color: Colors.white,
                                backgroundColor: Colors.transparent,
                              )
                                  : const Text('Submit'),
                              //onPressed:() {
                              //   Navigator.of(context).pushReplacement(
                              //               MaterialPageRoute(
                              //                   builder: (context) => homepage()));
                              // },
                              onPressed: () async {

                              },
                            ),
                          ),

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
