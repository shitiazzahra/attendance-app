import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraControllerComponent {
  List <CameraDescription>? cameras;
  CameraController? controller;
  bool isBusy = false;

  Future<void> loadCamera() async {
    cameras = await availableCameras();
    if (cameras != null && cameras!.isNotEmpty) {
      // ![0] harus kamera belakang
      controller = CameraController(cameras![0], ResolutionPreset.high); // resolusi nya tinggi/nyamain data/biar capturenya bagus
      await controller!.initialize();
    }
  }

  Widget buildCameraPreview() {
    if (controller == null || !controller!.value.isInitialized) {
      //aksi apabila condition bernilai negatif
      return const Center(child: CircularProgressIndicator()); 
    }
    // ini jika positif
    return CameraPreview(controller!);
  }
}