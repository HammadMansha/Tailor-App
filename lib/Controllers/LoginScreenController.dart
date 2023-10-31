import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool validateFields = false;


  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    numberController.dispose();
    passwordController.dispose();
  }
}
