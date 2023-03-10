import 'package:adminpanelecommerce/utils/constants.dart';
import 'package:adminpanelecommerce/widgets/text_theme.dart';
import 'package:flutter/material.dart';

class MyProductPage extends StatefulWidget {
  const MyProductPage({super.key});

  @override
  State<MyProductPage> createState() => _MyProductPageState();
}

class _MyProductPageState extends State<MyProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(Constants.products,
            style: Text_Style.text_Theme(
                Constants.black_text, 20, FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: 20,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Card(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4),
                          bottomLeft: Radius.circular(4)),
                      child: Image.network(
                        "https://images.pexels.com/photos/852860/pexels-photo-852860.jpeg?auto=compress&cs=tinysrgb&w=600",
                        fit: BoxFit.fill,
                        height: 150,
                        width: 150,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("LIME",
                                  style: Text_Style.text_Theme(
                                      Constants.grey_text,
                                      14,
                                      FontWeight.normal)),
                              PopupMenuButton(
                                child: const SizedBox(
                                  height: 35,
                                  width: 45,
                                  child: Icon(
                                    Icons.more_vert,
                                    color: Colors.grey,
                                  ),
                                ),
                                itemBuilder: (context) => [
                                  const PopupMenuItem(
                                      child: Text(Constants.edit)),
                                  const PopupMenuItem(
                                      child: Text(Constants.delete))
                                ],
                              ),
                            ],
                          ),
                          Text(
                            "Longsleeve Violeta",
                            style: Text_Style.text_Theme(
                                Constants.black_text, 16, FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              children: [
                                Text(
                                  "12\$",
                                  style: Text_Style.text_Theme(
                                      Constants.red_text, 14, FontWeight.bold),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Text("15\$",
                                      style: TextStyle(
                                          color: Color(Constants.grey_text),
                                          fontSize: 14,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          fontWeight: FontWeight.bold)),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.red,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
