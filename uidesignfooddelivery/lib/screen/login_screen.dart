import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uidesignfooddelivery/authmethod/firebaseauth.dart';
import 'package:uidesignfooddelivery/screen/signup.dart';
import 'package:uidesignfooddelivery/screen/splashscreen.dart';
import 'package:uidesignfooddelivery/utils/colors.dart';
import '../constants/appconstdata.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>(); //Form
  final TextEditingController emailcontroller =
      TextEditingController(); //compl wen we are using textformfield or textfield
  final TextEditingController passwordcontroller = TextEditingController(); //

  Authservice vishnuauth = Authservice();
  Color vishnucolor = Colors.teal;
  AppConstants vijay = AppConstants();
  late String _email, _password; //textformfield
  bool _isloading = false;
  signIn() async {
    if (formkey.currentState!.validate()) {
      setState(() {
        _isloading = true;
      });
      await vishnuauth.signinmethod(context, _email, _password).then((value) {
        if (value != null) {
          setState(() {
            _isloading = false;
          });

          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => const SplashScreen()));
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
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
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
                        ),
                        Positioned(
                            bottom: 30,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Column(
                                children: [
                                  Text(
                                    vijay.appName,
                                    style: GoogleFonts.abhayaLibre(
                                        fontSize: 25,
                                        color: Colors.teal,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    vijay.slogan,
                                    style: const TextStyle(color: Colors.grey),
                                  )
                                ],
                              ),
                            )),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 20),
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                primarycolor.withOpacity(0.4),
                                Colors.transparent
                              ],
                            ),
                            border: Border(
                                left:
                                    BorderSide(color: primarycolor, width: 9))),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            vijay.login,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: TextFormField(
                        onSaved: (value123) {
                          // com
                          _email = value123!; //to store user info in firebase
                        },
                        keyboardType: TextInputType
                            .emailAddress, // this will allow to type only alphabha
                        controller: emailcontroller, //com
                        validator: (val) {
                          //com
                          if (val!.isEmpty) {
                            return 'Enter Email';
                          }
                          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                              .hasMatch(val)) {
                            return "Enter a valid email id";
                          }
                        },
                        onChanged: (val) {
                          //com
                          _email = val;
                        },
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: primarycolor)),
                            prefixIcon: Icon(Icons.email, color: primarycolor),
                            labelText: "EMAIL ADDRESS",
                            labelStyle:
                                TextStyle(color: primarycolor, fontSize: 16)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: TextFormField(
                        keyboardType: TextInputType
                            .number, //this will allow to type only numbers
                        controller: passwordcontroller,
                        obscureText: true,
                        onChanged: (val) {
                          _password = val;
                        },

                        validator: (val) {
                          return val!.isEmpty
                              ? 'Enter Password'
                              : null; // shorthand of if and else
                        },
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: primarycolor)),
                            prefixIcon:
                                Icon(Icons.lock_open, color: primarycolor),
                            labelText: "PASSWORD",
                            labelStyle:
                                TextStyle(color: primarycolor, fontSize: 16)),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () => () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: Text(vijay.forgetText),
                        ),
                      ),
                    ),
                    const SizedBox(height: 60),
                    Center(
                      child: SizedBox(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff08c105),
                                minimumSize: const Size(200, 50),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))),
                            onPressed: () {
                              signIn();
                            },
                            child: const Text(
                              "Login to account",
                              style: TextStyle(
                                  letterSpacing: 0.5,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 22,
                                  color: Colors.white),
                            )),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Dont have an account ?"),
                        const SizedBox(width: 10),
                        InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const Signup())),
                          child: Container(
                            child: Text(
                              'Create Account ',
                              style:
                                  TextStyle(color: primarycolor, fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                   const  SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
