import 'package:dentmind_dental_centre/models/appointment_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../app_colors.dart';

class AppointmentListCard extends StatelessWidget {
  const AppointmentListCard({Key? key, required this.appointment})
      : super(key: key);

  final Appointment appointment;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: primaryAppColor.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 3),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Column(
                children: [
                  Text(DateFormat('EE').format(appointment.time)),
                  Text(appointment.time.day.toString()),
                  Text("${appointment.time.hour} : ${appointment.time.minute}"),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      const CircleAvatar(),
                      Column(
                        children: const [
                          Text("Doctors Name"),
                          Text("Proffesion"),
                        ],
                      )
                    ],
                  ),
                  const Text("Location")
                ],
              )
            ],
          ),
        ));
  }
}
