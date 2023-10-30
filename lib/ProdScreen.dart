import 'package:flutter/material.dart';
import './widgets/SingleProdTile.dart';
import '../SingleProdScreen.dart';

// ignore: must_be_immutable
class ProdScreen extends StatelessWidget {
  ProdScreen({super.key});

  String getRoute() => "ProdScreen";

  List<List<String>> ProdList = [
    [
      "assets/Prod_1.png",
      "Pedigree Dog Food",
      "\$80.50",
    ],
    [
      "assets/Prod_2.png",
      "Dog's Nausea Medicine",
      "\$20.125",
    ],
    [
      "assets/Prod_3.png",
      "Cat Shampoo",
      "\$25",
    ]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            toolbarHeight: 80,
            iconTheme: IconThemeData(color: Colors.black),
            centerTitle: true,
            // title: Text("PET CARE"),
            // leading: const Icon(
            //   Icons.back_hand,
            //   color: Color.fromARGB(255, 0, 0, 0),
            // ),
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
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 2,
              color: Colors.black,
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                decoration: InputDecoration(
                    fillColor: Color.fromARGB(255, 227, 227, 227),
                    filled: true,
                    icon: Icon(Icons.search),
                    hintText: 'Search',
                    contentPadding: const EdgeInsets.all(15),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
                onChanged: (value) {
                  // do something
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(20),
                itemBuilder: ((context, i) {
                  return Column(
                    children: [
                      GestureDetector(
                        // onTap: Navigator.of(context)
                        //     .pushNamed(SingleProdScreen().getRoute()),
                        child: GestureDetector(
                          onTap: () => Navigator.of(context)
                              .pushNamed(SingleProdScreen().getRoute()),
                          child: SingleProdTile(
                              image: ProdList[i][0],
                              name: ProdList[i][1],
                              price: ProdList[i][2]),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  );
                }),
                itemCount: ProdList.length,
              ),
            )
          ],
        ));
  }
}
