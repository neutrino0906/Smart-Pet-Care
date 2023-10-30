import 'dart:io';
// import 'dart:ui';
import '../main.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class DetectionScreen extends StatefulWidget {
  const DetectionScreen({super.key});

  String getRoute() => "DetectionScreen";

  @override
  State<DetectionScreen> createState() => _DetectionScreenState();
}

class _DetectionScreenState extends State<DetectionScreen> {
  late CameraController? _cont;

  @override
  void initState() {
    super.initState();
    _cont = CameraController(cameras[0], ResolutionPreset.max);
    _cont!.initialize().then((_) {
      if (!mounted) return;
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) print("Error!");
    });
  }

  FilePickerResult? result;
  File? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.8,
            color: Colors.black,
            child: CameraPreview(_cont!),
            // child: Text("Hiii"),
          ),
          const SizedBox(
            height: 15,
          ),
          MaterialButton(
            onPressed: () {},
            color: Colors.grey,
            shape: RoundedRectangleBorder(),
            child: const ListTile(
              title: Text(
                "Capture",
                style: TextStyle(fontSize: 20),
              ),
              leading: Icon(Icons.camera_alt),
            ),
          ),
          TextButton(
              onPressed: () async => {
                    result = await FilePicker.platform.pickFiles(),
                    if (result != null)
                      {file = File(result!.files.single.path!)}
                  },
              child: const Text("Choose File"))
        ],
      ),
    );
  }
}
