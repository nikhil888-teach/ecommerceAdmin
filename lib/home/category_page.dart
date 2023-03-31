import 'package:adminpanelecommerce/storedata/add_category_page.dart';
import 'package:adminpanelecommerce/utils/constants.dart';
import 'package:adminpanelecommerce/widgets/text_theme.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class MyCategoryPage extends StatefulWidget {
  const MyCategoryPage({super.key});

  @override
  State<MyCategoryPage> createState() => _MyCategoryPageState();
}

class _MyCategoryPageState extends State<MyCategoryPage> {
  List? allData;
  CategoryModel categoryModel = CategoryModel();
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
                  listOfCategories(Constants.dMale),
                  listOfCategories(Constants.dFemale),
                  listOfCategories(Constants.dKids),
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
}

Padding listOfCategories(String selectCategory) {
  return Padding(
    padding: const EdgeInsets.only(top: 16),
    child: FirebaseAnimatedList(
      query: FirebaseDatabase.instance.ref(selectCategory),
      physics: const BouncingScrollPhysics(),
      defaultChild: const Center(
        child: CircularProgressIndicator(
          color: Colors.red,
        ),
      ),
      itemBuilder: (context, snapshot, animation, index) {
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
                    snapshot
                        .child(Constants.dSubCategoryImage)
                        .value
                        .toString(),
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
                            snapshot
                                .child(Constants.dSubCategoryName)
                                .value
                                .toString(),
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
                                      onPressed: () {
                                        String name = snapshot
                                            .child(Constants.dSubCategoryName)
                                            .value
                                            .toString();
                                        snapshot.child(name).ref.remove();
                                        deleteCategoryWithProduct(name);
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "Yes",
                                        style: Text_Style.text_Theme(
                                            Constants.red_text,
                                            16,
                                            FontWeight.bold),
                                      ),
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
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

void deleteCategoryWithProduct(String type) async {
  DatabaseReference databaseReference =
      FirebaseDatabase.instance.ref(Constants.dProducts);
  databaseReference.orderByKey().once().then((value) {
    value.snapshot.children.forEach((element) {
      if (element.child(Constants.dType).value == type) {
        FirebaseDatabase.instance
            .ref(Constants.dProducts)
            .child(element.child(Constants.dId).value.toString())
            .remove();
      }
    });
  });
}
