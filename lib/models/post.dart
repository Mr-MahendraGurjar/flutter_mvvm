class Post {
  String password;
  String email;
Post();
  Post.fromMap(Map<String, dynamic> data) {
    email = data['email'];
    password = data['password'];
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }
}
