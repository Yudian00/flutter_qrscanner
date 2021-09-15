import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_qrscanner/utils/color_code.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminProfilePage extends StatefulWidget {
  @override
  _AdminProfilePageState createState() => _AdminProfilePageState();
}

class _AdminProfilePageState extends State<AdminProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: mainColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.exit_to_app,
              color: mainColor,
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/team-1.jpg'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    'Jhon Doe',
                    style: GoogleFonts.roboto(
                      fontSize: 25,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    'Administrator',
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                detailInformation(),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
              clipper: WaveClipperTwo(reverse: true),
              child: Container(
                height: 120,
                color: mainColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget detailInformation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Detail Information',
          style: GoogleFonts.roboto(
            fontSize: 14,
            color: Colors.black54,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 50,
        ),
        buildRow('Name', 'Jhon Doe'),
        Divider(),
        SizedBox(
          height: 20,
        ),
        buildRow('Sex', 'Male'),
        Divider(),
        SizedBox(
          height: 20,
        ),
        buildRow('Age', '25'),
        Divider(),
        SizedBox(
          height: 20,
        ),
        buildRow('Position', 'Administrator'),
        Divider(),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Row buildRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            '$label : ',
            style: GoogleFonts.roboto(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
        ),
        Expanded(
          child: Text(
            '$value',
            style: GoogleFonts.roboto(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
        ),
      ],
    );
  }
}
