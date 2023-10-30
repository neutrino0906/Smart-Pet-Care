// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:tflite_v2/tflite_v2.dart';
// // import 'package:tflite_flutter/tflite_flutter.dart';
// import './main.dart';

// class BreedDetection extends StatefulWidget {
//   const BreedDetection({super.key});

//   String getRoute() => "BreedDetectionScreen";

//   @override
//   State<BreedDetection> createState() => _BreedDetectionState();
// }

// class _BreedDetectionState extends State<BreedDetection> {
// // final interpreter = await tfl.Interpreter.fromAsset('assets/your_model.tflite');

//   bool isWorking = false;
//   String result = '';
//   CameraController? cameraController;
//   CameraImage? cameraImage;

//   // initCamera() {
//   //   cameraController = CameraController(cameras[0], ResolutionPreset.max);
//   //   cameraController!.initialize().then((value) {
//   //     if (!mounted) {
//   //       return;
//   //     }

//   //     setState(() {
//   //       cameraController!.startImageStream((image) => {
//   //             if (!isWorking)
//   //               {
//   //                 isWorking = true,
//   //                 cameraImage = image,
//   //                 runModelsOnStreamFrames(),
//   //               }
//   //           });
//   //     });
//   //   });
//   // }

//   // loadModel() async {
//   //   await Tflite.loadModel(
//   //       model: "assets/model.tflite", labels: "assets/labels.txt");
//   //   // await Tflite.loadModel(
//   //   //     model: "assets/model.tflite", labels: "assets/labels.txt");
//   // }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     // loadModel();
//   }

//   // runModelsOnStreamFrames() async {
//   //   if (cameraImage != null) {
//   //     var recognition = await Tflite.runModelOnFrame(
//   //       bytesList: cameraImage!.planes.map((plane) {
//   //         return plane.bytes;
//   //       }).toList(),
//   //       imageHeight: cameraImage!.height,
//   //       imageWidth: cameraImage!.width,
//   //       imageMean: 127.5,
//   //       imageStd: 127.5,
//   //       rotation: 90,
//   //       numResults: 2,
//   //       threshold: 0.1,
//   //       asynch: true,
//   //     );

//   //     result = '';

//   //     recognition!.forEach((response) {
//   //       result += response["label"] +
//   //           " " +
//   //           (response["confidence"] as double).toStringAsFixed(2) +
//   //           "\n\n";
//   //     });
//   //     setState(() {
//   //       result;
//   //     });
//   //     isWorking = false;
//   //   }
//   // }

//   @override
//   void dispose() async {
//     // TODO: implement dispose
//     super.dispose();

//     // await Tflite.close();
//     cameraController?.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Breed Recognizer"),
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//             image: DecorationImage(
//           image: AssetImage('assets/back.jpg'),
//           fit: BoxFit.fill,
//         )),
//         child: Column(
//           children: [
//             Stack(
//               children: [
//                 Center(
//                   child: Container(
//                     height: 320.0,
//                     width: 360.0,
//                     child: Image.asset("assets/frame.jpg"),
//                   ),
//                 ),
//                 Center(
//                   child: TextButton(
//                     onPressed: () {
//                       // initCamera();
//                     },
//                     child: Container(
//                         margin: const EdgeInsets.only(top: 35),
//                         height: 270,
//                         width: 360,
//                         child: cameraImage == null
//                             ? Container(
//                                 height: 270,
//                                 width: 360,
//                                 child: const Icon(
//                                   Icons.photo_camera_front,
//                                   size: 40,
//                                 ),
//                               )
//                             : AspectRatio(
//                                 aspectRatio:
//                                     cameraController!.value.aspectRatio,
//                                 child: CameraPreview(cameraController!),
//                               )),
//                   ),
//                 )
//               ],
//             ),
//             Center(
//               child: Container(
//                 margin: const EdgeInsets.only(top: 55),
//                 child: SingleChildScrollView(
//                   child: Text(
//                     result,
//                     style: const TextStyle(
//                         backgroundColor: Colors.white,
//                         fontSize: 25,
//                         color: Colors.black),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
