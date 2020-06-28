import 'package:cloud_firestore/cloud_firestore.dart';
// Own
import 'storage_service.dart';

class StorageServiceFirebase extends StorageService {
  final databaseReference = Firestore.instance;

  @override
  Future<List<Map<String, dynamic>>> getRecords() async {
    var documents =
        await databaseReference.collection("locations").getDocuments();

    var templist = documents.documents;

    var list = templist.map((DocumentSnapshot docSnapshot) {
      return docSnapshot.data;
    }).toList();

    return list;
  }

  @override
  Future<void> saveCounterValue(int value) async {
    // do nothing
  }
}
