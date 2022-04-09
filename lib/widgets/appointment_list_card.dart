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
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: Colors.purpleAccent.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 3),
            )
          ],
        ),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.all(4),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        DateFormat('MMM')
                            .format(appointment.time)
                            .toUpperCase(),
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        DateFormat('dd').format(appointment.time),
                        style: const TextStyle(
                            fontSize: 36,
                            height: 1.2,
                            fontWeight: FontWeight.bold,
                            color: Colors.purpleAccent),
                      ),
                      Text(DateFormat.Hm().format(appointment.time),
                          style: const TextStyle(fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
              ),
              const VerticalDivider(
                thickness: 1.0,
                color: Colors.grey,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 30,
                            backgroundImage:
                                NetworkImage(appointment.doctor.imageUrl),
                          ),
                          Container(
                            margin: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  appointment.doctor.doctorName,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.black),
                                ),
                                Text(appointment.doctor.doctorProffesion),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                          Text("At Dentmind Dental Care ${appointment.branch}"),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
