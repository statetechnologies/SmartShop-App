import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_shop/constants/theme.dart';
import 'package:smart_shop/services/theme_service.dart';
import 'package:smart_shop/widgets/buttons.dart';
import 'homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController RegemailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController RegpasswordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  int _selectedIndex = 0;
  List<BottomNavigationBarItem> bottomNav = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
        icon: Icon(
          Icons.login,
        ),
        label: 'Login'),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.create,
      ),
      label: 'Register',
    )
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: _appBar(),
      body: _pageContent(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedLabelStyle: subHeadingStyle,
        backgroundColor:
            Get.isDarkMode ? primary3DarkTiles : primary3LightTiles,
        unselectedItemColor: Get.isDarkMode ? null : bodyDark,
        selectedItemColor: Get.isDarkMode ? bodyLight1 : primary2Dark,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        iconSize: 40,
        onTap: _onItemTapped,
        elevation: 4,
        items: bottomNav,
      ),
    );
  }

  _appBar() => AppBar(
        elevation: 2,
        backgroundColor: Get.isDarkMode ? primary3DarkTiles : primary2Light,
        leading: SizedBox(
          width: 70,
        ),
        title: Center(
          child: GestureDetector(
            onTap: () => ThemeServices().changeThemeMode(),
            child: CircleAvatar(
              backgroundColor: Get.isDarkMode ? Colors.black26 : bodyLight,
              child: Icon(
                Get.isDarkMode ? Icons.wb_sunny_sharp : Icons.nightlight_round,
                size: 20.0,
                color: Get.isDarkMode ? Colors.white : Colors.black12,
              ),
            ),
          ),
        ),
        actions: [
          SizedBox(
            width: 80,
          )
        ],
      );

  _validateLogin() {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      if (emailController.text == 'email' &&
          passwordController.text == 'password') {
        Get.to(() => const HomePage());
      }
    } else if (emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      Get.snackbar('Required', 'All required fields must be filled',
          backgroundColor: Get.isDarkMode ? Colors.white : Colors.black,
          colorText: Colors.red,
          icon: Icon(
            Icons.warning,
            color: Get.isDarkMode ? Colors.red : Colors.yellowAccent,
          ),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  _validateRegistry() {
    if (RegemailController.text.isNotEmpty &&
        RegpasswordController.text.isNotEmpty &&
        usernameController.text.isNotEmpty) {
      if (RegemailController.text == 'email' &&
          RegpasswordController.text == 'password') {
        Get.to(() => const HomePage());
      }
    } else if (RegemailController.text.isEmpty ||
        RegpasswordController.text.isEmpty) {
      Get.snackbar('Required', 'All required fields must be filled',
          backgroundColor: Get.isDarkMode ? Colors.white : Colors.black,
          colorText: Colors.red,
          icon: Icon(
            Icons.warning,
            color: Get.isDarkMode ? Colors.red : Colors.yellowAccent,
          ),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  _pageContent(int index) {
    switch (index) {
      case 0:
        return Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to SmartShop!',
                style: headingStyle,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Login to your Shop Account',
                style: subText,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Get.isDarkMode
                        ? primary3Container
                        : primary3LightTiles),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: emailController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            hintText: 'Email Address',
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            focusColor: Colors.blueAccent),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.password_rounded),
                            hintText: 'Password',
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            focusColor: Colors.blueAccent),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      CustomButton(
                        color: secondary1Dark,
                        label: 'Login',
                        icon: Icons.navigate_next,
                        onTap: () {
                          _validateLogin();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );

      case 1:
        return Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to SmartShop!',
                style: headingStyle,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Register your Shop Account',
                style: subText,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Get.isDarkMode
                        ? primary3Container
                        : primary3LightTiles),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: RegemailController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            hintText: 'Email Address',
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            focusColor: Colors.blueAccent),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: usernameController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            hintText: 'Username',
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            focusColor: Colors.blueAccent),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: RegpasswordController,
                        obscureText: true,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.password_rounded),
                            hintText: 'Password',
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            focusColor: Colors.blueAccent),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      CustomButton(
                        color: secondary1Dark,
                        label: 'Register',
                        icon: Icons.navigate_next,
                        onTap: () {
                          _validateRegistry();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );

      default:
        return Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to SmartShop!',
                style: headingStyle,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Login to your Shop Account',
                style: subHeadingStyle,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Get.isDarkMode
                        ? primary3Container
                        : primary3LightTiles),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: emailController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            hintText: 'Email Address',
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            focusColor: Colors.blueAccent),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.password_rounded),
                            hintText: 'Password',
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            focusColor: Colors.blueAccent),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      CustomButton(
                        color: primary3DarkLogin,
                        label: 'Login',
                        icon: Icons.navigate_next,
                        onTap: () {
                          _validateLogin();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
    }
  }
}
