// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class DataTime_Widget extends StatefulWidget {


//   @override
//   State<DataTime_Widget> createState() => _DataTime_WidgetState();
// }

// class _DataTime_WidgetState extends State<DataTime_Widget> {
//   DateTime dateTime;

//   @override
//   Widget build(BuildContext context) {
//     return Text(getText());
//   }

//     Future pickDateTime(BuildContext context) async {
//     final date = await pickDate(context);
//     if (date == null) return;

//     final time = await pickTime(context);
//     if (time == null) return;

//     setState(() {
//       dateTime = DateTime(
//         date.year,
//         date.month,
//         date.day,
//         time.hour,
//         time.minute,
//       );
//     });
//   }

//   String getText(){
//     if (dateTime== null) {
//       return 'Select DateTime';
//     }else{
//       return DateFormat('MM/dd/yyyy HH:mm').format(dateTime);
//     }
//   }

//   Future<DateTime> pickDate(BuildContext context) async {
//     final initialDate = DateTime.now();
//     final newDate = await showDatePicker(
//       context: context,
//       initialDate: dateTime ?? initialDate,
//       firstDate: DateTime(DateTime.now().year - 5),
//       lastDate: DateTime(DateTime.now().year + 5),
//     );

//     if (newDate == null) return null;

//     return newDate;
//   }

//  Future<TimeOfDay> pickTime(BuildContext context) async {
//     final initialTime = TimeOfDay(hour: 9, minute: 0);
//     final newTime = await showTimePicker(
//       context: context,
//       initialTime: dateTime != null
//           ? TimeOfDay(hour: dateTime.hour, minute: dateTime.minute)
//           : initialTime,
//     );

//     if (newTime == null) return null;

//     return newTime;
//   }
// }