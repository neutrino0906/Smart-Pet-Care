import 'package:flutter/material.dart';
import 'package:test_tflite/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutterapp/services/functions/firebaseFunctions.dart';

class RegScreen extends StatefulWidget {
  const RegScreen({super.key});

  @override
  State<RegScreen> createState() => _RegScreenState();
}

class _RegScreenState extends State<RegScreen>
    with SingleTickerProviderStateMixin {
  String getRoute() => "RegScreen";

  FirebaseAuth auth = FirebaseAuth.instance;

  static const List<Tab> myTabs = <Tab>[
    Tab(
      text: 'Login',
      icon: Icon(Icons.login),
    ),
    Tab(
      text: 'Register',
      icon: Icon(Icons.person),
    ),
  ];

  late TabController _tabController;
  late TextEditingController _login_email = TextEditingController();
  late TextEditingController _login_pass = TextEditingController();
  late TextEditingController _register_name = TextEditingController();
  late TextEditingController _register_email = TextEditingController();
  late TextEditingController _register_pass = TextEditingController();
  late TextEditingController _register_petName = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
    _login_email = TextEditingController();
    _login_pass = TextEditingController();
    _register_name = TextEditingController();
    _register_email = TextEditingController();
    _register_pass = TextEditingController();
    _register_petName = TextEditingController();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _login_email.dispose();
    _login_pass.dispose();
    _register_name.dispose();
    _register_email.dispose();
    _register_pass.dispose();
    _register_petName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // String snackBar_content = "";

    // SnackBar snackBar = SnackBar(
    //   content: Text(snackBar_content),
    // );
    // String _login_email_text = "";
    // String _login_pass_text = "";

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "PetCura",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        bottom: TabBar(
          indicatorColor: Colors.black,
          labelColor: Colors.black,
          controller: _tabController,
          tabs: myTabs,
        ),
      ),
      body: TabBarView(
          controller: _tabController,
          children: myTabs.map((Tab tab) {
            // final String label = tab.text!.toLowerCase();
            return (tab.text!.toLowerCase() == 'register')
                ? Container(
                    padding: EdgeInsets.fromLTRB(40, 20, 20, 0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Register\nwith\nPetCura",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(fontSize: 37),
                                  ),
                                  Image.asset("assets/Dog Sit.png"),
                                ],
                              ),
                              const SizedBox(height: 15),
                              const Text(
                                "Your Name :",
                                style: TextStyle(fontSize: 20),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                decoration: ShadowUnderTextField(),
                                child: TextFormField(
                                  controller: _register_name,
                                  decoration: InputDecoration(
                                    hintText: "Enter your name",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 16),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              const Text(
                                "Email :",
                                style: TextStyle(fontSize: 20),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                decoration: ShadowUnderTextField(),
                                child: TextFormField(
                                  controller: _register_email,
                                  decoration: InputDecoration(
                                    hintText: "Enter your email",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 16),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              const Text(
                                "Password :",
                                style: TextStyle(fontSize: 20),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                decoration: ShadowUnderTextField(),
                                child: TextFormField(
                                  controller: _register_pass,
                                  decoration: InputDecoration(
                                    hintText: "Create a Password",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 16),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              const Text(
                                "Pet's Name :",
                                style: TextStyle(fontSize: 20),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: TextFormField(
                                  controller: _register_petName,
                                  decoration: InputDecoration(
                                    hintText: "Enter your pet's name",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 16),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 70),
                          Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              MaterialButton(
                                // style: ElevatedButton.styleFrom(
                                //   shape: RoundedRectangleBorder(
                                //     borderRadius: BorderRadius.circular(16.0),
                                //   ),
                                // ),
                                minWidth:
                                    MediaQuery.of(context).size.width * 0.8,
                                color: Color.fromARGB(255, 189, 189, 189),
                                onPressed: () async {
                                  SnackBar snackBar;
                                  if (_register_name.text == "") {
                                    snackBar = const SnackBar(
                                      content: Text("Please enter your name"),
                                    );
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                    return;
                                  } else if ((_register_email.text == "" ||
                                          _register_email.text.length < 11) ||
                                      !_register_email.text.contains(
                                          '@gmail.com',
                                          _register_email.text.length - 10)) {
                                    snackBar = const SnackBar(
                                      content: Text("Please enter valid Email"),
                                    );
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                    return;
                                  } else if (_register_pass.text == "") {
                                    snackBar = const SnackBar(
                                      content:
                                          Text("Please enter valid Password"),
                                    );
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                    return;
                                  } else if (_register_petName.text == "") {
                                    snackBar = const SnackBar(
                                      content:
                                          Text("Please enter your pet's name"),
                                    );
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                    return;
                                  } else if (_register_pass.text.length < 6) {
                                    snackBar = const SnackBar(
                                      content:
                                          Text("Please enter strong password"),
                                    );
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                    return;
                                  }

                                  // _login_email = _register_email;
                                  // _login_pass = _register_pass;
                                  // _tabController.animateTo(
                                  //     (_tabController.index + 1) % 2);

                                  try {
                                    UserCredential userCredential =
                                        await FirebaseAuth.instance
                                            .createUserWithEmailAndPassword(
                                                email: _register_email.text,
                                                password: _register_pass.text);
                                    await FirebaseAuth.instance.currentUser!
                                        .updateDisplayName(_register_name.text);
                                    await FirebaseFirestore.instance
                                        .collection('users')
                                        .doc(userCredential.user!.uid)
                                        .set({'name': _register_name.text});

                                    // ignore: use_build_context_synchronously
                                    Navigator.pushReplacementNamed(
                                        context, HomePage().getRoute());
                                  } on FirebaseAuthException catch (e) {
                                    if (e.code == 'weak-password') {
                                      print(
                                          'The password provided is too weak.');
                                    } else if (e.code ==
                                        'email-already-in-use') {
                                      print(
                                          'The account already exists for that email.');
                                    }
                                  } catch (e) {
                                    print(e);
                                  }
                                },
                                child: const Text(
                                  'Register',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              // Image.asset("assets/Rabbit_peeking.png"),
                            ],
                          ),
                        ],
                      ),
                    ))
//********************* LOGIN ***************************//
                : Container(
                    padding: EdgeInsets.fromLTRB(40, 20, 20, 0),
                    child: SingleChildScrollView(
                        child: Column(children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Login\nwith\nPetCura",
                                textAlign: TextAlign.start,
                                style: TextStyle(fontSize: 37),
                              ),
                              Image.asset("assets/Dog Sit.png"),
                            ],
                          ),
                          const SizedBox(height: 15),
                          // const Text(
                          //   "Your Name :",
                          //   style: TextStyle(fontSize: 20),
                          // ),
                          // const SizedBox(height: 10),
                          // Container(
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(0),
                          //     boxShadow: [
                          //       BoxShadow(
                          //         color: Colors.grey.withOpacity(0.5),
                          //         spreadRadius: 2,
                          //         blurRadius: 5,
                          //         offset: Offset(0, 3),
                          //       ),
                          //     ],
                          //   ),
                          //   child: const TextField(
                          //     decoration: InputDecoration(
                          //         border: InputBorder.none,
                          //         hintText: "Enter your name",
                          //         filled: true,
                          //         fillColor:
                          //             Color.fromARGB(255, 255, 255, 255)),
                          //   ),
                          // ),
                          // const SizedBox(height: 15),
                          const Text(
                            "Email :",
                            style: TextStyle(fontSize: 20),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            decoration: ShadowUnderTextField(),
                            child: TextFormField(
                              // onChanged: ((value) => _login_email.text = value),
                              controller: _login_email,
                              decoration: InputDecoration(
                                hintText: "Enter your email",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 16),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            "Password :",
                            style: TextStyle(fontSize: 20),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            decoration: ShadowUnderTextField(),
                            child: TextFormField(
                              // onChanged: (value) => _login_pass_text = value,
                              controller: _login_pass,
                              decoration: InputDecoration(
                                hintText: "Enter password",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 16),
                              ),
                            ),
                          ),
                          // const SizedBox(height: 15),
                          //     const Text(
                          //       "Pet's Name :",
                          //       style: TextStyle(fontSize: 20),
                          //     ),
                          //     const SizedBox(height: 10),
                          //     Container(
                          //       decoration: BoxDecoration(
                          //         borderRadius:
                          //             BorderRadius.all(Radius.circular(10)),
                          //         boxShadow: [
                          //           BoxShadow(
                          //             color: Colors.grey.withOpacity(0.5),
                          //             spreadRadius: 2,
                          //             blurRadius: 5,
                          //             offset: Offset(0, 3),
                          //           ),
                          //         ],
                          //       ),
                          //       child: const TextField(
                          //         decoration: InputDecoration(
                          //             border: InputBorder.none,
                          //             hintText: "Enter your pet's name",
                          //             filled: true,
                          //             fillColor:
                          //                 Color.fromARGB(255, 255, 255, 255)),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          const SizedBox(height: 70),
                          Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              MaterialButton(
                                // style: ElevatedButton.styleFrom(
                                //   shape: RoundedRectangleBorder(
                                //     borderRadius: BorderRadius.circular(16.0),
                                //   ),
                                // ),
                                minWidth:
                                    MediaQuery.of(context).size.width * 0.8,
                                color: Color.fromARGB(255, 189, 189, 189),
                                onPressed: () async {
                                  SnackBar snackBar;
                                  // if (check)
                                  if ((_login_email.text == "" ||
                                          _login_email.text.length < 11) ||
                                      !_login_email.text.contains('@gmail.com',
                                          _login_email.text.length - 10)) {
                                    snackBar = const SnackBar(
                                      content: Text("Please enter valid Email"),
                                    );
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                    return;
                                  } else if (_login_pass.text == "") {
                                    snackBar = const SnackBar(
                                      content:
                                          Text("Please enter valid Password"),
                                    );
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                    return;
                                  }
                                  // else {
                                  //   snackBar = const SnackBar(
                                  //     content: Text(
                                  //         "Email or Password is incorrect"),
                                  //   );
                                  //   ScaffoldMessenger.of(context)
                                  //       .showSnackBar(snackBar);
                                  //   return;
                                  // }

                                  try {
                                    UserCredential userCredential =
                                        await FirebaseAuth.instance
                                            .signInWithEmailAndPassword(
                                                email: _login_email.text,
                                                password: _login_pass.text);
                                    // ignore: use_build_context_synchronously
                                    Navigator.pushReplacementNamed(
                                        context, HomePage().getRoute());
                                  } on FirebaseAuthException catch (e) {
                                    if (e.code == 'user-not-found') {
                                      // print('No user found for that email.');
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text(
                                                  "No user found for that email.")));
                                    } else if (e.code == 'wrong-password') {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text(
                                                  "Wrong password provided for that user.")));
                                    }
                                  }
                                },
                                child: const Text(
                                  'Login',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              // Image.asset("assets/Rabbit_peeking.png"),
                            ],
                          ),

                          const SizedBox(height: 30),
                          TextButton(
                              onPressed: () => _tabController
                                  .animateTo((_tabController.index + 1) % 2),
                              child: const Text("Register Instead?"))
                        ],
                      ),
                    ])));
          }).toList()),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _tabController
            .animateTo((_tabController.index + 1) % 2), // Switch tabs
        child: const Icon(Icons.swap_horiz),
      ),
    );
  }

  Container TextInput(String hint) {
    // TextInput();

    return Container(
      decoration: ShadowUnderTextField(),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        ),
      ),
    );
  }

  BoxDecoration ShadowUnderTextField() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(8.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 5,
          offset: Offset(0, 3),
        ),
      ],
    );
  }
}
