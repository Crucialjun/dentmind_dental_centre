import 'package:dentmind_dental_centre/firebase/firebase_storage_methods.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/appointment_model.dart';
import '../models/client_model.dart';

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({Key? key}) : super(key: key);

  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  List appointments = [];
  List appointmentsids = [];

  @override
  Widget build(BuildContext context) {
    appointmentsids = context.watch<Client?>()!.appointments;
    return FutureBuilder(
      future: loadAppointments(appointmentsids),
      initialData: null,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.data == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          itemCount: ((snapshot.data) as List<Appointment>).length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
                title: Text(
              ((snapshot.data[0]) as Appointment).clientuid,
            ));
          },
        );
      },
    );
  }

  Future<List<Appointment>> loadAppointments(List appointmentsids) async {
    List<Appointment> appointmentsList = [];
    for (var id in appointmentsids) {
      Appointment? appointment =
          await FirebaseStorageMethods().getAppointment(id);
      print(appointment.toString());
      appointmentsList.add(appointment!);
    }

    return appointmentsList;
  }
}
