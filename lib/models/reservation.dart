class Reservation {
  int reservation_id;
  String reservation_code;
  int user_id;
  int service_id;
  String reservation_time;
  String createdAt;
  String updateAt;

  Reservation(
      {required this.reservation_id,
      required this.reservation_code,
      required this.user_id,
      required this.service_id,
      required this.reservation_time,
      required this.createdAt,
      required this.updateAt});

  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation(
      reservation_id: json['reservation_id'],
      reservation_code: json['reservation_code'],
      user_id: json['user_id'],
      service_id: json['service_id'],
      reservation_time: json['reservation_time'],
      createdAt: json['created_at'],
      updateAt: json['updated_at'],
    );
  }
}
