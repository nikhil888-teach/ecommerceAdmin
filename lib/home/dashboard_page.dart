import 'package:adminpanelecommerce/utils/constants.dart';
import 'package:adminpanelecommerce/widgets/text_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDashboardPage extends StatefulWidget {
  const MyDashboardPage({super.key});

  @override
  State<MyDashboardPage> createState() => _MyDashboardPageState();
}

class _MyDashboardPageState extends State<MyDashboardPage>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? animation;
  // var _opacity = 0.0;
  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100));
    animation = Tween(begin: 0.0, end: 1.0).animate(animationController!);
    animationController!.addListener(() {
      setState(() {});
    });
    animationController!.forward();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    animationController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(Constants.dashboard,
              style: Text_Style.text_Theme(
                  Constants.black_text, 20, FontWeight.bold)),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 150),
                  opacity: animationController!.value,
                  curve: Curves.easeIn,
                  child: Card(
                    color: const Color(0xffDAA7B8),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              AnimatedOpacity(
                                  duration: const Duration(milliseconds: 300),
                                  opacity: animationController!.value,
                                  curve: Curves.easeIn,
                                  child: const Icon(Icons.person,
                                      color: Colors.white)),
                              Expanded(
                                child: Center(
                                  child: AnimatedOpacity(
                                    duration: const Duration(milliseconds: 450),
                                    opacity: animationController!.value,
                                    curve: Curves.easeIn,
                                    child: const Text(
                                      Constants.totuser,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: AnimatedOpacity(
                                duration: const Duration(milliseconds: 600),
                                opacity: animationController!.value,
                                curve: Curves.easeIn,
                                child: const Text(
                                  "72,540",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 150),
                      opacity: animationController!.value,
                      curve: Curves.easeIn,
                      child: Card(
                        color: const Color(0xffA3A7FC),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  AnimatedOpacity(
                                      duration:
                                          const Duration(milliseconds: 200),
                                      opacity: animationController!.value,
                                      curve: Curves.easeIn,
                                      child: const Icon(Icons.shopping_cart,
                                          color: Colors.white)),
                                  Expanded(
                                    child: Center(
                                        child: AnimatedOpacity(
                                      duration:
                                          const Duration(milliseconds: 450),
                                      opacity: animationController!.value,
                                      curve: Curves.easeIn,
                                      child: const Text(
                                        Constants.totorder,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20),
                                      ),
                                    )),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 25),
                                child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: AnimatedOpacity(
                                      duration:
                                          const Duration(milliseconds: 600),
                                      opacity: animationController!.value,
                                      curve: Curves.easeIn,
                                      child: const Text(
                                        "72,540",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30),
                                      ),
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                    )),
                AnimatedOpacity(
                    duration: const Duration(milliseconds: 150),
                    opacity: animationController!.value,
                    curve: Curves.easeIn,
                    child: Card(
                      color: const Color(0xffFF6659),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                AnimatedOpacity(
                                    duration: const Duration(milliseconds: 300),
                                    opacity: animationController!.value,
                                    curve: Curves.easeIn,
                                    child: const Icon(
                                        CupertinoIcons.cube_box_fill,
                                        color: Colors.white)),
                                Expanded(
                                  child: Center(
                                      child: AnimatedOpacity(
                                    duration: const Duration(milliseconds: 450),
                                    opacity: animationController!.value,
                                    curve: Curves.easeIn,
                                    child: const Text(
                                      Constants.liveprodct,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20),
                                    ),
                                  )),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 25),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: AnimatedOpacity(
                                  duration: const Duration(milliseconds: 600),
                                  opacity: animationController!.value,
                                  curve: Curves.easeIn,
                                  child: const Text("72,540",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30)),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
