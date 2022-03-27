import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dentmind_dental_centre/global_constants.dart';
import 'package:dentmind_dental_centre/models/client_model.dart';

class FirebaseStorageMethods {
  CollectionReference clients =
      FirebaseFirestore.instance.collection(clientTableName);

  Future addClient(Client client) async {
    clients.doc(client.uid).set(client.toMap());
  }

  Future<Client?> getClient(String uid) async {
    try {
      DocumentSnapshot snap = await clients.doc(uid).get();

      return Client.fromDocumentSnapshot(snap);
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
