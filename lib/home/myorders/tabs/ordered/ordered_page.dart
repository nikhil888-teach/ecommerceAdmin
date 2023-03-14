import 'package:adminpanelecommerce/home/myorders/tabs/ordered/orderedproduct_page.dart';
import 'package:adminpanelecommerce/utils/constants.dart';
import 'package:adminpanelecommerce/widgets/text_theme.dart';
import 'package:flutter/material.dart';

class MyOrdered extends StatefulWidget {
  const MyOrdered({super.key});

  @override
  State<MyOrdered> createState() => _MyOrderedState();
}

class _MyOrderedState extends State<MyOrdered> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
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
                                  Constants.black_text, 15, FontWeight.bold))
                        ],
                      ),
                      Text("05-12-2019",
                          style: Text_Style.text_Theme(
                              Constants.grey_text, 15, FontWeight.normal))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 7),
                    child: Row(
                      children: [
                        Text(Constants.trackingNo,
                            style: Text_Style.text_Theme(
                                Constants.grey_text, 15, FontWeight.normal)),
                        Text("IW3475453455",
                            style: Text_Style.text_Theme(
                                Constants.black_text, 15, FontWeight.w500))
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(Constants.quantity,
                              style: Text_Style.text_Theme(
                                  Constants.grey_text, 15, FontWeight.normal)),
                          Text("3",
                              style: Text_Style.text_Theme(
                                  Constants.black_text, 15, FontWeight.bold))
                        ],
                      ),
                      Row(
                        children: [
                          Text(Constants.total_amt,
                              style: Text_Style.text_Theme(
                                  Constants.grey_text, 15, FontWeight.normal)),
                          Text("\$112",
                              style: Text_Style.text_Theme(
                                  Constants.black_text, 15, FontWeight.bold))
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OutlinedButton(
                            style: ButtonStyle(
                                side: MaterialStateProperty.all(
                                    const BorderSide(color: Colors.grey))),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const MyOrdersProduct(),
                              ));
                            },
                            child: Text(
                              Constants.detail,
                              style: Text_Style.text_Theme(
                                  Constants.black_text, 15, FontWeight.w600),
                            )),
                        const Text(Constants.orders,
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 15,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
