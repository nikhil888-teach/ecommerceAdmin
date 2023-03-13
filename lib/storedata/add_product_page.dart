import 'package:adminpanelecommerce/utils/constants.dart';
import 'package:adminpanelecommerce/widgets/button_theme.dart';
import 'package:adminpanelecommerce/widgets/text_theme.dart';
import 'package:adminpanelecommerce/widgets/textformfield_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
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
                Center(
                  child: CircleAvatar(
                    radius: 80,
                    child: ClipOval(
                      child: Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsynwv-5qtogtOwJbIjaPFJUmHpzhxgqIAug&usqp=CAU',
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
