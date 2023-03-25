import 'package:adminpanelecommerce/storedata/add_product_page.dart';
import 'package:adminpanelecommerce/utils/constants.dart';
import 'package:adminpanelecommerce/widgets/text_theme.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class MyProductPage extends StatefulWidget {
  const MyProductPage({super.key});

  @override
  State<MyProductPage> createState() => _MyProductPageState();
}

class _MyProductPageState extends State<MyProductPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(Constants.products,
              style: Text_Style.text_Theme(
                  Constants.black_text, 20, FontWeight.bold)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: FirebaseAnimatedList(
            query: FirebaseDatabase.instance.ref('TestUjas/Products'),
            physics: const BouncingScrollPhysics(),
            defaultChild: const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            ),
            itemBuilder: (context, snapshot, animation, index) {
              return Card(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4),
                          bottomLeft: Radius.circular(4)),
                      child: Image.network(
                        snapshot
                            .child('images')
                            .children
                            .elementAt(1)
                            .value
                            .toString(),
                        fit: BoxFit.fill,
                        height: 120,
                        width: 120,
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 120,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            top: 10,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(snapshot.child('Brand').value.toString(),
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
                                snapshot.child('Description').value.toString(),
                                style: Text_Style.text_Theme(
                                    Constants.black_text, 16, FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "${snapshot.child('Price').value}\$",
                                    style: Text_Style.text_Theme(
                                        Constants.red_text,
                                        14,
                                        FontWeight.bold),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                        "${snapshot.child('DisPrice').value}\$",
                                        style: const TextStyle(
                                            color: Color(Constants.grey_text),
                                            fontSize: 14,
                                            decoration:
                                                TextDecoration.lineThrough,
                                            fontWeight: FontWeight.bold)),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyAddProductPage(),
                ));
          },
          backgroundColor: Colors.red,
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}
