import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:praveer/components.dart';
import 'package:praveer/loginScreen/loginScreen.dart';
import 'package:praveer/signupScreen/getMobileNumber/getMobileNumber.dart';

class body extends StatefulWidget {
  const body({Key? key}) : super(key: key);

  @override
  State<body> createState() => _bodyState();
}

class _bodyState extends State<body> {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _confirmpasswordController = TextEditingController();
  bool _isobscure = true;
  bool isLoading = false;

  void _toggle() {
    setState(() {
      _isobscure = !_isobscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      resizeToAvoidBottomInset: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => getMobileNumber()));
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
                          Container(
                            alignment: Alignment.center,
                            child: components().text("SignUp", FontWeight.bold, Color(0xFF1D2A3A), 42),

                          ),
                          SizedBox(height: 70,),
                          components().text("User Name", FontWeight.normal, Colors.black26, 16),
                          components().textField("Enter Username", TextInputType.emailAddress, _usernameController),
                          SizedBox(height: 20,),
                          components().text("Email", FontWeight.normal, Colors.black26, 16),
                          components().textField("Enter Email id", TextInputType.emailAddress, _emailController),
                          SizedBox(height: 20,),
                          components().text("Password", FontWeight.normal, Colors.black26, 16),
                          TextFormField(
                            obscureText: _isobscure,
                            controller: _passwordController,
                            decoration: InputDecoration(
                                border: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black54)
                                ),
                                hintText: 'Enter Password',
                                suffixIcon: IconButton(
                                  icon: Icon(_isobscure
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  onPressed: _toggle,
                                )),
                            keyboardType: TextInputType.visiblePassword,
                          ),
                          SizedBox(height: 30,),
                          components().text("Confirm Password", FontWeight.normal, Colors.black26, 16),
                          TextFormField(
                            obscureText: _isobscure,
                            controller: _confirmpasswordController,
                            decoration: InputDecoration(
                                border: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black54)
                                ),
                                hintText: 'Confirm Password',
                                suffixIcon: IconButton(
                                  icon: Icon(_isobscure
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  onPressed: _toggle,
                                )),
                            keyboardType: TextInputType.visiblePassword,
                          ),

                          SizedBox(height: 20,),


                          SizedBox(height: 20,),
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => loginScreen()));
                              },
                              child: const Center(
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Login",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            color: Color(0xFF1D2A3A)),
                                      )
                                    ],
                                    text: "Already have an account? ",
                                    style: TextStyle(color: Color(0xFF1D2A3A)),
                                  ),
                                ),

                              )),

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
