import 'package:attendance_app/ui/attend/attendance_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // makesure mau kembali/tidak takutnya ada data yg ga kesimpen
    return PopScope(
      canPop: false,
      // ignore: deprecated_member_use
      onPopInvoked: (didPop) {
        if (didPop) {
          return;
        }
        _onWillPop(context);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildMenuItem(
                  context,
                  imangePath: '/assets/images/ic_attend.png',
                  label: 'Attendance Report', 
                  destination: const AttendanceScreen(),
                  ),
                const SizedBox(height: 40),
                _buildMenuItem(
                  context,
                  imangePath: '/assets/images/ic_permission.png',
                  label: 'Permission Report', 
                  destination: const AttendanceScreen(),
                  ),
                  const SizedBox(height: 40),
                  _buildMenuItem(
                  context,
                  imangePath: '/assets/images/ic_attendance_history.png',
                  label: 'History Report', 
                  destination: const AttendanceScreen(),
                  ),
              ],
            )
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
      required String imangePath, 
      required String label,
      // pake widget karena ini pendefinisian untuk ngarahin mau kemana nya
      required Widget destination
    }) {
    return Container(
                margin: const EdgeInsets.all(10),
                child: Expanded(
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => destination));
                    },
                    child: Column(
                      children: [
                        Image(
                          image: AssetImage(imangePath),
                          height: 100,
                          width: 100,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          label,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold
                          ),
                        )
                      ],
                    ),
                  )
                ),
              );
  }

  Future<bool> _onWillPop(BuildContext context) async{
    // showDialog itu harus hasilin value itu bisa yes/no
    return (await showDialog(
      // ini biar gabisa hilang pop up nya
      barrierDismissible: false,
      context: context,
      builder: (context) =>
      // ini kondisi true yg nampilin yes or no nya
      AlertDialog(
        title: const Text(
          "Information",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
        content: const Text(
          "Do you want to Exit?",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16
          ),
        ),
        actions: [
          TextButton(
            // balik ke screen sebelum nya dan menghilangkan alert
            onPressed: () => Navigator.of(context).pop(false), 
            child: const Text(
              "No",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14
                ),
              )
            ),
            TextButton(
              // SystemNavigator untuk keluar dari App
              onPressed: () => SystemNavigator.pop(), 
              child: const Text(
                "Yes",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14
                )
              )
              )
          ],
        )
      )
      // ini kondisi false 
      // ini adalah default value ketika semua kode yg ada di
      // block Alert tidak tereksekusi semua
    ) ?? false;
  }
}