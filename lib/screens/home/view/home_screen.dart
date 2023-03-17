import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/home_provider.dart';

class home_screen extends StatefulWidget {
  const home_screen({Key? key}) : super(key: key);

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {

  TextEditingController txtname = TextEditingController();
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtpasw = TextEditingController();
  TextEditingController txtcpsw = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Stepper App"),
        ),
        body: Consumer<home_provider>(
          builder: (context, value, child) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stepper(
                  steps: [
                    Step(title: Text("SignUp"),
                        content: Column(
                          children: [
                            TextField(
                              controller: txtname,
                              decoration: InputDecoration(
                                icon: Icon(Icons.person),
                                hintText: "Name: ",
                                border: OutlineInputBorder()
                              ),
                            ),
                            SizedBox(height: 10,),
                            TextField(
                              controller: txtemail,
                              decoration: InputDecoration(
                                  icon: Icon(Icons.email),
                                  hintText: "Email: ",
                                  border: OutlineInputBorder()
                              ),
                            ),
                            SizedBox(height: 10,),
                            TextField(
                              controller: txtpasw,
                              decoration: InputDecoration(
                                  icon: Icon(Icons.lock),
                                  hintText: "Name: ",
                                  border: OutlineInputBorder()
                              ),
                            ),
                            SizedBox(height: 10,),
                            TextField(
                              controller: txtcpsw,
                              decoration: InputDecoration(
                                  icon: Icon(Icons.lock),
                                  hintText: "Confirm pssword: ",
                                  border: OutlineInputBorder()
                              ),
                            ),
                          ],
                        ),
                    ),
                    Step(title: Text("Login"),
                      content: Column(
                        children: [
                          TextField(
                            controller: txtname,
                            decoration: InputDecoration(
                                icon: Icon(Icons.person),
                                hintText: "User Name: ",
                                border: OutlineInputBorder()
                            ),
                          ),
                          SizedBox(height: 10,),
                          TextField(
                            controller: txtpasw,
                            decoration: InputDecoration(
                                icon: Icon(Icons.email),
                                hintText: "Name: ",
                                border: OutlineInputBorder()
                            ),
                          ),
                        ],
                      ),
                    ),
                    Step(
                        title: Text("Home"),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Login success")
                          ],
                        ),
                    )
                  ],
                currentStep: Provider.of<home_provider>(context,listen: false).i,
                onStepContinue: () {
                  if(Provider.of<home_provider>(context,listen: false).i < 2)
                  {
                    Provider.of<home_provider>(context,listen: false).countinue();
                  }
                },
                onStepCancel: () {
                  if(Provider.of<home_provider>(context,listen: false).i > 0)
                  {
                    Provider.of<home_provider>(context,listen: false).back();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
