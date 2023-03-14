import 'package:adminpanelecommerce/home/myorders/tabs/accepted/accepted_page.dart';
import 'package:adminpanelecommerce/home/myorders/tabs/declined/declined_page.dart';
import 'package:adminpanelecommerce/home/myorders/tabs/ordered/ordered_page.dart';
import 'package:adminpanelecommerce/utils/constants.dart';
import 'package:adminpanelecommerce/widgets/text_theme.dart';
import 'package:flutter/material.dart';

class MyOrderPage extends StatefulWidget {
  const MyOrderPage({Key? key}) : super(key: key);

  @override
  State<MyOrderPage> createState() => _MyOrderPageState();
}

class _MyOrderPageState extends State<MyOrderPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leadingWidth: 0,
            backgroundColor: Colors.white,
            title: Text("My Orders",
                style: Text_Style.text_Theme(
                    Constants.black_text, 18, FontWeight.bold)),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: TabBar(
                    labelPadding: const EdgeInsets.symmetric(vertical: 7),
                    indicator: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    unselectedLabelColor: const Color(0xff222222),
                    unselectedLabelStyle: const TextStyle(
                        color: Color(Constants.black_text),
                        fontSize: 16,
                        fontWeight: FontWeight.normal),
                    labelColor: const Color(Constants.white_text),
                    labelStyle: const TextStyle(
                        color: Color(Constants.black_text),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                    tabs: const [
                      Text(Constants.orders),
                      Text(Constants.accepted),
                      Text(Constants.declined)
                    ]),
              ),
              const Expanded(
                  child: TabBarView(
                      children: [MyOrdered(), MyAccepted(), MyDeclined()]))
            ],
          ),
        ),
      ),
    );
  }
}
