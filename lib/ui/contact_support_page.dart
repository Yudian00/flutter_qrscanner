import 'package:flutter/material.dart';
import 'package:flutter_qrscanner/utils/color_code.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactSupport extends StatefulWidget {
  @override
  _ContactSupportState createState() => _ContactSupportState();
}

class _ContactSupportState extends State<ContactSupport> {
  late AssetImage assetImage;

  void initState() {
    super.initState();
  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Center(
            child: Text(
              ' Back',
              style: GoogleFonts.roboto(
                color: mainColor,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Image(
            image: AssetImage('assets/images/it_contact.png'),
          ),
          Center(
            child: Text(
              'Contact your IT Staff',
              style: GoogleFonts.paytoneOne(
                fontSize: 20,
                color: textColor,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Your account may disabled or banned from app. Please contact your IT staff for further information about your account',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  height: 1.5,
                  fontSize: 12,
                  color: Colors.black26,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
