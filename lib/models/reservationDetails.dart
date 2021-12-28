class ReservationDetails {
  int reservation_id;
  String reservation_code;
  int user_id;
  String service;
  int servicePrice;
  String reservation_time;
  int status = 0;
  int totalPrice;
  String createdAt;
  String updateAt;
  ReservationDetails(
      {required this.reservation_id,
      required this.reservation_code,
      required this.user_id,
      required this.service,
      required this.servicePrice,
      required this.reservation_time,
      required this.status,
      required this.totalPrice,
      required this.createdAt,
      required this.updateAt});

  factory ReservationDetails.fromJson(Map<String, dynamic> json) {
    return ReservationDetails(
      reservation_id: json['reservation_id'],
      reservation_code: json['reservation_code'],
      user_id: json['user_id'],
      service: json['service'],
      servicePrice: json['servicePrice'],
      reservation_time: json['reservation_time'],
      status: json['status'],
      totalPrice: json['totalPrice'],
      createdAt: json['created_at'],
      updateAt: json['updated_at'],
    );
  }
}
