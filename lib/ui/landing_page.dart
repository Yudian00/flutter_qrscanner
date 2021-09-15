import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_qrscanner/ui/login_page.dart';
import 'package:flutter_qrscanner/ui/scan_result_page.dart';
import 'package:flutter_qrscanner/utils/color_code.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  String _scanBarcode = 'Unknown';
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
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: RichText(
                text: TextSpan(
                  text: 'QR',
                  style: GoogleFonts.paytoneOne(
                    color: textColor,
                    fontSize: 25,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Scan',
                      style: GoogleFonts.paytoneOne(
                          color: mainColor, fontSize: 25),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: MediaQuery.of(context).size.height * 0.45,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/images/qr_scanner_illus.png',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: RichText(
                text: TextSpan(
                  text: 'SCAN ',
                  style: GoogleFonts.paytoneOne(
                    color: textColor,
                    fontSize: 18,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'YOUR BARCODE',
                      style: GoogleFonts.paytoneOne(
                          color: mainColor, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                'Quick scan to get product information',
                style: GoogleFonts.roboto(
                  fontSize: 12,
                  color: Colors.black54,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 80),
              child: ElevatedButton(
                onPressed: () {
                  scanQR();
                },
                style: ElevatedButton.styleFrom(primary: mainColor),
                child: Text(
                  'Scan Now',
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () => _navigateToLoginPage(),
              child: Center(
                child: Text(
                  "I'm admin",
                  style: GoogleFonts.roboto(
                    color: mainColor,
                    fontSize: 12,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToLoginPage() {
    Navigator.push(context,
        PageTransition(type: PageTransitionType.fade, child: LoginPage()));
  }

  void _navigateToResultPage() {
    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.fade,
        child: ScanResultPage(
          scannerResult: _scanBarcode,
        ),
      ),
    );
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });

    // condition where scanner is cancelled
    if (_scanBarcode == 'Unknown' || _scanBarcode == '-1') {
      return;
    } else {
      _navigateToResultPage();
    }
  }
}
