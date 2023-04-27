import 'package:adminpanelecommerce/utils/constants.dart';
import 'package:adminpanelecommerce/widgets/button_theme.dart';
import 'package:adminpanelecommerce/widgets/text_theme.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class MyOrdersProduct extends StatefulWidget {
  const MyOrdersProduct(
      {super.key,
      required this.orderKey,
      required this.trackNo,
      required this.totalProducts,
      required this.date,
      required this.address,
      required this.payment,
      required this.orderNo,
      this.total});
  final String orderKey;
  final String trackNo;
  final String totalProducts;
  final String date;
  final String address;
  final String payment;
  final String orderNo;
  final total;

  @override
  State<MyOrdersProduct> createState() => _MyOrdersProductState();
}

class _MyOrdersProductState extends State<MyOrdersProduct> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        leading: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
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
                      Text(widget.orderNo,
                          style: Text_Style.text_Theme(
                              Constants.black_text, 16, FontWeight.bold))
                    ],
                  ),
                  Text(widget.date,
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
                    Text(widget.trackNo,
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
                      Text(widget.totalProducts,
                          style: Text_Style.text_Theme(
                              Constants.black_text, 16, FontWeight.normal)),
                      Text(Constants.item,
                          style: Text_Style.text_Theme(
                              Constants.black_text, 16, FontWeight.normal)),
                    ],
                  ),
                  const Text(Constants.orders,
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: FirebaseAnimatedList(
                  query: FirebaseDatabase.instance
                      .ref(Constants.dorder)
                      .child(widget.orderKey)
                      .child(Constants.dProducts),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, snapshot, animation, index) => Padding(
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
                                  snapshot
                                      .child(Constants.dimages)
                                      .value
                                      .toString(),
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
                                      snapshot
                                          .child(Constants.dPname)
                                          .value
                                          .toString(),
                                      style: Text_Style.text_Theme(
                                        Constants.black_text,
                                        16,
                                        FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 7, top: 7),
                                    child: Row(
                                      children: [
                                        !snapshot.hasChild(Constants.dColor)
                                            ? const SizedBox()
                                            : Row(
                                                children: [
                                                  Text(
                                                    Constants.color,
                                                    style:
                                                        Text_Style.text_Theme(
                                                            Constants.grey_text,
                                                            13,
                                                            FontWeight.normal),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 15),
                                                    child: Text(
                                                      snapshot
                                                          .child(
                                                              Constants.dColor)
                                                          .value
                                                          .toString(),
                                                      style:
                                                          Text_Style.text_Theme(
                                                              Constants
                                                                  .black_text,
                                                              13,
                                                              FontWeight
                                                                  .normal),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                        Row(
                                          children: [
                                            Text(
                                              Constants.size,
                                              style: Text_Style.text_Theme(
                                                  Constants.grey_text,
                                                  13,
                                                  FontWeight.normal),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 15),
                                              child: Text(
                                                !snapshot.hasChild(
                                                        Constants.dSize)
                                                    ? "Free Size"
                                                    : snapshot
                                                        .child(Constants.dSize)
                                                        .value
                                                        .toString(),
                                                style: Text_Style.text_Theme(
                                                  Constants.black_text,
                                                  13,
                                                  FontWeight.normal,
                                                ),
                                              ),
                                            )
                                          ],
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
                                            snapshot
                                                .child(Constants.dQuantity)
                                                .value
                                                .toString(),
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
                                            "${snapshot.child(Constants.dSPrice).value}\$",
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
                  Constants.black_text,
                  14,
                  FontWeight.w600,
                ),
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
                        Constants.grey_text,
                        14,
                        FontWeight.w200,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        textAlign: TextAlign.right,
                        softWrap: true,
                        widget.address,
                        style: Text_Style.text_Theme(
                          Constants.black_text,
                          14,
                          FontWeight.normal,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Constants.pay_meth,
                    style: Text_Style.text_Theme(
                      Constants.grey_text,
                      14,
                      FontWeight.w200,
                    ),
                  ),
                  Text(
                    widget.payment,
                    style: Text_Style.text_Theme(
                      Constants.black_text,
                      14,
                      FontWeight.normal,
                    ),
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
                        Constants.grey_text,
                        14,
                        FontWeight.w200,
                      ),
                    ),
                    Text(
                      softWrap: true,
                      "FedEx, 3 days",
                      style: Text_Style.text_Theme(
                        Constants.black_text,
                        14,
                        FontWeight.normal,
                      ),
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
                      Constants.grey_text,
                      14,
                      FontWeight.w200,
                    ),
                  ),
                  Text(
                    softWrap: true,
                    "10%, Personal promo code",
                    style: Text_Style.text_Theme(
                      Constants.black_text,
                      14,
                      FontWeight.normal,
                    ),
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
                      Constants.total_amt,
                      style: Text_Style.text_Theme(
                        Constants.grey_text,
                        14,
                        FontWeight.w200,
                      ),
                    ),
                    Text(
                      softWrap: true,
                      "${widget.total}\$",
                      style: Text_Style.text_Theme(
                        Constants.black_text,
                        14,
                        FontWeight.normal,
                      ),
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
