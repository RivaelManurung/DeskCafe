import 'package:fashio_app/controllers/users/authentication.dart';
import 'package:fashio_app/users/authentication/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
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
                          //email-password-login btn
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

                                //email
                                TextFormField(
                                  controller: _emailController,
                                  validator: (val) =>
                                      val == "" ? "Please write email" : null,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.email,
                                      color: Colors.black,
                                    ),
                                    hintText: "email ....",
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
                                      await _authenticationController.register(
                                        name: _nameController.text.trim(),
                                        email: _emailController.text.trim(),
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
                                                "Sign Up",
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
                                " Have an Account?",
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.to(LoginScreen());
                                },
                                child: const Text(
                                  "SignIn Here",
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
                              color: Colors.grey,
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
