class UserPayload {
  String username;
  String password;
  String usertype;

//<editor-fold desc="Data Methods">

  UserPayload({
    required this.username,
    required this.password,
    required this.usertype,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserPayload &&
          runtimeType == other.runtimeType &&
          username == other.username &&
          password == other.password &&
          usertype == other.usertype);

  @override
  int get hashCode => username.hashCode ^ password.hashCode ^ usertype.hashCode;

  @override
  String toString() {
    return 'User{' +
        ' username: $username,' +
        ' password: $password,' +
        ' usertype: $usertype,' +
        '}';
  }

  UserPayload copyWith({
    String? username,
    String? password,
    String? usertype,
  }) {
    return UserPayload(
      username: username ?? this.username,
      password: password ?? this.password,
      usertype: usertype ?? this.usertype,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': this.username,
      'password': this.password,
      'usertype': this.usertype,
    };
  }

  factory UserPayload.fromMap(Map<String, dynamic> map) {
    return UserPayload(
      username: map['username'] as String,
      password: map['password'] as String,
      usertype: map['usertype'] as String,
    );
  }

//</editor-fold>
}
