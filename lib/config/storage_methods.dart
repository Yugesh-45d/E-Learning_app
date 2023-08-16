
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

class StorageMethods {
  final FirebaseStorage storage = FirebaseStorage.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<String> uploadImageToStorage(
    String profilePic,
    Uint8List profilePhoto,
    bool isPost,
  ) async {
    //-----------------------------------------------------------------------------------------
    Reference ref =
        storage.ref().child(profilePic).child(auth.currentUser!.uid);
    //Suruma firebase ko reference 'ref' le garayo
    //ani folder banayo 'folderName' wala
    // ani auth.currentUser.uid le currentUser ko id dinxa

    UploadTask uploadTask = ref.putData(profilePhoto);
    //Ani tyo reference liyeko storage location ma putData ko help le hamro 'hamroData' vanne data upload garo

    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    //Tyo store gareko image ko url downloadUrl ma basxa mathi ko 2 line lekho vane

    return downloadUrl;
  }
}
