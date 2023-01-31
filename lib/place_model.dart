class PlaceModel {
  String uuid;
  String? name;
  double? price;
  int? bedroom;
  double? areaUsed;
  double? rate;
  String? image;

  PlaceModel(
      {required this.uuid,
      this.name,
      this.price,
      this.bedroom,
      this.areaUsed,
      this.rate,
      this.image});
}
