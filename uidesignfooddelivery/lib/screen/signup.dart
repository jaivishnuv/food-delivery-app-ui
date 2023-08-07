import 'package:flutter/material.dart';
import 'package:uidesignfooddelivery/authmethod/firebaseauth.dart';
import 'package:uidesignfooddelivery/constants/appconstdata.dart';
import 'package:uidesignfooddelivery/screen/login_screen.dart';

import '../utils/colors.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController confpasswordcontroller = TextEditingController();
  final TextEditingController namecontroller = TextEditingController();
  Color vishnucolor = Colors.teal;
  AppConstants vijay = AppConstants();
  late String _email, _password, _name, _confpassword;
  Authservice vishnuauth = Authservice();
  bool _isloading = false;
  signup() {
    if (formkey.currentState!.validate()) {
      setState(() {
        _isloading = true;
      });
      vishnuauth.signupmethod(context, _email, _password).then((value) {
        if (value != null) {
          setState(() {
            _isloading = false;
          });

          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => const LoginScreen()));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: _isloading
          ? Container(
              child: const CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Image.network(
                          "https://burst.shopifycdn.com/photos/flatlay-iron-skillet-with-meat-and-other-food.jpg?width=1200&format=pjpg&exif=1&iptc=1",
                          height: height * 0.40,
                          width: width,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          height: height * 0.42,
                          width: width,
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  stops: [0.3, 0.8],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [Colors.transparent, Colors.white])),
                        )
                      ],
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: namecontroller,
                      validator: (val) {
                        return val!.isEmpty ? 'Please enter name ' : null;
                      },
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: primarycolor)),
                          prefixIcon: Icon(Icons.person, color: primarycolor),
                          labelText: "Name",
                          labelStyle:
                              TextStyle(color: primarycolor, fontSize: 16)),
                      onChanged: (val) {
                        _name = val;
                      },
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailcontroller,
                      validator: (val) {
                        return val!.isEmpty ? 'Please enter email ' : null;
                      },
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: primarycolor)),
                          prefixIcon: Icon(Icons.email, color: primarycolor),
                          labelText: "Enter Email",
                          labelStyle:
                              TextStyle(color: primarycolor, fontSize: 16)),
                      onChanged: (val) {
                        _email = val;
                      },
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: passwordcontroller,
                      validator: (val) {
                        if (val!.isEmpty)
                          return "Please Enter Password";
                        else if (val.length < 8 || val.length > 15)
                          return "Password enter a valid Password";
                        return null;
                      },
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: primarycolor)),
                          prefixIcon: Icon(Icons.password, color: primarycolor),
                          labelText: "Enter Password",
                          labelStyle:
                              TextStyle(color: primarycolor, fontSize: 16)),
                      onChanged: (val) {
                        _password = val;
                      },
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: confpasswordcontroller,
                      validator: (val) {
                        return val!.isEmpty ? 'Confirmpassword ' : null;
                      },
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: primarycolor)),
                          prefixIcon:
                              Icon(Icons.confirmation_num, color: primarycolor),
                          labelText: "Confirmpassword",
                          labelStyle:
                              TextStyle(color: primarycolor, fontSize: 16)),
                      onChanged: (val) {
                        _confpassword = val;
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xff08c105),
                            minimumSize: const Size(200, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        onPressed: signup,
                        child: const Text(
                          "SIGNUP",
                          style: TextStyle(
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w500,
                              fontSize: 22,
                              color: Colors.white),
                        ))
                  ],
                ),
              ),
            ),
    );
  }
}
