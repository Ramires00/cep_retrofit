class Locate {
  String location;
  Locate({required this.location});

  factory Locate.fromJson(Map<String, dynamic> json) {
    String location = json['localidade'];
    print(json);
    return Locate(location: location);
  }
}
