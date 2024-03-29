class Users {
  final int? id;
  final String username;
  final String password;

  Users({
    this.id, 
    required this.username, 
    required this.password
  });

  factory Users.fromMap(Map<String, dynamic> json) => Users(
      id: json['id'],
      username: json['username'],
      password: json['password'],
  );
  
  Map<String, dynamic> toMap() => {
    'id': id, 
    'username': username, 
    'password': password,
  };
}
