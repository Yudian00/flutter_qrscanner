import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_qrscanner/utils/color_code.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class AdminCreate extends StatefulWidget {
  @override
  _AdminCreateState createState() => _AdminCreateState();
}

class _AdminCreateState extends State<AdminCreate> {
  void initState() {
    super.initState();
  }

  void dispose() {
    super.dispose();
  }

  TextEditingController _productNameController = TextEditingController();
  TextEditingController _productStockController = TextEditingController();
  TextEditingController _productWeightController = TextEditingController();
  TextEditingController _productPriceController = TextEditingController();

  bool _isImageSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Create New Product',
          style: GoogleFonts.roboto(
              fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black87,
            size: 20,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              textFieldText('Product Name', _productNameController),
              textFieldNumber('Stock', 'Unit(s)', _productStockController),
              textFieldNumber('Weight', 'Kg', _productWeightController),
              textFieldNumber('Price', 'USD', _productPriceController),
              GestureDetector(
                onTap: () => chooseImage(),
                child: Container(
                  margin: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.4,
                  ),
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black45),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Click to Upload an Image',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.black45,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              _isImageSelected
                  ? Row(
                      children: [
                        Icon(
                          Icons.done,
                          color: Colors.green,
                          size: 16,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Image uploaded',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    )
                  : Container()
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
          final snackBar = SnackBar(
            content: Text(
              'Product Created',
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: mainColor,
          );

          // Find the ScaffoldMessenger in the widget tree
          // and use it to show a SnackBar.
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        backgroundColor: mainColor,
        child: Center(
          child: RotationTransition(
            turns: AlwaysStoppedAnimation(315 / 360),
            child: Icon(
              Icons.send,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  void chooseImage() async {
    try {
      final ImagePicker _picker = ImagePicker();

      // Pick an image
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

      if (image == null) {
        setState(() {
          _isImageSelected = false;
        });
      } else {
        print('image selected');
        setState(() {
          _isImageSelected = true;
        });
      }

      // you can add process to upload selected image to your firebase
    } catch (e) {
      print(e);
    }
  }

  Widget textFieldNumber(
      String label, String suffixText, TextEditingController controller) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            right: MediaQuery.of(context).size.width * 0.4,
          ),
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              // allow to create 2 decimal only
              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
            ],
            style: GoogleFonts.roboto(color: Colors.black87, fontSize: 12),
            decoration: InputDecoration(
              labelText: label,
              suffixIcon: IconButton(
                onPressed: () {},
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                color: Colors.transparent,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                icon: Text(
                  suffixText,
                  style: TextStyle(
                    color: Colors.black38,
                    fontSize: 10,
                  ),
                ),
              ),
              labelStyle:
                  GoogleFonts.roboto(color: Colors.black45, fontSize: 12),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black45, width: 1.0),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black87, width: 1.0),
                borderRadius: BorderRadius.circular(10),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black87, width: 2.0),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }

  Widget textFieldText(String label, TextEditingController controller) {
    return Column(
      children: [
        TextField(
          controller: controller,
          style: GoogleFonts.roboto(color: Colors.black87, fontSize: 12),
          decoration: InputDecoration(
            labelText: label,
            labelStyle: GoogleFonts.roboto(color: Colors.black45, fontSize: 12),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black45, width: 1.0),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black87, width: 1.0),
              borderRadius: BorderRadius.circular(10),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black87, width: 2.0),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
