import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import 'package:firebase_storage/firebase_storage.dart';

class RocksFoundCRUD {
  final CollectionReference rocksFoundCollection =
      FirebaseFirestore.instance.collection('rocks_found');

  Future<void> addRockFoundWithLocation(
      String uid,
      String rockClassification,
      String rockImageUrl,
      double lattitude,
      double longitude,
      DateTime dateTime) async {
    try {
      await rocksFoundCollection.doc().set({
        'UID': uid,
        'ROCK_CLASSIFICATION': rockClassification,
        'ROCK_IMAGE_URL': rockImageUrl,
        'LATTITUDE': lattitude,
        'LONGITUDE': longitude,
        'CAN_BE_VIEWED': true,
        'VIEWABLE': true,
        'DATETIME': dateTime,
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> addRockFoundWithOutLocation(String uid,
      String rockClassification, String rockImageUrl, DateTime dateTime) async {
    try {
      await rocksFoundCollection.doc().set({
        'UID': uid,
        'ROCK_CLASSIFICATION': rockClassification,
        'ROCK_IMAGE_URL': rockImageUrl,
        'CAN_BE_VIEWED': false,
        'VIEWABLE': false,
        'DATETIME': dateTime,
      });
    } catch (e) {
      print(e);
    }
  }

  Future<List<Map<String, dynamic>>> getRocksFound() async {
    List<Map<String, dynamic>> rocksFound = [];
    try {
      QuerySnapshot snapshot = await rocksFoundCollection.get();
      rocksFound = snapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    } catch (e) {
      print(e);
    }
    return rocksFound;
  }


  Future<List<Map<String, dynamic>>> getRocksFoundForUID(String uid) async {
  List<Map<String, dynamic>> rocksFound = [];
  try {
    QuerySnapshot snapshot =
        await rocksFoundCollection.where('UID', isEqualTo: uid).get();
    rocksFound = snapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return {
        ...data,
        'ID': doc.id,
      };
    }).toList();
  } catch (e) {
    print(e);
  }
  return rocksFound;
}
   

  Future<void> updateRockFound(String documentId, String uid,
      String rockClassification, String rockImageUrl, bool viewable) async {
    try {
      await rocksFoundCollection.doc(documentId).update({
        'UID': uid,
        'ROCK_CLASSIFICATION': rockClassification,
        'ROCK_IMAGE_URL': rockImageUrl,
        'VIEWABLE': viewable,
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> hideRockFound(String documentId) async {
    try {
      await rocksFoundCollection.doc(documentId).update({
        'VIEWABLE': false,
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> showRockFound(String documentId) async {
    try {
      await rocksFoundCollection.doc(documentId).update({
        'VIEWABLE': true,
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteRockFound(String documentId) async {
    try {
      await rocksFoundCollection.doc(documentId).delete();
    } catch (e) {
      print(e);
    }
  }

  Future<String> uploadImageToStorage(File imageFile) async {
    String imageId = Uuid().v4();
    Reference storageReference =
        FirebaseStorage.instance.ref().child('images/$imageId.jpg');

    try {
      UploadTask uploadTask = storageReference.putFile(imageFile);
      TaskSnapshot storageSnapshot = await uploadTask.whenComplete(() {});
      String imageUrl = await storageSnapshot.ref.getDownloadURL();
      return imageUrl;
    } catch (e) {
      print(e);
      return '';
    }
  }

  Future<void> updateRockImageUrl(String rockId, String imageUrl) async {
    try {
      await FirebaseFirestore.instance
          .collection('rocks_found')
          .doc(rockId)
          .update({'ROCK_IMAGE_URL': imageUrl});
      print('ROCK_IMAGE_URL updated successfully');
    } catch (e) {
      print(e);
    }
  }

  Future<bool> isUIDPresent(String uid) async {
    try {
      QuerySnapshot snapshot =
          await rocksFoundCollection.where('UID', isEqualTo: uid).get();
      return snapshot.docs.isNotEmpty;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<DateTime?> getLatestTimestampForUID(String uid) async {
    try {
      QuerySnapshot snapshot = await rocksFoundCollection
          .where('UID', isEqualTo: uid)
          .orderBy('DATETIME', descending: true)
          .limit(1)
          .get();
      if (snapshot.docs.isNotEmpty) {
        Map<String, dynamic> data =
            snapshot.docs.first.data() as Map<String, dynamic>;
        DateTime timestamp = data['DATETIME'].toDate();
        return timestamp;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<Map<String, int>> getItemCountByClassificationForUID(String uid) async {
    try {
      QuerySnapshot snapshot = await rocksFoundCollection
          .where('UID', isEqualTo: uid)
          .get();
      if (snapshot.docs.isNotEmpty) {
        Map<String, int> itemCounts = {};
        for (var doc in snapshot.docs) {
          Map<String, dynamic> data =
              doc.data() as Map<String, dynamic>;
          String classification = data['ROCK_CLASSIFICATION'];
          itemCounts[classification] = (itemCounts[classification] ?? 0) + 1;
        }
        return itemCounts;
      }
    } catch (e) {
      print(e);
    }
    return {};
  }
  
  Future<int> getUniqueClassificationCountForUID(String uid) async {
    try {
      QuerySnapshot snapshot = await rocksFoundCollection
          .where('UID', isEqualTo: uid)
          .get();
      if (snapshot.docs.isNotEmpty) {
        Set<String> uniqueClassifications = Set<String>();
        for (var doc in snapshot.docs) {
          Map<String, dynamic> data =
              doc.data() as Map<String, dynamic>;
          String classification = data['ROCK_CLASSIFICATION'];
          uniqueClassifications.add(classification);
        }
        return uniqueClassifications.length;
      }
    } catch (e) {
      print(e);
    }
    return 0;
  }

}