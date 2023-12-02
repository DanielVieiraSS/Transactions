import 'package:uuid/uuid.dart';

class UserModel {
  UserModel(
    this.name,
    this.email,
    this.password,
  ) {
    id = const Uuid().v4();
    createdAt = DateTime.now();
  }

  late String id;
  final String name;
  final String email;
  final String password;
  late DateTime createdAt;
}
