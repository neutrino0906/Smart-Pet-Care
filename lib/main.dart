import 'package:flutter/material.dart';
// import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';
import 'package:test_tflite/ChatScreen.dart';
import 'package:test_tflite/DetectionScreen.dart';
import 'package:test_tflite/ProdScreen.dart';
import 'firebase_options.dart';
import 'package:test_tflite/RegScreen.dart';
import 'package:test_tflite/SingleProdScreen.dart';
import 'package:test_tflite/VeteScreen.dart';
import 'package:tflite_v2/tflite_v2.dart';
import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

late List<CameraDescription> cameras;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
      );
  cameras = await availableCameras();
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        HomePage().getRoute(): (context) => HomePage(),
        ProdScreen().getRoute(): (context) => ProdScreen(),
        const DetectionScreen().getRoute(): (context) =>
            const DetectionScreen(),
        SingleProdScreen().getRoute(): (context) => SingleProdScreen(),
        VeteScreen().getRoute(): (context) => VeteScreen(),
        const ChatScreen().getRoute(): (context) => const ChatScreen(),
        BreedDetectionScreen().getRoute(): (context) => BreedDetectionScreen(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: RegScreen(),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomePage();
          } else {
            return const RegScreen();
          }
        },
      ),
    );
  }
}

class sideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 47, 147, 201),
              // image: DecorationImage(
              //     fit: BoxFit.fill,
              //     image: AssetImage('assets/images/cover.jpg'),
              //     )
            ),
            child: Text(
              'Side menu',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Log Out'),
            onTap: () => {
              Navigator.of(context).pop(),
              Navigator.of(context).pushReplacementNamed('/'),
            },
          ),
          ListTile(
            leading: const Icon(Icons.verified_user),
            title: const Text('Detection'),
            onTap: () => {
              Navigator.of(context).pop(),
              Navigator.of(context)
                  .pushNamed(const DetectionScreen().getRoute()),
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Consultancy'),
            onTap: () => {
              Navigator.of(context).pop(),
              Navigator.of(context).pushNamed(VeteScreen().getRoute()),
            },
          ),
          ListTile(
            leading: const Icon(Icons.border_color),
            title: const Text('Scheduler'),
            onTap: () => {
              Navigator.of(context).pop(),
              // Navigator.of(context).pushNamed(CameraScreen().routename()),
            },
          ),
          ListTile(
            leading: const Icon(Icons.shop),
            title: const Text('Store'),
            onTap: () => {
              Navigator.of(context).pop(),
              Navigator.of(context).pushNamed(ProdScreen().getRoute()),
            },
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  HomePage({super.key});

  String getRoute() => "HomePage";
  String name = "Prashant";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: sideDrawer(),
        appBar: AppBar(
            toolbarHeight: 80,
            iconTheme: const IconThemeData(color: Colors.black),
            centerTitle: true,
            // title: Text("PET CARE"),
            // leading: const Icon(
            //   Icons.menu,
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(44.0),
                  child: Text(
                    "Welcome,\n${FirebaseAuth.instance.currentUser!.displayName}",
                    style: const TextStyle(
                        fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context)
                          .pushNamed(const BreedDetectionScreen().getRoute()),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            "assets/Brown_Rectangle.png",
                            scale: 0.9,
                          ),
                          Stack(
                            children: [
                              // Implement the stroke
                              Text(
                                'BEHAVIOUR\nDETECTION',
                                style: TextStyle(
                                  fontSize: 15,
                                  // letterSpacing: 5,
                                  fontWeight: FontWeight.bold,
                                  foreground: Paint()
                                    ..style = PaintingStyle.stroke
                                    ..strokeWidth = 3
                                    ..color =
                                        const Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                              const Text(
                                "BEHAVIOUR\nDETECTION",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context)
                          .pushNamed(VeteScreen().getRoute()),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            "assets/Purple_Rectangle.png",
                            scale: 0.9,
                          ),
                          const Text(
                            "VETERINARIAN\'S\nCONSULTANCY",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () => Null,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            "assets/Blue_Rectangle.png",
                            scale: 0.9,
                          ),
                          const Text(
                            "PET\nSCHEDULER",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context)
                          .pushNamed(ProdScreen().getRoute()),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            "assets/Green_Rectangle.png",
                            scale: 0.9,
                          ),
                          const Text(
                            "PET\nSTORE",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}

class BreedDetectionScreen extends StatefulWidget {
  const BreedDetectionScreen({super.key});

  String getRoute() => "BreedDetectionScreen";

  @override
  State<BreedDetectionScreen> createState() => _BreedDetectionScreenState();
}

class _BreedDetectionScreenState extends State<BreedDetectionScreen> {
  bool isWorking = false;
  String result = '';
  CameraController? cameraController;
  CameraImage? cameraImage;

  initCamera() {
    cameraController = CameraController(cameras[0], ResolutionPreset.medium);
    cameraController!.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {
        cameraController!.startImageStream((image) => {
              if (!isWorking)
                {
                  isWorking = true,
                  cameraImage = image,
                  runModelsOnStreamFrames(),
                }
            });
      });
    });
  }

  loadModel() async {
    await Tflite.loadModel(
        model: "assets/model.tflite", labels: "assets/labels.txt");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadModel();
  }

  runModelsOnStreamFrames() async {
    if (cameraImage != null) {
      var recognition = await Tflite.runModelOnFrame(
        bytesList: cameraImage!.planes.map((plane) {
          return plane.bytes;
        }).toList(),
        imageHeight: cameraImage!.height,
        imageWidth: cameraImage!.width,
        imageMean: 127.5,
        imageStd: 127.5,
        rotation: 90,
        numResults: 1,
        threshold: 0.1,
        asynch: true,
      );
      result = '';
      recognition!.forEach((response) {
        result += response["label"] +
            " " +
            (response["confidence"] as double).toStringAsFixed(2) +
            "\n\n";
      });
      setState(() {
        result;
      });
      isWorking = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Breed Recognizer"),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/back.jpg'),
          fit: BoxFit.fill,
        )),
        child: Column(
          children: [
            Stack(
              children: [
                Center(
                  child: TextButton(
                    onPressed: () {
                      initCamera();
                    },
                    child: Container(
                        margin: const EdgeInsets.only(top: 35),
                        height: 500,
                        width: 360,
                        child: cameraImage == null
                            ? Container(
                                height: 270,
                                width: 360,
                                child: const Icon(
                                  Icons.photo_camera_front,
                                  size: 40,
                                ),
                              )
                            : AspectRatio(
                                aspectRatio:
                                    cameraController!.value.aspectRatio,
                                child: CameraPreview(cameraController!),
                              )),
                  ),
                )
              ],
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 55),
                child: SingleChildScrollView(
                  child: Text(
                    result,
                    style: const TextStyle(
                        backgroundColor: Colors.white,
                        fontSize: 25,
                        color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


// Scaffold(
//     appBar: AppBar(
//       title: const Text("Breed Recognizer"),
//     ),
//     body: Container(
//       decoration: const BoxDecoration(
//           image: DecorationImage(
//         image: AssetImage('assets/back.jpg'),
//         fit: BoxFit.fill,
//       )),
//       child: Column(
//         children: [
//           Stack(
//             children: [
//               Center(
//                 child: TextButton(
//                   onPressed: () {
//                     initCamera();
//                   },
//                   child: Container(
//                       margin: const EdgeInsets.only(top: 35),
//                       height: 500,
//                       width: 360,
//                       child: cameraImage == null
//                           ? Container(
//                               height: 270,
//                               width: 360,
//                               child: const Icon(
//                                 Icons.photo_camera_front,
//                                 size: 40,
//                               ),
//                             )
//                           : AspectRatio(
//                               aspectRatio:
//                                   cameraController!.value.aspectRatio,
//                               child: CameraPreview(cameraController!),
//                             )),
//                 ),
//               )
//             ],
//           ),
//           Center(
//             child: Container(
//               margin: const EdgeInsets.only(top: 55),
//               child: SingleChildScrollView(
//                 child: Text(
//                   result,
//                   style: const TextStyle(
//                       backgroundColor: Colors.white,
//                       fontSize: 25,
//                       color: Colors.black),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     ),
//   );
