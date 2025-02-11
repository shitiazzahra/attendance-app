import 'package:attendance_app/services/data_service.dart';
import 'package:attendance_app/ui/history/components/attendance_card.dart';
import 'package:attendance_app/ui/history/components/delete_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AttendanceHistoryScreen extends StatefulWidget {
  const AttendanceHistoryScreen({super.key});

  @override
  State<AttendanceHistoryScreen> createState() => _AttendanceHistoryScreenState();
}

class _AttendanceHistoryScreenState extends State<AttendanceHistoryScreen> {
  final DataService dataService = DataService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Attendance History"),
      ),
      // type data nya dynamic
      // stream builder untuk membungkus widget secara keseluruhan, digunakan untuk menage UI dengan baik
      body: StreamBuilder(
        // menggil data yg kita punya/initialisasi
        // snapshots untuk handle data yg kita ambil, kasih tau UI bahwa siap dipakai
        stream: dataService.dataCollection.snapshots(), 
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          // ini kalau snapshot ga punya data bakal tampilin loading indicator
          if (!snapshot.hasData) {
            return const Center(
              child: Text("No data here!"),
            );
          }
          // ini kalau data nya ada
          final data = snapshot.data!.docs;

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return AttendanceHistoryCard(
                data: data[index].data() as Map<String, dynamic>,
                onDelete: () {
                  showDialog(
                    context: context,
                    builder: (context) => DeleteDialog(
                      //menjadikan index sebagai id dari data yg ada di db
                      documentId: data[index].id, 
                      dataCollection: dataService.dataCollection,
                      // untuk memperbarui state ketika terjadi penghapusan data dari db
                      onConfirm: () {
                        setState(() {
                          dataService.deleteData(data[index].id);
                          Navigator.pop(context);
                        });
                      },
                    )
                  );
                }
              );
            },
          );
        },
      ),
    );
  }
}