import 'package:adminpanelecommerce/home/products/allproduct_page.dart';
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
              const Expanded(
                child: TabBarView(children: [
                  ProductPageView(selectCategory: Constants.men),
                  ProductPageView(selectCategory: Constants.women),
                  ProductPageView(selectCategory: Constants.dKids),
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

class ProductPageView extends StatefulWidget {
  const ProductPageView({super.key, required this.selectCategory});
  final String selectCategory;

  @override
  State<ProductPageView> createState() => _ProductPageViewState();
}

class _ProductPageViewState extends State<ProductPageView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 16),
        child: FirebaseAnimatedList(
            query: FirebaseDatabase.instance.ref('TestUjas/Products'),
            physics: const BouncingScrollPhysics(),
            defaultChild: const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            ),
            itemBuilder: (context, snapshot, animation, index) {
              // print(widget.selectCategory);
              if (snapshot.child('Gender').value == widget.selectCategory) {
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 16),
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
                                .child('images')
                                .children
                                .elementAt(1)
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
                                    snapshot.child('Type').value.toString(),
                                    style: Text_Style.text_Theme(
                                        Constants.black_text,
                                        18,
                                        FontWeight.bold),
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                      // showDialog(
                                      //   context: context,
                                      //   builder: (context) => AlertDialog(
                                      //     title: Text(
                                      //       "Delete Category",
                                      //       style: Text_Style.text_Theme(
                                      //           Constants.red_text,
                                      //           20,
                                      //           FontWeight.bold),
                                      //     ),
                                      //     content: const Text(
                                      //         "Would you like to delete this category?"),
                                      //     actions: [
                                      //       TextButton(
                                      //         onPressed: () {
                                      //           String name = snapshot
                                      //               .child(
                                      //                   Constants.dSubCategoryName)
                                      //               .value
                                      //               .toString();
                                      //           snapshot.child(name).ref.remove();
                                      //         },
                                      //         child: Text(
                                      //           "Yes",
                                      //           style: Text_Style.text_Theme(
                                      //               Constants.red_text,
                                      //               16,
                                      //               FontWeight.bold),
                                      //         ),
                                      //       ),
                                      //       TextButton(
                                      //           onPressed: () {
                                      //             Navigator.pop(context);
                                      //           },
                                      //           child: Text(
                                      //             "No",
                                      //             style: Text_Style.text_Theme(
                                      //                 Constants.red_text,
                                      //                 16,
                                      //                 FontWeight.bold),
                                      //           ))
                                      //     ],
                                      //   ),
                                      // );

                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) =>
                                            MyCategoryProducts(
                                          type: snapshot
                                              .child('Type')
                                              .value
                                              .toString(),
                                          gender: snapshot
                                              .child('Gender')
                                              .value
                                              .toString(),
                                        ),
                                      ));
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
              } else {
                return const SizedBox();
              }
            }));
  }
}
