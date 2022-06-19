class Admin {
/*
{
  "name": "Ali hamed",
  "email": "admin1@gmail.com",
  "password": "123"
} 
*/

  String name;
  String email;
  String password;

  Admin({
    this.name,
    this.email,
    this.password,
  });
  Admin.fromJson(Map<String, dynamic> json) {
    name = json['name'].toString();
    email = json['email'].toString();
    password = json['password'].toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}