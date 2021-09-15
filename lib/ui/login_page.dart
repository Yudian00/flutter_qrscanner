import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_qrscanner/ui/admin/admin_dashboard_page.dart';
import 'package:flutter_qrscanner/ui/contact_support_page.dart';
import 'package:flutter_qrscanner/utils/color_code.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;
  bool _isObscure = true;

  void initState() {
    super.initState();
  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: ClipPath(
              clipper: WaveClipperTwo(),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
                color: mainColor,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: ListView(
              children: [
                Text(
                  'Hello,',
                  style: GoogleFonts.paytoneOne(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Please login to continue',
                  style: GoogleFonts.roboto(
                    color: Colors.white70,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                ),
                Entry.opacity(
                  duration: Duration(seconds: 1),
                  child: Column(
                    children: [
                      TextField(
                        controller: _usernameController,
                        style:
                            GoogleFonts.roboto(color: mainColor, fontSize: 12),
                        decoration: InputDecoration(
                          labelText: 'Username',
                          prefixIcon: Icon(
                            Icons.person_outline,
                            color: mainColor,
                          ),
                          labelStyle: GoogleFonts.roboto(
                              color: mainColor, fontSize: 12),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: mainColor, width: 2.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: mainColor, width: 2.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextField(
                        controller: _passwordController,
                        obscureText: _isObscure,
                        style:
                            GoogleFonts.roboto(color: mainColor, fontSize: 12),
                        decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                            child: _isObscure
                                ? Icon(
                                    Icons.visibility_off,
                                    size: 16,
                                    color: mainColor,
                                  )
                                : Icon(
                                    Icons.visibility,
                                    size: 16,
                                    color: mainColor,
                                  ),
                          ),
                          labelText: 'Password',
                          labelStyle: GoogleFonts.roboto(
                              color: mainColor, fontSize: 12),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: mainColor, width: 2.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: Icon(
                            Icons.vpn_key_outlined,
                            color: mainColor,
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: mainColor, width: 2.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      _isLoading ? loadingAnimation() : actionButton(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget loadingAnimation() {
    return Center(
      child: Container(
        height: 100,
        width: 100,
        child: LottieBuilder.asset('assets/lottie/loading_animation.json'),
      ),
    );
  }

  Widget actionButton(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            verify();
          },
          style: ElevatedButton.styleFrom(
            primary: mainColor,
            minimumSize: Size(MediaQuery.of(context).size.width, 45),
          ),
          child: Text(
            'Login',
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            minimumSize: Size(MediaQuery.of(context).size.width, 45),
          ),
          child: Text(
            'Back',
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.bold,
              color: mainColor,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: ContactSupport()));
          },
          style: ButtonStyle(
            overlayColor:
                MaterialStateColor.resolveWith((states) => Colors.transparent),
          ),
          child: Center(
            child: Text(
              "I can't access my account",
              style: GoogleFonts.roboto(
                color: mainColor,
                fontSize: 12,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void verify() {
    // trigger loading animation
    setState(() {
      _isLoading = true;
    });

    // set a period for delay
    Future.delayed(Duration(seconds: 3), () {
      // checking process
      if (_usernameController.text == 'admin' &&
          _passwordController.text == 'admin') {
        _navigateToAdmin();
        setState(() {
          _isLoading = false;
        });
      } else {
        final snackBar = SnackBar(
          content: Text('Username or Password wrong'),
          duration: Duration(seconds: 2),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  void _navigateToAdmin() {
    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.fade,
        child: AdminDashboardPage(),
      ),
    );
  }
}
