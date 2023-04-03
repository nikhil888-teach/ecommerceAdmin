import 'dart:io';
import 'dart:math';

import 'package:adminpanelecommerce/home/main_page.dart';
import 'package:adminpanelecommerce/utils/constants.dart';
import 'package:adminpanelecommerce/widgets/button_theme.dart';
import 'package:adminpanelecommerce/widgets/text_theme.dart';
import 'package:adminpanelecommerce/widgets/textformfield_theme.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:r_dotted_line_border/r_dotted_line_border.dart';
import 'package:image_picker/image_picker.dart';

class MyAddProductPage extends StatefulWidget {
  const MyAddProductPage({
    super.key,
    required this.productkey,
    required this.defaultCategoryText,
  });
  final String? productkey;
  final String? defaultCategoryText;

  @override
  State<MyAddProductPage> createState() => _MyAddProductPageState();
}

class _MyAddProductPageState extends State<MyAddProductPage> {
  String selectCategory = "Male";
  TextEditingController pnameController = TextEditingController();
  TextEditingController ppriceController = TextEditingController();
  TextEditingController pdpriceController = TextEditingController();
  TextEditingController pbnameController = TextEditingController();
  TextEditingController pdescController = TextEditingController();
  List<XFile>? files;
  ImagePicker imagePicker = ImagePicker();
  List<String>? subCategories = [];
  String selectSubCategory = "Select subcategory";
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  String selectedColor = "Yes";
  String selectedSize = "Yes";

  List imagelinks = [];

