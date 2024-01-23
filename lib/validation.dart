import 'package:flutter/material.dart';


import 'listtileexample.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}



class _LoginState extends State<Login>  {

  //this is used to find the state of the form
  final _formKey = GlobalKey<FormState>();

  //email validation regex
  final emailRegEx = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');

  //password hide & show
  bool _isVisible = false;

  void updateStatus(){
    setState(() {
      _isVisible = !_isVisible;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //body applied with background image
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            height: double.infinity,
            width: double.infinity,


            //overall column
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                //card
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Container(
                    height: 300,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),

                    //textField & button
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                          //email
                          TextFormField(
                            keyboardType: TextInputType.number,
                            style: TextStyle( color: Colors.grey),
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.mail),
                              labelText: "Email *",
                              hintText: "Enter your email address ",
                              border: OutlineInputBorder(
                              ),
                            ),

                            validator: (value){
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email address';
                              }
                              if (!emailRegEx.hasMatch(value)) {
                                return 'Please enter valid email address';
                              }
                              return null;
                            },
                          ),

                          //password
                          TextFormField(

                            obscureText: _isVisible ? false : true,
                            style: TextStyle( color: Colors.grey),
                            decoration: InputDecoration(
                              prefixIcon:Icon(Icons.lock_outline) ,
                              labelText: "Password *",
                              hintText: "Enter your password ",
                              suffixIcon:IconButton(
                                onPressed: () => updateStatus(),
                                icon:Icon(_isVisible ? Icons.visibility: Icons.visibility_off),
                              ),
                              border: OutlineInputBorder(),
                            ),


                            validator: (value){
                              if (value == null || value.isEmpty){
                                return "Please enter your password";
                              }
                              return null;
                            },
                          ),

                          Container(
                            width: 200,
                            height: 40,
                            child: ElevatedButton(
                                onPressed: (){
                                  if(_formKey.currentState!.validate()){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ListTileExample()),);
                                  }
                                },
                                child: Text("LOGIN")
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}