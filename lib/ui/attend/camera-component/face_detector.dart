import 'dart:math';
import 'dart:ui';
import 'package:attendance_app/utils/google_mlkit.dart';
import 'package:camera/camera.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

class FaceDetectorComponent {
  final FaceDetector faceDetector = GoogleMlkit.vision.faceDetector(FaceDetectorOptions(
    enableContours: true,
    enableClassification: true,
    enableTracking: true,
    enableLandmarks: true
  ));

  Future<void> detectFaces(XFile image) async {
    final inputImage = InputImage.fromFilePath(image.path);
    final faces = await faceDetector.processImage(inputImage);

    // kalau faces sudah terdeteksi
    for (Face face in faces) {
      // Rect = rectangle 2D
      //bounding dipakai untuk mengambil component dari gambar
      final Rect boundingBox = face.boundingBox;

      // untuk menghandle posisi wajah secara vertical
      final double? verticalPosition = face.headEulerAngleY;

      // untuk handle posisi wajah secara horizontal
      final double? horizontalPosition = face.headEulerAngleZ;

      // perkondisian apabila face landmark sudah aktif, ditandai oleh (mulut/mata/pipi/hidung/telinga)
      final FaceLandmark? leftEar = face.landmarks[FaceLandmarkType.leftEar];
      // kalau tengila kiri terdeteksi akan mengembalikan posisi telinga nya
      if (leftEar != null) {
        final Point<int> leftEarPosition = leftEar.position;
        print("Left Ear Position: $leftEarPosition");
      }

      // perkondisian apabila wajahnya terdeteksi(ditandai dgn bibir tersenyum)
      if (face.smilingProbability != null) {
        final double? smileProbability = face.smilingProbability;
        print("Smile Probability: $smileProbability");
      }

      // perkondisian apabila fitur tracking wajah sudah aktif
      if (face.trackingId != null) {
        final int? trackingId = face.trackingId;
        print("Tracking ID: $trackingId");
      }

    }
  }
}