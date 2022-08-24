import 'dart:isolate';

import 'package:elbrit_central/components/button.dart';
import 'package:elbrit_central/models/employee_info.dart';
import 'package:elbrit_central/services/api.dart';
import 'package:elbrit_central/views/home.dart';

import 'package:elbrit_central/views/log_in_otp.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../services/global_data.dart';
import '../view_model/employee_data_view_model.dart';
import 'package:elbrit_central/main.dart';

class LogInPage extends StatefulWidget {
  LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  bool isLoading = false;
  // EmployeeModel? employeeModel;
  @override
  void initState() {
    super.initState();
    // check_if_already_login();
    // getEmployeeInfo();
    _Controller.text = "+91";
  }

  final TextEditingController _Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldkey,
        // resizeToAvoidBottomInset: false,
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                color: const Color(0xffF8FAFC),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: const Color(0xffFFFFFF),
                          ),
                          height: 200,
                          width: 200,
                          child: Image.asset(
                            'images/logo.png',
                            scale: 1.2,
                          )),
                    ),
                    // GradientText(
                    //   'Elbrit Central',
                    //   style: const TextStyle(
                    //     fontSize: 40.0,
                    //   ),
                    //   colors: const [
                    //     Color(0xff09A9ED),
                    //     Color(0xfffC55AE),
                    //     Color(0xfff4435EC)
                    //   ],
                    // ),
                    //
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  decoration: const BoxDecoration(
                      color: Color(0xffFFFFFF),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Enter Your",
                            style: GoogleFonts.roboto(
                                color: const Color(0xff191919), fontSize: 22),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10.0,
                          ),
                          child: Text(
                            "Phone Number",
                            style: GoogleFonts.roboto(
                                color: const Color(0xff191919),
                                fontSize: 22,
                                height: 0.8),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            'We will send OTP to your phone',
                            style: GoogleFonts.roboto(
                                color: const Color(0xff8394AA),
                                fontSize: 16,
                                height: 3),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 10),
                          child: Container(
                            height: 50,
                            width: 328,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: const Color(0xffEFF3F8),
                            ),
                            child: TextField(
                              controller: _Controller,
                              keyboardType: TextInputType.phone,
                              obscureText: false,
                              decoration: InputDecoration(
                                focusColor: const Color(0xffEFF3F8),
                                icon: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: const Color(0xffFFFFFF),
                                      ),
                                      height: 40,
                                      width: 40,
                                      child: Image.asset(
                                        'images/Vector-2.png',
                                        scale: 1.2,
                                      )),
                                ),
                                hintText: "Mobile Number",
                                enabledBorder: const OutlineInputBorder(
                                  // borderRadius:
                                  //     BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(
                                    color: Color(0xffEFF3F8),
                                  ),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(
                                    color: Color(0xffEFF3F8),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Visibility(
                          visible: !isLoading,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: BottomButton(
                              text: 'Get OTP',
                              disabled: false,
                              onTap: () async {
                                setState(() {
                                  isLoading = true;
                                });
                                FocusScope.of(context).unfocus();
                                final EmployeeModel? employeeModel = await Api()
                                    .getEmployeeData(
                                        mobileNo: _Controller.text);
                                print(employeeModel!.name);
                                final localDatabase = await SharedPreferences.getInstance();
                                var userID = localDatabase.setString("userId", employeeModel!.id.toString());
                                print(userID);
                                print(">>>>>>>>>>>>>>ok got it<<<<<<<<<<<<<<<<<<<");

                                if (employeeModel != null) {
                                  //final provider=Provider.of<VerifiedEmployeeDataViewModel>(context,listen: false);
                                  //provider.setTeamId(int.parse(employeeModel.team!.id.toString()));
                                  //print(provider.teamId);
                                  datosusuario=employeeModel.team!.id;
                                  datosusuarioPhone=_Controller.text;
                                  //GlobalData().setId(employeeModel.team!.id);
                                  print("Team ID"+employeeModel.team!.id.toString());
                                  print(">>>>>>>>>>>>>>ok got it<<<<<<<<<<<<<<<<<<<");

                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    duration: Duration(seconds: 2),
                                    content: Text("Otp Sent"),
                                  ));

                                  //TODO: Delete when release
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomePage()),
                                          (route) => false);

                                  //TODO: Comment out when release
                                  // Navigator.of(context).push(MaterialPageRoute(
                                  //     builder: (context) =>
                                  //         LogInOtpPage(_Controller.text)));
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    duration: Duration(seconds: 5),
                                    content: Text(
                                        " You have entered wrong Phone Number"),
                                  ));
                                }

                                setState(() {
                                  isLoading = false;
                                });
                              },
                            ),
                          ),
                          replacement: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              // Align(
              //   alignment: Alignment.center,
              //   child: Padding(
              //     padding: const EdgeInsets.only(left: 10),
              //     child: Container(
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(6),
              //           color: const Color(0xffFFFFFF),
              //         ),
              //         height: 200,
              //         width: 200,
              //         child: Image.asset(
              //           'images/logo.png',
              //           scale: 1.2,
              //         )),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
