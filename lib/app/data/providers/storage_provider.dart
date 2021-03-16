/// -----------------------------------------------------------------
/// 
/// File: storage_provider.dart
/// Project: PUSH
/// File Created: Monday, March 15th, 2021
/// Description: 
/// 
/// Author: Brandon Long - brandon@longsoftware.io
/// -----
/// Last Modified: Monday, March 15th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
/// 
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH
/// 
/// -----------------------------------------------------------------

import 'package:firebase_storage/firebase_storage.dart';
import 'dart:typed_data';

abstract class BaseStorageProivder {
  // delete file from storage
  Future<void> deleteFile(String path);

  // upload file to storage
  Future<String> uploadFile(String path, Uint8List data,
      [StorageMetadata metadata]);
}

class StorageProvider implements BaseStorageProivder {
  dynamic storage;

  StorageProvider(this.storage);

  @override
  Future<void> deleteFile(String path) {
    StorageReference storageReference = storage.ref().child(path);
    return storageReference.delete();
  }

  @override
  Future<String> uploadFile(String path, Uint8List data,
      [StorageMetadata metadata]) async {
    StorageReference storageReference =
        FirebaseStorage.instance.ref().child(path);
    StorageUploadTask uploadTask = storageReference.putData(data, metadata);
    StorageTaskSnapshot downloadURL = (await uploadTask.onComplete);
    return await downloadURL.ref.getDownloadURL();
  }
}
