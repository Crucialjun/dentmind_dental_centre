import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dentmind_dental_centre/global_constants.dart';
import 'package:dentmind_dental_centre/models/appointment_model.dart';
import 'package:dentmind_dental_centre/models/client_model.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class FirebaseStorageMethods extends ChangeNotifier {
  CollectionReference clients =
      FirebaseFirestore.instance.collection(clientTableName);
  CollectionReference appointments =
      FirebaseFirestore.instance.collection(appointmentsTableName);

  Future<Client?> get client => getClient("");

  Future addClient(Client client) async {
    clients.doc(client.uid).set(client.toMap());
  }

  Future<Client?> getClient(String uid) async {
    try {
      DocumentSnapshot snap = await clients.doc(uid).get();
      notifyListeners();
      return Client.fromDocumentSnapshot(snap);
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future addAppointment(Appointment appointment, String uid) async {
    var appointmentId = const Uuid().v4();
    try {
      await appointments.doc(appointmentId).set(appointment.toMap());
      await clients.doc(uid).update({
        'appointments': FieldValue.arrayUnion([appointmentId])
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<Appointment?> getAppointment(String id) async {
    try {
      DocumentSnapshot snap = await appointments.doc(id).get();
      return Appointment.fromDocumentSnapshot(snap);
    } catch (e) {}
    return null;
  }
}
