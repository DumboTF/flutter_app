class User {
  final String name;
  final String email;

  User(this.name, this.email);

  User.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        email = json["email"];

  Map<String, dynamic> toJson() => {"name": name, "email": email};

  @override
  String toString() {
    // TODO: implement toString
    return "{\"name\":\"" + name + "\",\"email\":\"" + email + "\"}";
  }
}
