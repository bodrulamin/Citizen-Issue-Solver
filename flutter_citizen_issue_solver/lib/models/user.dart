class User {
  String? username;
  String? password;
  String? usertype;
  String? address;
  String? phone;
  String? email;
  String? fullname;

//<editor-fold desc="Data Methods">

  User({
    this.username,
    this.password,
    this.usertype,
    this.address,
    this.phone,
    this.email,
    this.fullname,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          runtimeType == other.runtimeType &&
          username == other.username &&
          password == other.password &&
          usertype == other.usertype &&
          address == other.address &&
          phone == other.phone &&
          email == other.email &&
          fullname == other.fullname);

  @override
  int get hashCode =>
      username.hashCode ^
      password.hashCode ^
      usertype.hashCode ^
      address.hashCode ^
      phone.hashCode ^
      email.hashCode ^
      fullname.hashCode;

  @override
  String toString() {
    return 'User{' +
        ' username: $username,' +
        ' password: $password,' +
        ' usertype: $usertype,' +
        ' address: $address,' +
        ' phone: $phone,' +
        ' email: $email,' +
        ' fullname: $fullname,' +
        '}';
  }

  User copyWith({
    String? username,
    String? password,
    String? usertype,
    String? address,
    String? phone,
    String? email,
    String? fullname,
  }) {
    return User(
      username: username ?? this.username,
      password: password ?? this.password,
      usertype: usertype ?? this.usertype,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      fullname: fullname ?? this.fullname,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': this.username,
      'password': this.password,
      'usertype': this.usertype,
      'address': this.address,
      'phone': this.phone,
      'email': this.email,
      'fullname': this.fullname,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      username: map['username'] as String,
      password: map['password'] as String,
      usertype: map['usertype'] as String,
      address: map['address'] as String,
      phone: map['phone'] as String,
      email: map['email'] as String,
      fullname: map['fullname'] as String,
    );
  }

//</editor-fold>
}
