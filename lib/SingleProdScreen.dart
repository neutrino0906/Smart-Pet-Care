import 'package:flutter/material.dart';

class SingleProdScreen extends StatefulWidget {
  String getRoute() => "SingleProdScreen";
  State<SingleProdScreen> createState() => _SingleProdScreenState();
}

class _SingleProdScreenState extends State<SingleProdScreen> {
  // const SingleProdScreen({super.key});

  // String name = "Prashant";

  String? _selectedItem;

  final List<String> _items = ['1', '2', '3', '4', '5'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.black),
            centerTitle: true,
            // title: Text("PET CARE"),

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
        body: SizedBox(
          width: double.infinity,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: 2,
                color: Colors.black,
              ),
              const SizedBox(
                height: 15,
              ),
              Image.asset(
                "assets/Prod_1_scaled.png",
                scale: 0.8,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 1.5,
                color: Colors.black,
              ),
              Expanded(
                child: Container(
                  color: const Color.fromARGB(255, 233, 233, 233),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "\$80.50",
                            style: TextStyle(fontSize: 35),
                          ),
                          Text(
                            "-80% Off",
                            style: TextStyle(fontSize: 30, color: Colors.red),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Row(
                        children: [
                          SizedBox(width: 50),
                          Text("M.R.P. : ",
                              style: TextStyle(
                                fontSize: 20,
                              )),
                          Text(
                            "\$100.625",
                            style: TextStyle(
                                fontSize: 20,
                                decoration: TextDecoration.lineThrough),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 1.5,
                        color: Colors.black,
                      ),
                      const SizedBox(height: 20),
                      const Row(
                        children: [
                          SizedBox(width: 50),
                          Icon(
                            Icons.map,
                            size: 50,
                          ),
                          SizedBox(width: 50),
                          Text(
                            "Deliver to",
                            style: TextStyle(color: Colors.blue, fontSize: 30),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 1.5,
                        color: Colors.black,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const SizedBox(width: 50),
                          const Text(
                            "In Stock",
                            style: TextStyle(color: Colors.green, fontSize: 30),
                          ),
                          const SizedBox(width: 50),
                          Container(
                            height: 35,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Color.fromARGB(255, 201, 201, 201),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: DropdownButton<String>(
                              hint: const Text("Quantity"),
                              value: _selectedItem,
                              onChanged: (value) {
                                setState(() {
                                  _selectedItem = value;
                                });
                              },
                              items: _items.map((String item) {
                                return DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(item),
                                );
                              }).toList(),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MaterialButton(
                            height: 50,
                            color: const Color.fromARGB(255, 201, 201, 201),
                            onPressed: () {},
                            child: const Text(
                              "Add to Cart",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          MaterialButton(
                            height: 50,
                            color: const Color.fromARGB(255, 201, 201, 201),
                            onPressed: () {},
                            child: const Text(
                              "Buy Now",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
