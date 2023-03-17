import 'package:adminpanelecommerce/utils/constants.dart';
import 'package:adminpanelecommerce/widgets/text_theme.dart';
import 'package:flutter/material.dart';

class MyDeclinedProduct extends StatefulWidget {
  const MyDeclinedProduct({super.key});

  @override
  State<MyDeclinedProduct> createState() => _MyDeclinedProductState();
}

class _MyDeclinedProductState extends State<MyDeclinedProduct> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 0,
        title: Text("Order Details",
            style: Text_Style.text_Theme(
                Constants.black_text, 18, FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(Constants.orderNo,
                          style: Text_Style.text_Theme(
                              Constants.black_text, 16, FontWeight.bold)),
                      Text("102003",
                          style: Text_Style.text_Theme(
                              Constants.black_text, 16, FontWeight.bold))
                    ],
                  ),
                  Text("05-12-2019",
                      style: Text_Style.text_Theme(
                          Constants.grey_text, 16, FontWeight.normal))
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 7),
                child: Row(
                  children: [
                    Text(Constants.trackingNo,
                        style: Text_Style.text_Theme(
                            Constants.grey_text, 16, FontWeight.normal)),
                    Text("IW3475453455",
                        style: Text_Style.text_Theme(
                            Constants.black_text, 16, FontWeight.w500))
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text("3",
                          style: Text_Style.text_Theme(
                              Constants.black_text, 16, FontWeight.normal)),
                      Text(Constants.item,
                          style: Text_Style.text_Theme(
                              Constants.black_text, 16, FontWeight.normal)),
                    ],
                  ),
                  const Text(Constants.declined,
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 14,
                          fontWeight: FontWeight.w500))
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Card(
                      child: Row(
                        children: [
                          Ink(
                              decoration: const BoxDecoration(boxShadow: [
                                BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(0, 0),
                                    blurRadius: 5),
                              ]),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4),
                                    bottomLeft: Radius.circular(4)),
                                child: Image.network(
                                  "https://m.media-amazon.com/images/I/61XdzIyV6hL._UY741_.jpg",
                                  fit: BoxFit.fill,
                                  color: Colors.grey.shade300,
                                  colorBlendMode: BlendMode.multiply,
                                  height: 105,
                                  width: 105,
                                ),
                              )),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      "Pullover",
                                      style: Text_Style.text_Theme(
                                          Constants.black_text,
                                          16,
                                          FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 7, top: 7),
                                    child: Row(
                                      children: [
                                        Text(
                                          Constants.color,
                                          style: Text_Style.text_Theme(
                                              Constants.grey_text,
                                              13,
                                              FontWeight.normal),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 15),
                                          child: Text(
                                            "Black",
                                            style: Text_Style.text_Theme(
                                                Constants.black_text,
                                                13,
                                                FontWeight.normal),
                                          ),
                                        ),
                                        Text(
                                          Constants.size,
                                          style: Text_Style.text_Theme(
                                              Constants.grey_text,
                                              13,
                                              FontWeight.normal),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 15),
                                          child: Text(
                                            "L",
                                            style: Text_Style.text_Theme(
                                                Constants.black_text,
                                                13,
                                                FontWeight.normal),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            Constants.unit,
                                            style: Text_Style.text_Theme(
                                                Constants.grey_text,
                                                13,
                                                FontWeight.normal),
                                          ),
                                          Text(
                                            "1",
                                            style: Text_Style.text_Theme(
                                                Constants.black_text,
                                                14,
                                                FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: Text(
                                            "51\$",
                                            style: Text_Style.text_Theme(
                                                Constants.black_text,
                                                20,
                                                FontWeight.bold),
                                          ))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                Constants.ord_info,
                style: Text_Style.text_Theme(
                    Constants.black_text, 14, FontWeight.w600),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Constants.shipp_add,
                      style: Text_Style.text_Theme(
                          Constants.grey_text, 14, FontWeight.w200),
                    ),
                    Expanded(
                      child: Text(
                        textAlign: TextAlign.right,
                        softWrap: true,
                        "3 Newbridge Court ,Chino Hills, CA 91709, United States",
                        style: Text_Style.text_Theme(
                            Constants.black_text, 14, FontWeight.normal),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Constants.pay_meth,
                    style: Text_Style.text_Theme(
                        Constants.grey_text, 14, FontWeight.w200),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Constants.del_method,
                      style: Text_Style.text_Theme(
                          Constants.grey_text, 14, FontWeight.w200),
                    ),
                    Text(
                      softWrap: true,
                      "FedEx, 3 days, 15\$",
                      style: Text_Style.text_Theme(
                          Constants.black_text, 14, FontWeight.normal),
                    )
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Constants.discount,
                    style: Text_Style.text_Theme(
                        Constants.grey_text, 14, FontWeight.w200),
                  ),
                  Text(
                    softWrap: true,
                    "10%, Personal promo code",
                    style: Text_Style.text_Theme(
                        Constants.black_text, 14, FontWeight.normal),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Constants.tot_amt,
                      style: Text_Style.text_Theme(
                          Constants.grey_text, 14, FontWeight.w200),
                    ),
                    Text(
                      softWrap: true,
                      "133\$",
                      style: Text_Style.text_Theme(
                          Constants.black_text, 14, FontWeight.normal),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
