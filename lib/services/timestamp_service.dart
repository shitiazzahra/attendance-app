import 'package:intl/intl.dart'; // ngurusin timestamp

// function untuk data waktu secara real time
void setDateTime(Function(String, String, String) onDateTimeSet) {
    var  dateNow = DateTime.now();
    var  dateFormat = DateFormat('dd mm yyyy');
    var  dateTime = DateFormat('hh:mm:ss');

    String date = dateFormat.format(dateNow);
    String time = dateTime.format(dateNow);
    String currentDate = '$date | $time';

    onDateTimeSet(date, time, currentDate);
}

// untuk status telat atau ngga nya
void setAttendanceStatus(Function(String) onStatusSet) {
    var dateNow = DateTime.now();
    // int.parse ubah int jadi string
    var hour = int.parse(DateFormat('hh').format(dateNow));
    var minute = int.parse(DateFormat('mm').format(dateNow));

    String attendanceStatus;
    if (hour <= 7 || (hour == 7 && minute == 0)) {
        attendanceStatus = 'Attend';
    } else if (hour > 7 || (hour == 7 && minute >= 01)) {
        attendanceStatus = 'Late';
    } else {
        attendanceStatus = 'Absent';
    }

    onStatusSet(attendanceStatus);
}