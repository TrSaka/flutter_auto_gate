// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SimpleUser {
  final String? name;
  final String? email;
  final String? password;
  SimpleUser({
    this.name,
    this.email,
    this.password,
  });

  SimpleUser copyWith({
    String? name,
    String? email,
    String? password,
  }) {
    return SimpleUser(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
    };
  }

  factory SimpleUser.fromMap(Map<String, dynamic> map) {
    return SimpleUser(
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SimpleUser.fromJson(String source) => SimpleUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SimpleUser(name: $name, email: $email, password: $password)';

  @override
  bool operator ==(covariant SimpleUser other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.email == email &&
      other.password == password;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode ^ password.hashCode;
}
