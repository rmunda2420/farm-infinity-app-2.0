import 'package:flutter/cupertino.dart';

abstract class BaseDataRepository<T> {
  Future<void> create(T data);

// Add other repository methods as needed
  Future<void> autoUpdateField<S>(String id, String keyToUpdate, S text,
      {bool isSecondaryActivity});

  Future<void> fetch(String id, {bool isSecondaryActivity});
}
