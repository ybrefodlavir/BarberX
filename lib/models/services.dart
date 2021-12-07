class Service {
  int serviceId;
  int categoryServiceId;
  String name;
  int price;
  String image;
  String createdAt;
  String updateAt;

  Service(
      {required this.serviceId,
      required this.categoryServiceId,
      required this.name,
      required this.price,
      required this.image,
      required this.createdAt,
      required this.updateAt});

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      serviceId: json['service_id'],
      categoryServiceId: json['category_service_id'],
      name: json['name'],
      price: json['price'],
      image: json['image'],
      createdAt: json['created_at'],
      updateAt: json['updated_at'],
    );
  }
}
