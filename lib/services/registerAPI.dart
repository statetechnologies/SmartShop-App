import 'package:http/http.dart' as http;

var headers = {
  'Cookie':
      'csrftoken=sEvrdG2TFMOFiZsz9vblDuZ3FCv6GCjTx6wWno6CRn1ZOUULVuq5ELBUkIZXzDnd; messages=W1siX19qc29uX21lc3NhZ2UiLDAsMjAsIkNvbmZpcm1hdGlvbiBlLW1haWwgc2VudCB0byBqYW1lc2thbmdhMjlAZ21haWwuY29tLiJdXQ:1ovwBU:9EcXOGQG1I5T6j2FQULpipVbzt6INylz9PeLcXxqFlQ; sessionid=1n7rjzrrwcg1ziuoh9oith10fd8usfn8'
};
Future<void> register(
    {required String username,
    required String email,
    required String password1,
    required String password2}) async {
  var request = http.MultipartRequest(
      'POST',
      Uri.parse(
          'https://smartshop-yqokj.ondigitalocean.app/api/auth/register/'));
  request.fields.addAll({
    'username': username,
    'email': email,
    'password1': password1,
    'password2': password2
  });



  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();
  if (response.statusCode == 200) {
    resendEmailVerify(email: email);
    String regData = await response.stream.bytesToString();
    print(regData);
    // return regData;
  } else {
    String? failsafe = response.reasonPhrase;
    print(response.reasonPhrase);
    // return failsafe!;
  }
}

void resendEmailVerify({required String email}) async {
  var request = http.MultipartRequest(
      'POST',
      Uri.parse(
          'https://smartshop-yqokj.ondigitalocean.app/api/auth/register/resend-email/'));

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
  var request = http.MultipartRequest(
      'POST',
      Uri.parse(
          'https://smartshop-yqokj.ondigitalocean.app/api/auth/register/verify-email/'));

  request.headers.addAll(headers);
  request.fields.addAll({"key": key});

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}
