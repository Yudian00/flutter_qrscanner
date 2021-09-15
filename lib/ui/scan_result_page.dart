import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qrscanner/models/product_model.dart';
import 'package:flutter_qrscanner/utils/color_code.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class ScanResultPage extends StatefulWidget {
  final String? scannerResult;

  ScanResultPage({
    required this.scannerResult,
  });

  @override
  _ScanResultPageState createState() => _ScanResultPageState();
}

class _ScanResultPageState extends State<ScanResultPage> {
  bool isLoading = true;

  List productResult = [];
  List productList = [
    Product(
        productName: 'Playstation 4',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8c/PS4-Console-wDS4.png/1200px-PS4-Console-wDS4.png',
        itemId: 'TKR-01IDN',
        height: '2.9 Kg',
        currentPrice: '\$499.9',
        currentStock: '10 unit(s)'),
    Product(
        productName: 'Playstation 5',
        imageUrl:
            'https://asset.kompas.com/crops/1C-M-9auIGQ6NICQLHdac3T88ME=/131x95:935x631/750x500/data/photo/2020/06/12/5ee2d91340862.jpg',
        itemId: 'TKR-02IDN',
        height: '3.9 Kg',
        currentPrice: '\$599.9',
        currentStock: '10 unit(s)'),
    Product(
        productName: 'Xbox One',
        imageUrl:
            'https://selular.id/wp-content/uploads/2018/11/Xbox_One_X_Screenshot_05.0.jpg',
        itemId: 'TKR-03IDN',
        height: '3.9 Kg',
        currentPrice: '\$799.9',
        currentStock: '5 unit(s)'),
    Product(
        productName: 'Xbox One',
        imageUrl: 'https://cdn.alzashop.com/ImgW.ashx?fd=f16&cd=DS992d2a',
        itemId: 'TKR-04IDN',
        height: '1.0 Kg',
        currentPrice: '\$199.9',
        currentStock: '2 unit(s)'),
  ];

  void initState() {
    super.initState();

    // cancel loading animation
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Entry.opacity(
        duration: Duration(seconds: 2),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: isLoading
              ? Center(
                  child: Container(
                    height: 100,
                    width: 100,
                    child: LottieBuilder.asset(
                        'assets/lottie/loading_animation.json'),
                  ),
                )
              : ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    _isInDatabase() ? dataFound() : dataNotFound(),
                  ],
                ),
        ),
      ),
    );
  }

  Widget dataFound() {
    return ListView(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      children: [
        Text(
          'Product Result : ',
          style: GoogleFonts.roboto(
              fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black54),
        ),
        SizedBox(
          height: 40,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.25,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(productResult[0].imageUrl),
              fit: BoxFit.contain,
            ),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Text(
          productResult[0].productName,
          style: GoogleFonts.roboto(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Divider(),
        SizedBox(
          height: 20,
        ),
        Text(
          'Detail Information : ',
          style: GoogleFonts.roboto(
            color: Colors.black54,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        rowInformation('item Id : ', productResult[0].itemId),
        rowInformation('Height : ', productResult[0].height),
        rowInformation('Current Stock : ', productResult[0].currentStock),
        rowInformation('Price : ', productResult[0].currentPrice),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(primary: mainColor),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'Back to QRScan',
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }

  Widget rowInformation(String label, String value) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              // 'item Id : ',
              label,
              style: GoogleFonts.roboto(
                color: Colors.black54,
              ),
            ),
            Text(
              // productResult[0].itemId,
              value,
              style: GoogleFonts.roboto(
                color: Colors.black54,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }

  Widget dataNotFound() {
    return ListView(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      children: [
        SizedBox(
          height: 100,
        ),
        Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/lost.png'),
            ),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Center(
          child: Text(
            'No data found',
            style: GoogleFonts.paytoneOne(fontSize: 16, color: Colors.black87),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Center(
            child: Text(
              'We could not find the product based on the qr code you provided. Please try something else',
              style: GoogleFonts.roboto(
                  fontSize: 12, color: Colors.black45, height: 1.5),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(primary: mainColor),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'Go Back',
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }

  bool _isInDatabase() {
    bool _isFound = false;

    // you can matching the result with your database
    for (var i = 0; i < productList.length; i++) {
      if (productList[i].itemId.contains(widget.scannerResult)) {
        // add data to result list
        productResult.add(productList[i]);

        setState(() {
          _isFound = true;
        });
      }
    }

    return _isFound;
  }
}
