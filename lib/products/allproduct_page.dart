import 'package:adminpanelecommerce/products/product_view.dart';
import 'package:adminpanelecommerce/utils/constants.dart';
import 'package:adminpanelecommerce/widgets/text_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class MyCategoryProducts extends StatefulWidget {
  const MyCategoryProducts(
      {super.key, required this.type, required this.gender});
  final String type;
  final String gender;

  @override
  State<MyCategoryProducts> createState() => _MyCategoryProductsState();
}

class _MyCategoryProductsState extends State<MyCategoryProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.type,
              style: Text_Style.text_Theme(
                  Constants.black_text, 20, FontWeight.bold)),
        ),
        body: StreamBuilder(
          stream: FirebaseDatabase.instance.ref(Constants.dProducts).onValue,
          builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              );
            }

            Map<dynamic, dynamic> data =
                snapshot.data!.snapshot.value as dynamic;
            List<dynamic> list = [];
            list.clear();
            for (var element in data.values) {
              if (element[Constants.dType] == widget.type &&
                  element[Constants.dGender] == widget.gender) {
                list.add(element);
              }
            }

            return SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                child: GridView.builder(
                    itemCount: list.length,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.540,
                    ),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MyProductPage(
                              images: list[index][Constants.dimages],
                              brand: list[index][Constants.dBrand],
                              decription: list[index][Constants.dDesc],
                              name: list[index][Constants.dPname],
                              price: list[index][Constants.dSPrice],
                            ),
                          ));
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Stack(
                                children: [
                                  AspectRatio(
                                    aspectRatio: 80 / 100,
                                    child: Ink(
                                        decoration:
                                            const BoxDecoration(boxShadow: [
                                          BoxShadow(
                                              color: Colors.black12,
                                              offset: Offset(0, 0),
                                              blurRadius: 5),
                                        ]),
                                        child: Image.network(
                                          list[index][Constants.dimages][0],
                                          fit: BoxFit.fill,
                                          color: Colors.grey.shade300,
                                          colorBlendMode: BlendMode.multiply,
                                          scale: 3,
                                        )),
                                  ),
                                  Positioned(
                                    bottom: 5,
                                    right: 5,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(29)),
                                      child: const Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Icon(
                                            CupertinoIcons.heart_fill,
                                            color: Colors.white,
                                            size: 14,
                                          )),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 7),
                                    child: Row(
                                      children: [
                                        for (int i = 0; i < 5; i++)
                                          const Icon(
                                            Icons.star,
                                            size: 14,
                                            color: Colors.yellow,
                                          ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 2, bottom: 0),
                                          child: Text(
                                            "(10)",
                                            style: Text_Style.text_Theme(
                                              Constants.grey_text,
                                              13,
                                              FontWeight.normal,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Text(
                                    list[index][Constants.dBrand],
                                    style: Text_Style.text_Theme(
                                      Constants.grey_text,
                                      11,
                                      FontWeight.normal,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 4, bottom: 0),
                                    child: Text(
                                      list[index][Constants.dPname],
                                      style: Text_Style.text_Theme(
                                        Constants.black_text,
                                        16,
                                        FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 4),
                                          child: Text(
                                              "${list[index][Constants.dSPrice]}\$",
                                              style: const TextStyle(
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  color: Color(
                                                      Constants.grey_text),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        Text(
                                            "${list[index][Constants.dSPrice]}\$",
                                            style: Text_Style.text_Theme(
                                              Constants.red_text,
                                              14,
                                              FontWeight.bold,
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ),
            );
          },
        ));
  }
}
