class AppUser {
  int? id;
  String? email;
  String? password;
  String? name;

  AppUser({ this.name,  this.id,  this.password,this.email});

  AppUser.fromJson(Map<String, dynamic> json, id) {
    id = this.id;
    email = json['email'];
    name = json['name'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['name'] = name;
    data['password'] = password;
    return data;
  }
}
