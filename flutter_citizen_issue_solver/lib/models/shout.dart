import 'dart:core';

class Shout {
  int id;
  int shouterId;
  int actionTakerId;
  int categoryId;
  String shoutTitle;
  String shoutmessage;
  String address;
  String status;
  DateTime? date;
  String photo;

//<editor-fold desc="Data Methods">

  Shout({
    required this.id,
    required this.shouterId,
    required this.actionTakerId,
    required this.categoryId,
    required this.shoutTitle,
    required this.shoutmessage,
    required this.address,
    required this.status,
    required this.date,
    required this.photo,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Shout &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          shouterId == other.shouterId &&
          actionTakerId == other.actionTakerId &&
          categoryId == other.categoryId &&
          shoutTitle == other.shoutTitle &&
          shoutmessage == other.shoutmessage &&
          address == other.address &&
          status == other.status &&
          date == other.date &&
          photo == other.photo);

  @override
  int get hashCode =>
      id.hashCode ^
      shouterId.hashCode ^
      actionTakerId.hashCode ^
      categoryId.hashCode ^
      shoutTitle.hashCode ^
      shoutmessage.hashCode ^
      address.hashCode ^
      status.hashCode ^
      date.hashCode ^
      photo.hashCode;

  @override
  String toString() {
    return 'Shout{' +
        ' id: $id,' +
        ' shouterId: $shouterId,' +
        ' actionTakerId: $actionTakerId,' +
        ' categoryId: $categoryId,' +
        ' shoutTitle: $shoutTitle,' +
        ' shoutmessage: $shoutmessage,' +
        ' address: $address,' +
        ' status: $status,' +
        ' date: $date,' +
        ' photo: $photo,' +
        '}';
  }

  Shout copyWith({
    int? id,
    int? shouterId,
    int? actionTakerId,
    int? categoryId,
    String? shoutTitle,
    String? shoutmessage,
    String? address,
    String? status,
    DateTime? date,
    String? photo,
  }) {
    return Shout(
      id: id ?? this.id,
      shouterId: shouterId ?? this.shouterId,
      actionTakerId: actionTakerId ?? this.actionTakerId,
      categoryId: categoryId ?? this.categoryId,
      shoutTitle: shoutTitle ?? this.shoutTitle,
      shoutmessage: shoutmessage ?? this.shoutmessage,
      address: address ?? this.address,
      status: status ?? this.status,
      date: date ?? this.date,
      photo: photo ?? this.photo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'shouterId': this.shouterId,
      'actionTakerId': this.actionTakerId,
      'categoryId': this.categoryId,
      'shoutTitle': this.shoutTitle,
      'shoutmessage': this.shoutmessage,
      'address': this.address,
      'status': this.status,
      'date': this.date?.toIso8601String(),
      'photo': this.photo,
    };
  }

  factory Shout.fromMap(Map<String, dynamic> map) {
    return Shout(
      id: map['id'] as int,
      shouterId: map['shouterId'] as int,
      actionTakerId: map['actionTakerId'] as int,
      categoryId: map['categoryId'] as int,
      shoutTitle: map['shoutTitle'] as String,
      shoutmessage: map['shoutmessage'] as String,
      address: map['address'] as String,
      status: map['status'] as String,
      date: DateTime.tryParse(map['date']),
      photo: map['photo'] as String,
    );
  }

//</editor-fold>
}
