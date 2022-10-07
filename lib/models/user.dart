import 'package:uuid/uuid.dart';

class User {
  late String id;
  String name;
  String login;

  User({
    required this.name,
    required this.login,
    String? id,
  }) {
    this.id = id ?? const Uuid().v4();    
  }

  factory User.fromMap(Map<String, dynamic> data) {
    return User(
      id: data["id"],
      name: data["name"],
      login: data["login"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "login": login,
    };
  }
}
