import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:praveer/components.dart';

import '../signupScreen/signupScreen.dart';

class body extends StatefulWidget {
  const body({Key? key}) : super(key: key);

  @override
  State<body> createState() => _bodyState();
}

class _bodyState extends State<body> {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isobscure = true;
  bool isLoading = false;

  void _toggle() {
    setState(() {
      _isobscure = !_isobscure;
    });
  }

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
              child: Container(
                constraints: BoxConstraints(maxWidth: kIsWeb ? 500 : double.infinity),
                child: Center(
                    child: Padding(padding: EdgeInsets.only(left: 35,right: 35), child:
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: components().text("Login", FontWeight.bold, Color(0xFF1D2A3A), 42),

                        ),
                        SizedBox(height: 70,),
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
                        Align(
                            alignment: Alignment(1, 0),
                            child: TextButton(
                              onPressed: () {

                              },
                              child: const Text(
                                'Forgot Password?',
                                style: TextStyle(
                                    fontSize: 15, color: Color(0xFF1D2A3A)),
                              ),
                            )),
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
                                : const Text('LogIn'),
                            //onPressed:() {
                            //   Navigator.of(context).pushReplacement(
                            //               MaterialPageRoute(
                            //                   builder: (context) => homepage()));
                            // },
                            onPressed: () async {
                              if (isLoading) return;

                              setState(() => isLoading = true);

                              if (_emailController.text.isNotEmpty &&
                                  _passwordController.text.isNotEmpty) {
                                bool emailValid = RegExp(
                                    r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                    .hasMatch(_emailController.text);

                                if (emailValid) {
                                  // userLogin();
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: Text('Error'),
                                        content: Text(
                                            "Please enter valid email!!"),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text('Ok'))
                                        ],
                                      ));
                                  setState(() => isLoading = false);
                                }
                              } else {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: Text('Error'),
                                      content:
                                      Text("All fields are required!!"),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('Ok'))
                                      ],
                                    ));
                                setState(() => isLoading = false);
                              }
                            },
                          ),
                        ),
                        SizedBox(height: 20,),
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => signupScreen()));
                            },
                            child: const Center(
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "SignUp",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          color: Color(0xFF1D2A3A)),
                                    )
                                  ],
                                  text: "Don't have an account? ",
                                  style: TextStyle(color: Color(0xFF1D2A3A)),
                                ),
                              ),

                            )),

                      ],
                    ),)
                ),
              )

          ),);
      },),
    );
  }
}
