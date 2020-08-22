class Address {
  String id;
  String province;
  String city;
  Address({this.id, this.province, this.city});

  parse(dynamic data) {
    var address = new Address();
    address.id = data['id'] ?? '';
    address.province = data['province'] ?? '';
    address.city = data['city'] ?? '';
    return address;
  }
}
