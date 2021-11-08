import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_login/SocialLogin/controller.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Sign Up Using Google',
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(
              height: 15,
            ),
            GetBuilder<Controller>(builder: (controller) {
              return Text(
                controller.googleSignUpdata.userName ?? '',
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(color: Colors.blueGrey),
              );
            }),
            SizedBox(
              height: 20,
            ),
            Obx(() {
              return controller.googleSignin.value == false
                  ? InkWell(
                      onTap: () {
                        controller.signInWithGoogle();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.blueAccent, width: 3),
                            borderRadius: BorderRadius.circular(25)),
                        child: Icon(
                          Icons.g_mobiledata,
                          size: 50,
                          color: Colors.blueAccent,
                        ),
                      ),
                    )
                  // Text('Sign In'))
                  : InkWell(
                      onTap: () {
                        controller.logOutGoogle();
                      },
                      child: Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black26, width: 3),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(child: Text('Log Out'))));
            }),
            Divider(
              height: 100,
              thickness: 5,
            ),
            // SizedBox(
            //   height: 50,
            // ),
            Text(
              'Sign Up Using Facbook',
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(
              height: 20,
            ),
            GetBuilder<Controller>(builder: (controller) {
              return Text(
                controller.facebookSignUpdata.userName ?? '',
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(color: Colors.blueGrey),
              );
            }),
            SizedBox(
              height: 20,
            ),
            Obx(() {
              return controller.facebookSignin.value == false
                  ? InkWell(
                      onTap: () {
                        controller.signInWithFacebook();
                      },
                      child: Container(
                        child: Icon(
                          Icons.facebook,
                          size: 60,
                          color: Colors.blueAccent,
                        ),
                      ),
                    )
                  // Text('Sign In'))
                  : InkWell(
                      onTap: () {
                        controller.logOutFacbook();
                      },
                      child: Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black26, width: 3),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(child: Text('Log Out'))));
            })
          ],
        ),
      ),
    );
  }
}
