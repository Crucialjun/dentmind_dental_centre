import 'package:dentmind_dental_centre/models/appointment_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppointmentListCard extends StatelessWidget {
  const AppointmentListCard({Key? key, required this.appointment})
      : super(key: key);

  final Appointment appointment;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: [
        Column(
          children: [
            Text(DateFormat('EE').format(appointment.time)),
            Text(appointment.time.day.toString()),
            Text("${appointment.time.hour} : ${appointment.time.minute}"),
          ],
        ),
      ],
    ));
  }
}
