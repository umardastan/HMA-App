class User {
  int? id;
  String? name;
  String? fullName;
  String? email;
  String? foto;
  int? role;
  int? status;
  String? nip;

  User(
      {this.id,
      this.name,
      this.fullName,
      this.email,
      this.foto,
      this.role,
      this.status,
      this.nip});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    fullName = json['full_name'];
    email = json['email'];
    foto = json['foto'];
    role = json['role'];
    status = json['status'];
    nip = json['nip'];
  }

  Map toJson(User user) {
    Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = user.id;
    data["name"] = user.name;
    data['full_name'] = user.fullName;
    data['email'] = user.email;
    data['foto'] = user.foto;
    data['role'] = user.role;
    data['status'] = user.status;
    data['nip'] = user.nip;
    return data;
  }

  @override
  toString() =>
      '{id: $id, name: $name, full_name: $fullName, email: $email, foto: $foto, role: $role, status: $status, nip: $nip}';
}
