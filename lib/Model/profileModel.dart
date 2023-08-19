class Profile{
  final int? id;
  final String name;
  final String email;
  final String? password;
  final String? created_at;
  final String? email_verified_at;
  final String? updated_at;

  Profile(
      { required this.name,required this.email,this.password ,required this.id, this.created_at, this.email_verified_at, this.updated_at});

  factory Profile.fromJson(Map<String,dynamic> _map)
  {
    return Profile(
      id: _map["id"],
      name: _map["name"],
      password: _map["password"],
      email: _map["email"],
    );
  }
}