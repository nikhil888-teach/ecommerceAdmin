import 'package:adminpanelecommerce/utils/constants.dart';
import 'package:adminpanelecommerce/widgets/text_theme.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class MyUserPage extends StatefulWidget {
  const MyUserPage({super.key});

  @override
  State<MyUserPage> createState() => _MyUserPageState();
}

class _MyUserPageState extends State<MyUserPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(Constants.user,
              style: Text_Style.text_Theme(
                  Constants.black_text, 20, FontWeight.bold)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: FirebaseAnimatedList(
            query: FirebaseDatabase.instance.ref('User'),
            physics: const BouncingScrollPhysics(),
            defaultChild: const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            ),
            itemBuilder: (context, snapshot, animation, index) {
              return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.height / 100)),
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.height / 7),
                    child: Image.network(
                      "https://avatars.githubusercontent.com/u/84656107?v=4",
                      fit: BoxFit.fill,
                      height: 90,
                    ),
                  ),
                  title: Text(
                    snapshot.child('name').value.toString(),
                    style: Text_Style.text_Theme(
                        Constants.black_text, 18, FontWeight.bold),
                  ),
                  subtitle: Text(
                    snapshot.child('email').value.toString(),
                    style: Text_Style.text_Theme(
                        Constants.black_text, 16, FontWeight.w500),
                  ),
                  // children: [
                  //   ClipRRect(
                  //     borderRadius: BorderRadius.circular(
                  //         MediaQuery.of(context).size.height / 7),
                  //     child: Image.network(
                  //       "https://avatars.githubusercontent.com/u/84656107?v=4",
                  //       fit: BoxFit.fill,
                  //       height: 90,
                  //       width: 90,
                  //     ),
                  //   ),
                  //   Expanded(
                  //     child: Center(
                  //       child: Column(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             snapshot.child('name').value.toString(),
                  //             style: Text_Style.text_Theme(
                  //                 Constants.black_text, 18, FontWeight.bold),
                  //           ),
                  //           Text(
                  //             snapshot.child('email').value.toString(),
                  //             style: Text_Style.text_Theme(
                  //                 Constants.grey_text, 12, FontWeight.normal),
                  //           )
                  //         ],
                  //       ),
                  //     ),
                  //   )
                  // ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
