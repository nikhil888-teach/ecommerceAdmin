import 'package:adminpanelecommerce/utils/constants.dart';
import 'package:adminpanelecommerce/widgets/text_theme.dart';
import 'package:flutter/material.dart';

class MyCategoryPage extends StatefulWidget {
  const MyCategoryPage({super.key});

  @override
  State<MyCategoryPage> createState() => _MyCategoryPageState();
}

class _MyCategoryPageState extends State<MyCategoryPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(Constants.category,
              style: Text_Style.text_Theme(
                  Constants.black_text, 20, FontWeight.bold)),
        ),
        body: Column(
          children: [
            TabBar(
                labelPadding: const EdgeInsets.symmetric(vertical: 14),
                indicatorColor: const Color(0xffDB3022),
                unselectedLabelColor: Colors.black,
                unselectedLabelStyle: Text_Style.text_Theme(
                    Constants.black_text, 16, FontWeight.normal),
                labelColor: Colors.black,
                labelStyle: Text_Style.text_Theme(
                    Constants.black_text, 16, FontWeight.bold),
                tabs: const [
                  Text(Constants.men),
                  Text(Constants.women),
                  Text(Constants.kide)
                ]),
            Expanded(
              child: TabBarView(children: [
                listOfCategories(),
                listOfCategories(),
                listOfCategories(),
              ]),
            )
          ],
        ),
      ),
    );
  }

  Padding listOfCategories() {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: ListView.builder(
        itemCount: 7,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 7,
                child: Card(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTamE2X9X7VXv0Y_ce4RiWqJmoZ8AYuMJ5dYg&usqp=CAU",
                        width: MediaQuery.of(context).size.width / 8,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 25),
                            child: Text(
                              "New",
                              style: Text_Style.text_Theme(
                                  Constants.black_text, 18, FontWeight.bold),
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text(
                                      "Delete Category",
                                      style: Text_Style.text_Theme(
                                          Constants.red_text,
                                          20,
                                          FontWeight.bold),
                                    ),
                                    content: const Text(
                                        "Would you like to delete this category?"),
                                    actions: [
                                      TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          "Yes",
                                          style: Text_Style.text_Theme(
                                              Constants.red_text,
                                              16,
                                              FontWeight.bold),
                                        ),
                                      ),
                                      TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            "No",
                                            style: Text_Style.text_Theme(
                                                Constants.red_text,
                                                16,
                                                FontWeight.bold),
                                          ))
                                    ],
                                  ),
                                );
                              },
                              icon: const Icon(Icons.delete))
                        ],
                      ),
                    ),
                  ],
                )),
              ),
            ),
          );
        },
      ),
    );
  }
}
