class LoginResponse {
  String _token;

  LoginResponse({String token}) {
    this._token = token;
  }

  String get token => _token;
  set token(String token) => _token = token;

  LoginResponse.fromJson(Map<String, dynamic> json) {
    _token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this._token;
    return data;
  }
}