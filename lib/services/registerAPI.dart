import 'package:http/http.dart' as http;

void register(
    {required String username,
    email,
    required String password1,
    required String password2}) async {
  var headers = {
    'Cookie':
        'csrftoken=DbBfvJYlucT7gs1EXb8rD6C8unq9WGv858XGaWMtNbifN5V1ADWojonLTxRAU8jf'
  };
  var request = http.MultipartRequest(
      'POST', Uri.parse('https://smartshop.mrshanas.com/api/auth/register/'));

  request.headers.addAll(headers);
  request.fields.addAll({
    "username": username,
    "email": email,
    "password1": password1,
    "password2": password2
  });

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}

void resendEmailVerify({email}) async {
  var headers = {
    'Cookie':
        'csrftoken=DbBfvJYlucT7gs1EXb8rD6C8unq9WGv858XGaWMtNbifN5V1ADWojonLTxRAU8jf'
  };
  var request = http.MultipartRequest(
      'POST',
      Uri.parse(
          'https://smartshop.mrshanas.com/api/auth/register/resend-email/'));

  request.headers.addAll(headers);
  request.fields.addAll({"email": email});

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}

void verifyEmail({key}) async {
  var headers = {
    'Cookie':
        'csrftoken=DbBfvJYlucT7gs1EXb8rD6C8unq9WGv858XGaWMtNbifN5V1ADWojonLTxRAU8jf'
  };
  var request = http.MultipartRequest(
      'POST',
      Uri.parse(
          'https://smartshop.mrshanas.com/api/auth/register/verify-email/'));

  request.headers.addAll(headers);
  request.fields.addAll({"key": key});

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}
