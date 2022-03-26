import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dentmind_dental_centre/global_constants.dart';
import 'package:dentmind_dental_centre/models/client_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class FirebaseStorageMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference clients =
      FirebaseFirestore.instance.collection(clientTableName);

  Future addClient(Client client) async {
    clients.doc(client.uid).set(client.toMap());
  }

  Future<Client> getClient(BuildContext context) async {
    User? user = await getuseruid(context);
    DocumentSnapshot snapshot = await clients.doc(user!.uid).get();

    Client client = Client.fromDocumentSnapshot(snapshot);

    print(client.firstName);

    return client;
  }

  Future<User?> getuseruid(BuildContext context) async {
    return Provider.of<User?>(context, listen: false);
  }
}
