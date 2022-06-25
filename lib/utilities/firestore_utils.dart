import 'dart:typed_data';

class FireStoreSize {
  /// Return size in bytes of the provided firestore document [fsDocument].
  int getFireStoreDocumentSize(Map<String, dynamic> fsDocument) {
    int netSizeInBytes = 0;

    for (var entry in fsDocument.entries) {
      // First add the key size to the [netSizeInBytes]
      netSizeInBytes += entry.key.fstSize();
      // assign value to local variable
      final val = entry.value;
      // Next depending on the type of the field add the respective size to the [netSizeInBytes] variable.
      // Recursively call [getFireStoreDocumentSize] method to size of map fields as it represents the firestore map fields.
      if (val is Map<String, dynamic>) {
        netSizeInBytes += getFireStoreDocumentSize(val);
      } else if (val is List) {
        for (var item in val) {
          if (item is Map<String, dynamic>) {
            // For map fields again use a recursive call
            netSizeInBytes += getFireStoreDocumentSize(item);
          } else {
            // For generic fields use the [_fieldSize] method to retrieve field specific size in bytes
            netSizeInBytes += fieldSize(item);
          }
        }
      } else {
        netSizeInBytes += fieldSize(val);
      }
    }
    return netSizeInBytes;
  }

  /// Returns field type specific size in bytes.
  /// This method doesnt return reference field sizes as it requires cloud firestore package of dart or flutter to verify the type.
  /// The [Uint8List] type is used instead of [Blob] from the cloud firetor package for berevity.
  int fieldSize(dynamic val) {
    // num,String and DateTime has the respective extension function [fstSize] to return firestoelsere specific sizes.
    if (val is String) {
      return val.fstSize();
    } else if (val is num) {
      return val.fstSize();
    } else if (val is DateTime) {
      return val.fstSize();
    } else if (val is Uint8List) {
      // Bytes field should return the size in the bytes.
      return val.lengthInBytes;
    } else if (val == null) {
      // null fields have size of 1 byte by default in firestore.
      return 1;
    }
    return 0;
  }
}

extension on String {
  int fstSize() {
    return length + 1;
  }
}

/// extension to create firestore size on num. Covers both int and double
extension on num {
  int fstSize() {
    return 8;
  }
}

/// extension to create firestore size on DateTime
extension on DateTime {
  int fstSize() {
    return 8;
  }
}
