import 'package:smart_shop/services/networking.dart';

class userModel {
  Future<dynamic> getLoginData() async {
    var smartShop = Uri(
        scheme: 'http',
        host: 'smartshop.mrshanas.com',
        path: '/api/auth/login/');
    NetworkHelper networkHelper = NetworkHelper(smartShop);
    var loginData = await networkHelper.getData();
    return loginData;
  }
}
