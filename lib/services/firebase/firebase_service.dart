import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  // FirebaseFirestore firestore = FirebaseFirestore.instance;
  // Firestore firestore = Firestore.instance;
  static final FirebaseService _instance = FirebaseService._constructor();

  factory FirebaseService() {
    return _instance;
  }
  FirebaseService._constructor();

  Future get({String collection, String documentId}) async {
    if (collection != null) {
      CollectionReference collectionReference =
          FirebaseFirestore.instance.collection(collection);

      if (documentId != null) {
        var snapshot = await collectionReference.doc(documentId).get();
        var data = snapshot.data;
        if (data != null) {
          return data;
        }
      } else {
        // getting all documents within a collection
        var snapshot = await collectionReference.get();
        List documents = List();
        snapshot.docs.forEach((doc) {
          dynamic documentData = doc.data;
          documentData['id'] = doc.id;
          documents.add(documentData);
        });

        return documents;
      }
    }
  }

  Future post({String collection, dynamic data}) async {
    print("firebase post");
    if (collection != null && data != null) {
      return await FirebaseFirestore.instance
          .collection(collection)
          .doc()
          .set(data);
    }
  }

  Future patch({String collection, documentId, dynamic data}) async {
    if (collection != null && data != null) {
      return await FirebaseFirestore.instance
          .collection(collection)
          .doc(documentId)
          .update(data);
    }
  }

  Future delete({String collection, documentId}) async {
    if (collection != null && documentId != null) {
      return await FirebaseFirestore.instance
          .collection(collection)
          .doc(documentId)
          .delete();
    }
  }
}
