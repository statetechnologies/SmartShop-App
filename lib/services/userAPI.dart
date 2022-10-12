import 'package:http/http.dart' as http;

var headers = {
  'Authorization':
      'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjY1NjU5MjQwLCJpYXQiOjE2NjU1NzI4NDAsImp0aSI6IjU3YmYwMTU1NzRlZDRhNjM4MWMzZjNiMWIzMzE4Y2Q2IiwidXNlcl9pZCI6MX0.R92EKHNb7fcQdcWnZCs5HN_eQOif6L5jk5HnizV26BA',
  'Cookie':
      'csrftoken=DbBfvJYlucT7gs1EXb8rD6C8unq9WGv858XGaWMtNbifN5V1ADWojonLTxRAU8jf'
};
void getUserProfile() async {
  var request = http.Request(
      'GET', Uri.parse('https://smartshop.mrshanas.com/api/auth/user/'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}

void updateDetails(
    {required String username,
    email,
    required String firstname,
    required String lastname}) async {
  var request = http.MultipartRequest(
      'PUT', Uri.parse('https://smartshop.mrshanas.com/api/auth/user/'));

  request.headers.addAll(headers);
  request.fields.addAll({
    "username": username,
    "email": email,
    "first_name": firstname,
    "last_name": lastname
  });

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}

void authLogin({required password, email, required String username}) async {
  var request = http.MultipartRequest(
      'POST', Uri.parse('https://smartshop.mrshanas.com/api/auth/login/'));

  request.headers.addAll(headers);
  request.fields
      .addAll({"password": password, "email": email, "username": username});

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}

void getLogout() async {
  var request = http.Request(
      'GET', Uri.parse('https://smartshop.mrshanas.com/api/auth/logout/'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}

void postlogout() async {
  var request = http.Request(
      'POST', Uri.parse('https://smartshop.mrshanas.com/api/auth/logout/'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}

void changePass({required String password1, required String password2}) async {
  var request = http.MultipartRequest('POST',
      Uri.parse('https://smartshop.mrshanas.com/api/auth/password/change/'));

  request.headers.addAll(headers);
  request.fields
      .addAll({"new_password1": password1, "new_password2": password2});

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}

void resetPass({required email}) async {
  var request = http.MultipartRequest('POST',
      Uri.parse('https://smartshop.mrshanas.com/api/auth/password/reset/'));

  request.headers.addAll(headers);
  request.fields.addAll({"email": email});

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}

void resetPassConfirm(
    {required String password1,
    required String password2,
    required uid,
    required token}) async {
  var request = http.MultipartRequest(
      'POST',
      Uri.parse(
          'https://smartshop.mrshanas.com/api/auth/password/reset/confirm/'));

  request.headers.addAll(headers);
  request.fields.addAll({
    "new_password1": password1,
    "new_password2": password2,
    "uid": uid,
    "token": token
  });

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}
