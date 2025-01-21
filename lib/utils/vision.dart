import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

class Vision {
  // untuk membuat const nya private biar ga sembarangan di pakai
  // soal nya buat pendetaksian wajah nanti nya
  Vision._();

  static final Vision instance = Vision._();

  FaceDetector faceDetector([FaceDetectorOptions? option]) {
    return FaceDetector(options: option ?? FaceDetectorOptions());
  }
}