import 'package:flutter/material.dart';
import './ChatScreen.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

// ignore: must_be_immutable
class VeteScreen extends StatelessWidget {
  VeteScreen({super.key});

  // const VeteScreen({super.key});
  String getRoute() => 'VeteScreen';

  String mapSearch = "https://www.google.com/maps/search/pet+centers+near+me";

  Future<void> _launchUrl() async {
    if (!await launchUrlString(mapSearch)) {
      throw Exception('Could not launch');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 80,
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          actions: const [
            Icon(
              Icons.person,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            SizedBox(
              width: 20,
            )
          ],
          // shadowColor: Colors.black,
          elevation: 0,
          backgroundColor: Colors.transparent),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: 2,
            color: Colors.black,
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "Our\nMedicare\nservices",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 35),
                  GestureDetector(
                    onTap: _launchUrl,
                    // () async =>
                    // if (await canLaunchUrl(Uri.parse(mapSearch))) {
                    // await launchUrl(Uri.parse(mapSearch)),
                    //   } else
                    //     print("Error occured");
                    // },
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 225, 225, 225),
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(255, 190, 190, 190),
                                blurRadius: 5.0, // soften the shadow
                                spreadRadius: 0.0, //extend the shadow
                                offset: Offset(
                                  0, // Move to right 5  horizontally
                                  5.0, // Move to bottom 5 Vertically
                                ),
                              ),
                            ],
                          ),
                          // color: Colors.grey,
                          height: 150,
                          width: 150,
                        ),
                        const Positioned(
                          bottom: 10,
                          left: 10,
                          child: Text(
                            "Pet\nCenters\nnear you",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Positioned(
                            right: 10,
                            child: Image.asset(
                              'assets/Doctors Bag Icon.png',
                              scale: 0.75,
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(height: 35),
                  GestureDetector(
                    onTap: () => Navigator.of(context)
                        .pushNamed(ChatScreen().getRoute()),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 225, 225, 225),
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(255, 190, 190, 190),
                                blurRadius: 5.0, // soften the shadow
                                spreadRadius: 0.0, //extend the shadow
                                offset: Offset(
                                  0, // Move to right 5  horizontally
                                  5.0, // Move to bottom 5 Vertically
                                ),
                              ),
                            ],
                          ),
                          // color: Colors.grey,
                          height: 150,
                          width: 150,
                        ),
                        const Positioned(
                          bottom: 10,
                          left: 10,
                          child: Text(
                            "Talk\nto\na specialist",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Positioned(
                            right: 10,
                            top: 10,
                            child: Image.asset(
                              'assets/Stethoscope Icon.png',
                              scale: 0.75,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
              Image.asset("assets/Doctor Dog.png"),
            ],
          )
        ],
      ),
    );
  }
}
