import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

// ignore: must_be_immutable
class Camera extends StatefulWidget {
  List<CameraDescription> cameras;

  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  CameraController cameraController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cameraController =
        CameraController(widget.cameras[0], ResolutionPreset.high);
    cameraController.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!cameraController.value.isInitialized) {
      return Container();
    }
    return ClipRect(
      child: Container(
        child: Transform.scale(
          scale: cameraController.value.aspectRatio /
              MediaQuery.of(context).size.aspectRatio,
          child: Center(
            child: AspectRatio(
              aspectRatio: cameraController.value.aspectRatio,
              child: CameraPreview(cameraController),
            ),
          ),
        ),
      ),
    );
  }
}
