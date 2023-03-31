import 'package:adminpanelecommerce/home/myorders/tabs/accepted/acceptedproduct_page.dart';
import 'package:adminpanelecommerce/utils/constants.dart';
import 'package:adminpanelecommerce/widgets/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';

class MyAccepted extends StatefulWidget {
  const MyAccepted({super.key});

  @override
  State<MyAccepted> createState() => _MyAcceptedState();
}

class _MyAcceptedState extends State<MyAccepted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseDatabase.instance.ref(Constants.dorder).onValue,
          builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              );
            } else if (snapshot.data!.snapshot.exists) {
              Map<dynamic, dynamic> data =
                  snapshot.data!.snapshot.value as dynamic;
              List<dynamic> list = [];
              list.clear();
              for (var element in data.values) {
                if (element[Constants.dstatus] == Constants.dAccepted) {
                  list.add(element);
                }
              }
              list.sort(
                  (a, b) => b[Constants.dodate].compareTo(a[Constants.dodate]));
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: list.length,
                itemBuilder: (context, index) {
                  var dateTime = DateFormat('dd-MM-yyyy');
                  DateTime? time =
                      DateTime.tryParse(list[index][Constants.dodate]);
                  var formateDate = dateTime.format(time!);
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
                                        Constants.black_text,
                                        16,
                                        FontWeight.bold,
                                      )),
                                  Text(
                                      list[index][Constants.dorderno]
                                          .toString(),
                                      style: Text_Style.text_Theme(
                                        Constants.black_text,
                                        15,
                                        FontWeight.bold,
                                      ))
                                ],
                              ),
                              Text(formateDate.toString(),
                                  style: Text_Style.text_Theme(
                                    Constants.grey_text,
                                    15,
                                    FontWeight.normal,
                                  ))
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 7),
                            child: Row(
                              children: [
                                Text(Constants.trackingNo,
                                    style: Text_Style.text_Theme(
                                      Constants.grey_text,
                                      15,
                                      FontWeight.normal,
                                    )),
                                Text(
                                    list[index][Constants.dtrackNum].toString(),
                                    style: Text_Style.text_Theme(
                                      Constants.black_text,
                                      15,
                                      FontWeight.w500,
                                    ))
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
                                        Constants.grey_text,
                                        15,
                                        FontWeight.normal,
                                      )),
                                  Text(
                                      list[index][Constants.dTotalProduct]
                                          .toString(),
                                      style: Text_Style.text_Theme(
                                        Constants.black_text,
                                        15,
                                        FontWeight.bold,
                                      ))
                                ],
                              ),
                              Row(
                                children: [
                                  Text(Constants.tot_amt,
                                      style: Text_Style.text_Theme(
                                        Constants.grey_text,
                                        15,
                                        FontWeight.normal,
                                      )),
                                  Text(
                                      "\$" +
                                          list[index][Constants.dtotal]
                                              .toString(),
                                      style: Text_Style.text_Theme(
                                        Constants.black_text,
                                        15,
                                        FontWeight.bold,
                                      ))
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
                                            const BorderSide(
                                                color: Colors.grey))),
                                    onPressed: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) => MyAcceptedProduct(
                                          orderNo: list[index]
                                                  [Constants.dorderno]
                                              .toString(),
                                          orderKey: list[index][Constants.dokey]
                                              .toString(),
                                          date: formateDate.toString(),
                                          address: list[index]
                                              [Constants.dShipAddress],
                                          payment: list[index]
                                              [Constants.dPayment],
                                          trackNo: list[index]
                                              [Constants.dtrackNum],
                                          totalProducts: list[index]
                                                  [Constants.dTotalProduct]
                                              .toString(),
                                          total: list[index][Constants.dtotamt],
                                        ),
                                      ));
                                    },
                                    child: Text(
                                      Constants.detail,
                                      style: Text_Style.text_Theme(
                                        Constants.black_text,
                                        15,
                                        FontWeight.w600,
                                      ),
                                    )),
                                const Text(
                                  Constants.accepted,
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: Text(
                  "Empty",
                  style: Text_Style.text_Theme(
                      Constants.black_text, 14, FontWeight.bold),
                ),
              );
            }
          }),
    );
  }
}
