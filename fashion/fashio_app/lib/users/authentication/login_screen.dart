import 'package:fashio_app/controllers/users/authentication.dart';
import 'package:fashio_app/users/authentication/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthenticationController _authenticationController =
      Get.put(AuthenticationController());
  var isObsecure = true.obs;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: LayoutBuilder(builder: (context, cons) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: cons.maxHeight,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //login screen header
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 285,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      image: DecorationImage(
                        image: AssetImage("images/logo.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                //login screen sign-in form
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.all(
                          Radius.circular(60),
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 8,
                            color: Colors.black26,
                            offset: Offset(0, -3),
                          )
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 30, 30, 8),
                      child: Column(
                        children: [
                          //name-password-login btn
                          Form(
                            key: formKey,
                            child: Column(
                              children: [
                                //name
                                TextFormField(
                                  controller: _nameController,
                                  validator: (val) =>
                                      val == "" ? "Please write name" : null,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: Colors.black,
                                    ),
                                    hintText: "name ....",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: const BorderSide(
                                          color: Colors.white60),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: const BorderSide(
                                          color: Colors.white60),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: const BorderSide(
                                          color: Colors.white60),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: const BorderSide(
                                          color: Colors.white60),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 25,
                                      vertical: 6,
                                    ),
                                    fillColor: Colors.white,
                                    filled: true,
                                  ),
                                ),

                                const SizedBox(
                                  height: 18,
                                ),

                                //password
                                Obx(
                                  () => TextFormField(
                                    controller: _passwordController,
                                    obscureText: isObsecure.value,
                                    validator: (val) => val == ""
                                        ? "Please write password"
                                        : null,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.vpn_key_sharp,
                                        color: Colors.black,
                                      ),
                                      suffixIcon: Obx(() => GestureDetector(
                                            onTap: () {
                                              isObsecure.value =
                                                  !isObsecure.value;
                                            },
                                            child: Icon(
                                              isObsecure.value
                                                  ? Icons.visibility_off
                                                  : Icons.visibility,
                                              color: Colors.black,
                                            ),
                                          )),
                                      hintText: "password ....",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                            color: Colors.white60),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                            color: Colors.white60),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                            color: Colors.white60),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                            color: Colors.white60),
                                      ),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        horizontal: 25,
                                        vertical: 6,
                                      ),
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                  ),
                                ),

                                const SizedBox(
                                  height: 18,
                                ),

                               Material(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(30),
                                  child: InkWell(
                                    onTap: () async {
                                      await _authenticationController.login(
                                        name: _nameController.text.trim(),
                                        password:
                                            _passwordController.text.trim(),
                                      );
                                    },
                                    borderRadius: BorderRadius.circular(30),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 10,
                                        horizontal: 20,
                                      ),
                                      child: Obx(() {
                                        return _authenticationController
                                                .isLoading.value
                                            ? CircularProgressIndicator(
                                                color: Colors.white,
                                              )
                                            : Text(
                                                "Login",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                ),
                                              );
                                      }),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(
                            height: 16,
                          ),
                          //dont have an account button - button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Dont Have an Account?",
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.to(SignUpScreen());
                                },
                                child: const Text(
                                  "SignUp Here",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          Text(
                            "Or",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),

                          //are you an admin - button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Are you an Admin",
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "Click Here",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
