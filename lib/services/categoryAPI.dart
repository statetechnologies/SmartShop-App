import 'package:http/http.dart' as http;

void getCategory() async {
  var headers = {
    'Authorization':
        'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjY1NjYzOTQ4LCJpYXQiOjE2NjU1Nzc1NDgsImp0aSI6IjM1NzRmYTc3ODUyNjRmZTNiNWU5YjlmODhmYjYwZmU2IiwidXNlcl9pZCI6MX0.Bn-_KyUuYPvhBw3RTYhpfuwRZNRvk_idvA-7ZJjRWlY',
    'Cookie':
        'csrftoken=DbBfvJYlucT7gs1EXb8rD6C8unq9WGv858XGaWMtNbifN5V1ADWojonLTxRAU8jf'
  };
  var request = http.Request(
      'GET', Uri.parse('https://smartshop.mrshanas.com/api/categories/'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}

void addCategory({required String title}) async {
  var headers = {
    'Authorization':
        'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjY1NjYzOTQ4LCJpYXQiOjE2NjU1Nzc1NDgsImp0aSI6IjM1NzRmYTc3ODUyNjRmZTNiNWU5YjlmODhmYjYwZmU2IiwidXNlcl9pZCI6MX0.Bn-_KyUuYPvhBw3RTYhpfuwRZNRvk_idvA-7ZJjRWlY',
    'Cookie':
        'csrftoken=DbBfvJYlucT7gs1EXb8rD6C8unq9WGv858XGaWMtNbifN5V1ADWojonLTxRAU8jf'
  };
  var request = http.MultipartRequest(
      'POST', Uri.parse('https://smartshop.mrshanas.com/api/categories/'));
  request.fields.addAll({'title': title});

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}
