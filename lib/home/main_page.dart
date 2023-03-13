import 'package:adminpanelecommerce/home/category_page.dart';
import 'package:adminpanelecommerce/home/dashboard_page.dart';
import 'package:adminpanelecommerce/home/product_page.dart';
import 'package:adminpanelecommerce/home/user_page.dart';
import 'package:adminpanelecommerce/utils/constants.dart';
import 'package:adminpanelecommerce/widgets/text_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyMainPage extends StatefulWidget {
  const MyMainPage({super.key});

  @override
  State<MyMainPage> createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MyMainPage> {
  int currentindex = 0;
  List pagess = <Widget>[
    const MyDashboardPage(),
    const MyDashboardPage(),
    const MyProductPage(),
    const MyCategoryPage(),
    const MyUserPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: pagess.elementAt(currentindex),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentindex,
            type: BottomNavigationBarType.fixed,
            onTap: (value) {
              if (!mounted) return;
              setState(() {
                currentindex = value;
              });
            },
            selectedLabelStyle: const TextStyle(
                color: Colors.red, fontSize: 10, fontWeight: FontWeight.normal),
            selectedIconTheme: const IconThemeData(color: Colors.red),
            selectedItemColor: const Color(0xffDB3022),
            backgroundColor: Colors.white,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            unselectedItemColor: Colors.grey,
            unselectedLabelStyle: Text_Style.text_Theme(
                Constants.grey_text, 10, FontWeight.normal),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard),
                  label: "Dashbord",
                  activeIcon: Icon(
                    Icons.dashboard,
                    color: Colors.red,
                  )),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  label: "Order",
                  activeIcon: Icon(
                    Icons.shopping_cart,
                    color: Colors.red,
                  )),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.cube_box),
                  label: "Product",
                  activeIcon: Icon(
                    CupertinoIcons.cube_box_fill,
                    color: Colors.red,
                  )),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category_outlined),
                  label: "Category",
                  activeIcon: Icon(
                    Icons.category,
                    color: Colors.red,
                  )),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outlined),
                  label: "User",
                  activeIcon: Icon(
                    Icons.person,
                    color: Colors.red,
                  ))
            ]),
      ),
    );
  }
}
