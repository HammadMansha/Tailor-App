import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tailor_book/Controllers/LoginScreenController.dart';
import 'package:tailor_book/Services/Fire_Store_CRUD.dart';
import 'package:tailor_book/UI%20Screens/Constants.dart';
import 'package:tailor_book/UI%20Screens/HomeScreen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static String get routeName => '/login';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (loginController) {
        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Constants.primaryColor,
            body: SingleChildScrollView(
              reverse: true,
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height,
                    width: Get.width,
                    child: Center(
                      child: SizedBox(
                        // margin:  EdgeInsets.all(MediaQuery.of(context).size.width/10),
                        height: MediaQuery.of(context).size.height / 1.5,
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/splash.png',
                                width: 120,
                                height: 120,
                              ),
                              RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  text: 'Welcome to ',
                                  style: Theme.of(context).textTheme.bodyText2,
                                  children: const <TextSpan>[
                                    TextSpan(
                                      text: 'the',
                                    ),
                                    TextSpan(text: ' world of\n'),
                                    TextSpan(
                                        text: 'Tailor Book',
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Text(
                                "Let's Start Now",
                                textAlign: TextAlign.left,
                              ),
                              Form(
                                key: loginController.formKey,
                                child: Column(
                                  children: [
                                    KInputField(
                                        "Full Name",
                                        "Farhan Aslam",
                                        Icons.account_circle_rounded,
                                        loginController.nameController,
                                        TextInputType.text,
                                        context),
                                    KInputField(
                                        "Phone Number",
                                        "+00 0000 0000000",
                                        Icons.phone_rounded,
                                        loginController.numberController,
                                        TextInputType.phone,
                                        context,),
                                    KInputField(
                                        "password",
                                        "********",
                                        Icons.lock_rounded,
                                        loginController.passwordController,
                                        TextInputType.text,
                                        context),
                                    Padding(
                                      padding: EdgeInsets.only(top: 16),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.5,
                                        height:
                                            MediaQuery.of(context).size.width /
                                                8,
                                        child: ElevatedButton(
                                          onPressed: () async {
                                            final form = loginController
                                                .formKey.currentState!;
                                            if (form.validate()) {
                                              Get.showSnackbar(GetSnackBar(
                                                title: "Error",
                                                isDismissible: true,
                                                icon: Icon(
                                                  Icons.error_outline,
                                                  color: Colors.white,
                                                ),
                                                duration: Duration(
                                                    milliseconds: 1500),
                                                message: "Fill all Fields",
                                              ));
                                            } else {
                                              // Constants.prefs.setInt('number', );
                                              GetStorage().write(
                                                  'number',
                                                  loginController
                                                      .numberController.text);
                                              GetStorage().write(
                                                  'name',
                                                  loginController
                                                      .nameController.text);
                                              Database.registerUser(
                                                  userName: loginController
                                                      .nameController.text,
                                                  userNumber: loginController
                                                      .numberController.text,
                                                  password: loginController
                                                      .passwordController.text);
                                            }
                                          },
                                          child: Text("Get Started"),
                                          style: ElevatedButton.styleFrom(
                                            shape: StadiumBorder(),
                                            backgroundColor:
                                                Constants.primaryColor,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                  // inputField(),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
