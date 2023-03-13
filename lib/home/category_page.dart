import 'package:adminpanelecommerce/storedata/add_category_page.dart';
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
      child: SafeArea(
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
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.red,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const MyAddCategory(),
              ));
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
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
                height: 105,
                child: Card(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTamE2X9X7VXv0Y_ce4RiWqJmoZ8AYuMJ5dYg&usqp=CAU",
                      width: 105,
                      height: 105,
                      fit: BoxFit.fill,
                    ),
                    Expanded(
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
