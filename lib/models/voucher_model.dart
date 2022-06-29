import 'dart:convert';

class VoucherModel {
  final String id;
  final String code;
  final int discountPercent;
  final String describe;
  final bool valid;
  final String userVoucher;
  bool isCheck;
  VoucherModel({
    required this.id,
    required this.code,
    required this.discountPercent,
    required this.describe,
    required this.valid,
    required this.userVoucher,
    this.isCheck = true,
  });

  VoucherModel copyWith({
    String? id,
    String? code,
    int? discountPercent,
    String? describe,
    bool? valid,
    String? userVoucher,
  }) {
    return VoucherModel(
      id: id ?? this.id,
      code: code ?? this.code,
      discountPercent: discountPercent ?? this.discountPercent,
      describe: describe ?? this.describe,
      valid: valid ?? this.valid,
      userVoucher: userVoucher ?? this.userVoucher,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'code': code,
      'discountPercent': discountPercent,
      'describe': describe,
      'valid': valid,
      'userVoucher': userVoucher,
    };
  }

  factory VoucherModel.fromMap(Map<String, dynamic> map) {
    return VoucherModel(
      id: map['id'] ?? '',
      code: map['code'] ?? '',
      discountPercent: map['discountPercent'].toInt() ?? 0,
      describe: map['describe'] ?? '',
      valid: map['valid'] ?? false,
      userVoucher: map['userVoucher'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory VoucherModel.fromJson(String source) =>
      VoucherModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'VoucherModel(id: $id, code: $code, discountPercent: $discountPercent, describe: $describe, valid: $valid, userVoucher: $userVoucher)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VoucherModel &&
        other.id == id &&
        other.code == code &&
        other.discountPercent == discountPercent &&
        other.describe == describe &&
        other.valid == valid &&
        other.userVoucher == userVoucher;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        code.hashCode ^
        discountPercent.hashCode ^
        describe.hashCode ^
        valid.hashCode ^
        userVoucher.hashCode;
  }
}
