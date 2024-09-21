import 'package:collection/collection.dart';

enum UserType {
  USER,
  Trainer,
  Mentor,
}

enum FriendShipStatus {
  friends,
  requested,
  pending,
  rejected,
}

enum MessageType {
  text,
  image,
}

enum PrivacyType {
  Public,
  Private,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (UserType):
      return UserType.values.deserialize(value) as T?;
    case (FriendShipStatus):
      return FriendShipStatus.values.deserialize(value) as T?;
    case (MessageType):
      return MessageType.values.deserialize(value) as T?;
    case (PrivacyType):
      return PrivacyType.values.deserialize(value) as T?;
    default:
      return null;
  }
}
