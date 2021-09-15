import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qrscanner/models/product_model.dart';
import 'package:flutter_qrscanner/ui/admin/admin_create_page.dart';
import 'package:flutter_qrscanner/ui/admin/admin_profile_page.dart';
import 'package:flutter_qrscanner/utils/color_code.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

class AdminDashboardPage extends StatefulWidget {
  @override
  _AdminDashboardPageState createState() => _AdminDashboardPageState();
}

class _AdminDashboardPageState extends State<AdminDashboardPage> {
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
  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        title: Text(
          'Dashboard',
          style: GoogleFonts.roboto(
            fontSize: 12,
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        actions: [
          GestureDetector(
            onTap: () {
              _navigateToProfilePage();
            },
            child: Container(
              child: Row(
                children: [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Text(
                        'Jhon Doe',
                        style: GoogleFonts.roboto(
                          fontSize: 12,
                          color: Colors.black45,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/images/team-1.jpg'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: NotificationListener<OverscrollIndicatorNotification>(
        // disable glow light listview
        onNotification: (overscroll) {
          overscroll.disallowGlow();
          return overscroll.leading;
        },
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            SizedBox(
              height: 10,
            ),
            Entry.opacity(
              duration: Duration(seconds: 2),
              child: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.2,
                child: Row(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      child: LottieBuilder.asset(
                        'assets/lottie/success_animation.json',
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.60,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'One Step Closer',
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: textColor,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Please complete your profile information to fully access admin features',
                            style: GoogleFonts.roboto(
                              height: 1.5,
                              color: Colors.black38,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Entry.opacity(
              duration: Duration(seconds: 2),
              child: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.59,
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Recent Product',
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        style: GoogleFonts.roboto(
                            color: Colors.black54, fontSize: 12),
                        decoration: InputDecoration(
                          labelText: 'Search Product..',
                          labelStyle: GoogleFonts.roboto(
                              color: Colors.black54, fontSize: 12),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.black54,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: mainColor, width: 2.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: EdgeInsets.all(10),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: mainColor),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: 2,
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (context, index) =>
                            productCard(context, index),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: TextButton(
                          onPressed: () {
                            print('add function / page to show more products');
                          },
                          child: Text(
                            'See More',
                            style: GoogleFonts.roboto(
                              fontSize: 12,
                              color: mainColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.rightToLeft, child: AdminCreate())),
        backgroundColor: mainColor,
        child: Center(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget productCard(BuildContext context, int index) {
    return ListView(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      children: [
        ListTile(
          contentPadding: EdgeInsets.all(20),
          leading: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(productList[index].imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(
            productList[index].productName,
            style: GoogleFonts.roboto(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            productList[index].currentPrice,
            style: GoogleFonts.roboto(
              fontSize: 12,
              color: Colors.black45,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
          ),
        ),
        Divider(
          thickness: 2,
        ),
      ],
    );
  }

  void _navigateToProfilePage() {
    Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.fade, child: AdminProfilePage()));
  }
}
