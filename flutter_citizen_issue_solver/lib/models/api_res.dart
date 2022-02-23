class ApiResponse {
  String msg = "Empty message";
  Map<String, dynamic> data;
  String status;

//<editor-fold desc="Data Methods">

  ApiResponse({
    required this.msg,
    required this.data,
    required this.status,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ApiResponse &&
          runtimeType == other.runtimeType &&
          msg == other.msg &&
          data == other.data &&
          status == other.status);

  @override
  int get hashCode => msg.hashCode ^ data.hashCode ^ status.hashCode;

  @override
  String toString() {
    return 'ApiResponse{' +
        ' msg: $msg,' +
        ' data: $data,' +
        ' status: $status,' +
        '}';
  }

  ApiResponse copyWith({
    String? msg,
    Map<String, dynamic>? data,
    String? status,
  }) {
    return ApiResponse(
      msg: msg ?? this.msg,
      data: data ?? this.data,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'msg': this.msg,
      'data': this.data,
      'status': this.status,
    };
  }

  factory ApiResponse.fromMap(Map<String, dynamic> map) {
    return ApiResponse(
      msg: map['msg'] as String,
      data: map['data'] as Map<String, dynamic>,
      status: map['status'] as String,
    );
  }

//</editor-fold>
}