  void validateAndSave() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      print('Form is valid');
    } else {
      print('form is invalid');
    }
  }

  @override
  void initState() {
    if (widget.productkey != null) {
      if (!mounted) return;
      setState(() {
        DatabaseReference databaseReference = FirebaseDatabase.instance
            .ref(Constants.products)
            .child(widget.productkey.toString());
        databaseReference.once().then((value) {
          pnameController.text =
              value.snapshot.child(Constants.dPname).value.toString();
          ppriceController.text =
              value.snapshot.child(Constants.dSPrice).value.toString();
          pdpriceController.text =
              value.snapshot.child(Constants.ddPrice).value.toString();
          pbnameController.text =
              value.snapshot.child(Constants.dBrand).value.toString();
          pdescController.text =
              value.snapshot.child(Constants.dDesc).value.toString();
          value.snapshot.child(Constants.dColor).value == true
              ? selectedColor = "Yes"
              : selectedColor = "No";
          value.snapshot.child(Constants.dSize).value == true
              ? selectedSize = "Yes"
              : selectedSize = "No";
        });
      });
    }

    super.initState();
  }

  @override
  void didChangeDependencies() {
    DatabaseReference reference = FirebaseDatabase.instance
        .ref(Constants.dProducts)
        .child(widget.productkey.toString())
        .child(Constants.dimages);
    imagelinks.clear();
    reference.once().then((value) {
      for (var element in value.snapshot.children) {
        if (!mounted) return;
        setState(() {
          imagelinks.add(element.value.toString());
        });
      }
    });
    // reference.onValue.listen((event) {
    //   for (var element in event.snapshot.children) {
    //     imagelinks.add(element.value.toString());
    //   }
    // });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    DatabaseReference databaseReference = FirebaseDatabase.instance.ref();
    databaseReference.child(selectCategory).once().then((event) {
      Map<dynamic, dynamic>? values =
          event.snapshot.value as Map<dynamic, dynamic>?;
      if (values == null && values!.length == 1) {
        return;
      }
      subCategories!.clear();
      values.forEach((key, value) {
        if (!mounted) return;
        setState(() {
          subCategories!.add(value[Constants.dSubCategoryName]);
        });
      });
    });
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration:
                        BoxDecoration(border: RDottedLineBorder.all(width: 2)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: imagelinks.isNotEmpty && files == null
                          ? Wrap(
                              alignment: WrapAlignment.spaceEvenly,
                              children: List.generate(
                                imagelinks.length,
                                (index) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  child: ClipOval(
                                    child: Container(
                                      color: Colors.red,
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: ClipOval(
                                          child: Image.network(
                                            imagelinks[index],
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
                            )
                          : files == null
                              ? Padding(
                                  padding: const EdgeInsets.all(25.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
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
                                                await imagePicker
                                                    .pickMultiImage();

                                            if (selectedImages.length > 3) {
                                              ScaffoldMessenger.of(context)
                                                ..hideCurrentSnackBar()
                                                ..showSnackBar(const SnackBar(
                                                    content: Text(
                                                        "Please select only three images")));
                                            } else if (selectedImages.isEmpty) {
                                              ScaffoldMessenger.of(context)
                                                ..hideCurrentSnackBar()
                                                ..showSnackBar(const SnackBar(
                                                    content: Text(
                                                        "Please select images")));
                                            } else {
                                              files = selectedImages;
                                              if (!mounted) return;
                                              setState(() {});
                                            }
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
                  Textformfield_style.textField(pnameController,
                      Constants.productName, TextInputType.name),
                  const SizedBox(
                    height: 8,
                  ),
                  Textformfield_style.textField(
                      ppriceController, Constants.price, TextInputType.number),
                  const SizedBox(
                    height: 8,
                  ),
                  Textformfield_style.textField(pdpriceController,
                      Constants.dprice, TextInputType.number),
                  const SizedBox(
                    height: 8,
                  ),
                  Textformfield_style.textField(pbnameController,
                      Constants.brandName, TextInputType.name),
                  const SizedBox(
                    height: 8,
                  ),
                  Textformfield_style.textField(pdescController,
                      Constants.productDesc, TextInputType.text),
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
                        if (!mounted) return;
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
                            hint: Text(widget.productkey != null
                                ? widget.defaultCategoryText.toString()
                                : 'Select subcategory'),
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
                              if (!mounted) return;
                              setState(() {
                                selectSubCategory = value!;
                              });
                            },
                          ),
                        ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    Constants.display,
                    style: Text_Style.text_Theme(
                        Constants.black_text, 16, FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Color :",
                            style: Text_Style.text_Theme(
                                Constants.black_text, 14, FontWeight.w500),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            activeColor: Colors.red,
                            value: "Yes",
                            groupValue: selectedColor,
                            onChanged: (value) {
                              if (!mounted) return;
                              setState(() {
                                selectedColor = value!;
                              });
                            },
                          ),
                          const Text("Yes"),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            activeColor: Colors.red,
                            value: "No",
                            groupValue: selectedColor,
                            onChanged: (value) {
                              if (!mounted) return;
                              setState(() {
                                selectedColor = value!;
                              });
                            },
                          ),
                          const Text("No"),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Size :",
                            style: Text_Style.text_Theme(
                                Constants.black_text, 14, FontWeight.w500),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            activeColor: Colors.red,
                            value: "Yes",
                            groupValue: selectedSize,
                            onChanged: (value) {
                              if (!mounted) return;
                              setState(() {
                                selectedSize = value!;
                              });
                            },
                          ),
                          const Text("Yes"),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            activeColor: Colors.red,
                            value: "No",
                            groupValue: selectedSize,
                            onChanged: (value) {
                              if (!mounted) return;
                              setState(() {
                                selectedSize = value!;
                              });
                            },
                          ),
                          const Text("No"),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  loading == true
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.red,
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            if (!mounted) return;
                            setState(() {
                              validateAndSave();
                              if (imagelinks.isNotEmpty) {
                                if (pnameController.text.isEmpty ||
                                    ppriceController.text.isEmpty ||
                                    pdpriceController.text.isEmpty ||
                                    pbnameController.text.isEmpty ||
                                    pdescController.text.isEmpty ||
                                    selectSubCategory
                                        .contains("Select subcategory")) {
                                  ScaffoldMessenger.of(context)
                                    ..hideCurrentSnackBar()
                                    ..showSnackBar(const SnackBar(
                                        content:
                                            Text("Please fill all the field")));
                                } else {
                                  addProductDataToDatabase(
                                      imagelinks,
                                      pnameController.text,
                                      int.parse(ppriceController.text),
                                      int.parse(pdpriceController.text),
                                      pbnameController.text,
                                      pdescController.text,
                                      selectCategory,
                                      selectSubCategory);
                                }
                              } else if (files == null ||
                                  pnameController.text.isEmpty ||
                                  ppriceController.text.isEmpty ||
                                  pdpriceController.text.isEmpty ||
                                  pbnameController.text.isEmpty ||
                                  pdescController.text.isEmpty ||
                                  selectSubCategory
                                      .contains("Select subcategory")) {
                                ScaffoldMessenger.of(context)
                                  ..hideCurrentSnackBar()
                                  ..showSnackBar(const SnackBar(
                                      content:
                                          Text("Please fill all the field")));
                              } else {
                                addProductDataToDatabase(
                                    files,
                                    pnameController.text,
                                    int.parse(ppriceController.text),
                                    int.parse(pdpriceController.text),
                                    pbnameController.text,
                                    pdescController.text,
                                    selectCategory,
                                    selectSubCategory);
                              }
                            });
                          },
                          child: Button_Style.button_Theme(
                              widget.productkey != null
                                  ? Constants.updateProduct
                                  : Constants.addProduct))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> addProductDataToDatabase(
      List? files,
      String name,
      int price,
      int dprice,
      String bname,
      String desc,
      String category,
      String subCategory) async {
    loading = true;
    List imageUrls = [];
    if (imagelinks.isEmpty) {
      for (var i = 0; i < files!.length; i++) {
        Reference reference = FirebaseStorage.instance.ref(
            "/Products/$category/$subCategory/$name${Random().nextInt(100)}");

        UploadTask uploadTask = reference.putFile(File(files[i].path));
        TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
        var imagepath = taskSnapshot.ref.getDownloadURL().catchError((onError) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(onError.toString())));
          if (!mounted) {
            setState(() {
              loading = false;
            });
          }
        });

        imageUrls.add(imagepath);
        if (!mounted) return;
        setState(() {});
      }
    }

    if (widget.productkey == null) {
      DatabaseReference databaseReference =
          FirebaseDatabase.instance.ref(Constants.dProducts).push();
      databaseReference.update({
        Constants.dId: databaseReference.key,
        Constants.dPname: name,
        Constants.dSPrice: price,
        Constants.ddPrice: dprice,
        Constants.dBrand: bname,
        Constants.dDesc: desc,
        Constants.dGender: category,
        Constants.dType: subCategory,
        Constants.dDate: DateTime.now().toString(),
        Constants.dSize: selectedSize == "Yes" ? true : false,
        Constants.dColor: selectedColor == "Yes" ? true : false,
      }).catchError((onError) {
        if (!mounted) return;

        setState(() {
          loading = false;
        });
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text(onError.toString())));
      });
      for (var i = 0; i < imageUrls.length; i++) {
        databaseReference
            .child(Constants.dimages)
            .update({i.toString(): await imageUrls[i]}).then((value) {
          if (!mounted) return;

          setState(() {
            loading = false;
          });
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MyMainPage(),
              ));
        }).catchError((onError) {
          loading = false;

          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(onError.toString())));
        });
      }
    } else {
      DatabaseReference databaseReference = FirebaseDatabase.instance
          .ref(Constants.dProducts)
          .child(widget.productkey.toString());
      databaseReference.update({
        Constants.dPname: name,
        Constants.dSPrice: price,
        Constants.ddPrice: dprice,
        Constants.dBrand: bname,
        Constants.dDesc: desc,
        Constants.dDate: DateTime.now().toString(),
        Constants.dGender: category,
        Constants.dType: subCategory,
        Constants.dSize: selectedSize == "Yes" ? true : false,
        Constants.dColor: selectedColor == "Yes" ? true : false,
      }).catchError((onError) {
        if (!mounted) return;

        setState(() {
          loading = false;
        });
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text(onError.toString())));
      });
      for (var i = 0; i < imagelinks.length; i++) {
        databaseReference
            .child(Constants.dimages)
            .update({i.toString(): await imagelinks[i]}).then((value) {
          if (!mounted) return;

          setState(() {
            loading = false;
          });
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MyMainPage(),
              ));
        }).catchError((onError) {
          loading = false;

          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(onError.toString())));
        });
      }
    }
  }
}
