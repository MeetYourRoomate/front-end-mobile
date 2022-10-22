import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "https://s3-alpha-sig.figma.com/img/e610/25e3/57b34eec3b7c4844788c8622dddf5161?Expires=1667174400&Signature=bypSqBglZeWGeR7MFyDepz9c832RPcpH8YgluShtz9ROWhaszS70BYBppiYDWJPAgFm2NLbP-jggjEAqbnctJpD8wC3tIEmhFVzraWozo4ZzCoF5Q7ag7ocAQF~xpIOLKrig6yT-YW4rJ-XmnsNeRnI1prKLGgqFGLDafDdYSNqjsqMGjsI-IPiIx7HwhTJaWVLIBq8btN3bmUAjAw-iFF8UCTJT8-CPfa-ihgr32CN13gXuCoi-~x0w6oBiLx5D3pQj~XwXBLalBvf7g4u~q~NdAo6j-ICBo~mL0P8XjOYymKeZu3iecR2iJscF0EHAhxiCjtNrxxNbyJhYQccMTA__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            verticalDirection: VerticalDirection.up,
            children: [
              Container(),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.0),
                    topRight: Radius.circular(50.0),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 35.0, bottom: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "lib/shared/assets/icon/logo.png",
                            height: 80.0,
                          ),
                          const Text(
                            "Meet Your\nRoommate",
                            style: TextStyle(
                              color: Color(0xff66030E),
                              fontSize: 34.0,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Email",
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          TextFormField(),
                          const SizedBox(
                            height: 20.0,
                          ),
                          const Text(
                            "Password",
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          TextFormField(),
                        ],
                      ),
                    ),
                    const Text(
                      "Forgot Password?",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      height: 45.0,
                      width: 200.0,
                      decoration: BoxDecoration(
                        color: const Color(0xff66030E),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: const Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Don't Have account?",
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            "Create an Account",
                            style: TextStyle(
                              color: Color(0xff66030E),
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
