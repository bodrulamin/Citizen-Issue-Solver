class UserPayload {
  String username;
  String password;

//<editor-fold desc="Data Methods">

  UserPayload({
    required this.username,
    required this.password,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserPayload &&
          runtimeType == other.runtimeType &&
          username == other.username &&
          password == other.password);

  @override
  int get hashCode => username.hashCode ^ password.hashCode;

  @override
  String toString() {
    return 'UserPayload{' +
        ' username: $username,' +
        ' password: $password,' +
        '}';
  }

  UserPayload copyWith({
    String? username,
    String? password,
  }) {
    return UserPayload(
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': this.username,
      'password': this.password,
    };
  }

  factory UserPayload.fromMap(Map<String, dynamic> map) {
    return UserPayload(
      username: map['username'] as String,
      password: map['password'] as String,
    );
  }

//</editor-fold>
}
