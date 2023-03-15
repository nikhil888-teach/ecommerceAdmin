import 'dart:io';

import 'package:adminpanelecommerce/utils/constants.dart';
import 'package:adminpanelecommerce/widgets/button_theme.dart';
import 'package:adminpanelecommerce/widgets/text_theme.dart';
import 'package:adminpanelecommerce/widgets/textformfield_theme.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class MyAddCategory extends StatefulWidget {
  const MyAddCategory({super.key});

  @override
  State<MyAddCategory> createState() => _MyAddCategoryState();
}

class _MyAddCategoryState extends State<MyAddCategory> {
  String selectCategory = "Male";
  TextEditingController subCategory = TextEditingController();
  XFile? file;
  ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leadingWidth: 0,
          title: Text(Constants.addCategory,
              style: Text_Style.text_Theme(
                  Constants.black_text, 20, FontWeight.bold)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Center(
                child: ClipOval(
                  child: Container(
                    color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ClipOval(
                        child: file == null
                            ? InkWell(
                                onTap: () async {
                                  var image = await imagePicker.pickImage(
                                      source: ImageSource.gallery);
                                  if (!mounted) return;
                                  setState(() {
                                    file = image;
                                  });
                                },
                                child: const SizedBox(
                                  height: 100,
                                  width: 100,
                                  child: Icon(
                                    Icons.add_a_photo,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                ),
                              )
                            : Image.file(
                                File(file!.path),
                                fit: BoxFit.cover,
                                height: 100,
                                width: 100,
                              ),
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                elevation: 2,
                child: DropdownButtonFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide.none)),
                  value: selectCategory,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: <String>['Male', 'Female', 'Kide']
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
              Textformfield_style.textField(subCategory, Constants.subCategory),
              const SizedBox(
                height: 8,
              ),
              InkWell(child: Button_Style.button_Theme(Constants.addCategory))
            ],
          ),
        ),
      ),
    );
  }
}