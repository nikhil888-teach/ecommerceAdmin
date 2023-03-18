import 'dart:io';

import 'package:adminpanelecommerce/utils/constants.dart';
import 'package:adminpanelecommerce/widgets/button_theme.dart';
import 'package:adminpanelecommerce/widgets/text_theme.dart';
import 'package:adminpanelecommerce/widgets/textformfield_theme.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:r_dotted_line_border/r_dotted_line_border.dart';
import 'package:image_picker/image_picker.dart';

class MyAddProductPage extends StatefulWidget {
  const MyAddProductPage({super.key});

  @override
  State<MyAddProductPage> createState() => _MyAddProductPageState();
}

class _MyAddProductPageState extends State<MyAddProductPage> {
  String selectCategory = "Male";
  TextEditingController pname = TextEditingController();
  TextEditingController pprice = TextEditingController();
  TextEditingController pdprice = TextEditingController();
  TextEditingController pbname = TextEditingController();
  TextEditingController pdesc = TextEditingController();
  List<XFile>? files;
  ImagePicker imagePicker = ImagePicker();
  List<String>? subCategories = [];
  String selectSubCategory = "Select subcategory";

  @override
  Widget build(BuildContext context) {
    DatabaseReference databaseReference = FirebaseDatabase.instance.ref();
    databaseReference.child(selectCategory).onValue.listen((event) {
      Map<dynamic, dynamic>? values =
          event.snapshot.value as Map<dynamic, dynamic>?;
      if (values == null && values!.length == 1) {
        return;
      }
      subCategories!.clear();
      values.forEach((key, value) {
        subCategories!.add(value[Constants.dSubCategoryName]);
      });
      setState(() {});
    });

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leadingWidth: 0,
          title: Text(Constants.addProduct,
              style: Text_Style.text_Theme(
                  Constants.black_text, 20, FontWeight.bold)),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration:
                      BoxDecoration(border: RDottedLineBorder.all(width: 2)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: files == null
                        ? Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Center(
                                  child: Text(
                                    Constants.selectImageText,
                                    style: Text_Style.text_Theme(
                                        Constants.black_text,
                                        14,
                                        FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: GestureDetector(
                                    onTap: () async {
                                      List<XFile> selectedImages =
                                          await imagePicker.pickMultiImage();
                                      if (!mounted) return;
                                      setState(() {
                                        files = selectedImages;
                                      });
                                    },
                                    child: const Icon(
                                      Icons.add_a_photo_outlined,
                                      color: Colors.red,
                                      size: 40,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        : Wrap(
                            alignment: WrapAlignment.spaceEvenly,
                            children: List.generate(
                              files!.length,
                              (index) => Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: ClipOval(
                                  child: Container(
                                    color: Colors.red,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: ClipOval(
                                        child: Image.file(
                                          File(files![index].path),
                                          fit: BoxFit.cover,
                                          height: 100,
                                          width: 100,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    Constants.productDetail,
                    style: Text_Style.text_Theme(
                        Constants.black_text, 16, FontWeight.bold),
                  ),
                ),
                Textformfield_style.textField(pname, Constants.productName),
                const SizedBox(
                  height: 8,
                ),
                Textformfield_style.textField(pprice, Constants.price),
                const SizedBox(
                  height: 8,
                ),
                Textformfield_style.textField(pdprice, Constants.dprice),
                const SizedBox(
                  height: 8,
                ),
                Textformfield_style.textField(pbname, Constants.brandName),
                const SizedBox(
                  height: 8,
                ),
                Textformfield_style.textField(pdesc, Constants.productDesc),
                const SizedBox(
                  height: 8,
                ),
                Card(
                  color: Colors.white,
                  elevation: 2,
                  child: DropdownButtonFormField(
                    decoration: const InputDecoration(
                        border:
                            OutlineInputBorder(borderSide: BorderSide.none)),
                    value: selectCategory,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: <String>['Male', 'Female', 'Kids']
                        .map<DropdownMenuItem<String>>((e) {
                      return DropdownMenuItem(value: e, child: Text(e));
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectCategory = value!;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                subCategories == null
                    ? const Text("No Data")
                    : Card(
                        color: Colors.white,
                        elevation: 2,
                        child: DropdownButtonFormField(
                          hint: const Text('Select subcategory'),
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none)),
                          value: null,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: subCategories!
                              .asMap()
                              .entries
                              .map<DropdownMenuItem<String>>((e) {
                            return DropdownMenuItem(
                                value: e.value, child: Text(e.value));
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectSubCategory = value!;
                            });
                          },
                        ),
                      ),
                const SizedBox(
                  height: 8,
                ),
                Button_Style.button_Theme(Constants.addProduct)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
