import 'dart:convert';

import 'package:elbrit_central/controllers/app_bar.dart';
import 'package:elbrit_central/controllers/notification_tile.dart';
import 'package:elbrit_central/views/price_list.dart';
import 'package:elbrit_central/views/profile.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationPage extends StatefulWidget {
  NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final List _notifications = [
    'Hello'
        'Hello',
    'Hello',
  ];

  @override
  void initState(){
    super.initState();
    FutureNotification = getFutureNotification();

  }


  var getWalldataList;
  late Future FutureNotification;
  getFutureNotification() async {
    SharedPreferences localDatabase = await SharedPreferences.getInstance();
    var userID = localDatabase.getString("userId");
    //var response = await client.get(uri);
    var response = await http.get(Uri.parse('https://admin.elbrit.org/api/notify/$userID'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body.toString());
      //print(json["data"].toString());
      //getWalldataList = json["data"].toString();
      //print(getWalldataList);
      print(data["data"]);
      return data["data"];
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 3,
          leading: Padding(
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
          flexibleSpace: SafeArea(
            child: Container(
              child: const Padding(
                padding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: NewAppBar(),
              ),
            ),
          ),
        ),
        body: Container(
          color: const Color(0xffF8FAFC),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Notifications',
                        style: GoogleFonts.dmSans(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff8394AA),
                        ),
                      ),
                    ),
                  ),
                ),
                FutureBuilder(
                  future: FutureNotification,
                    builder: (context, AsyncSnapshot<dynamic> snapshot){
                      if(snapshot.connectionState == ConnectionState.waiting){
                        return Center(child: CircularProgressIndicator(),);
                      }else if(snapshot.hasData){
                        print("====================");
                        print(snapshot.data);
                        print("====================");
                        if(snapshot.data == 0) {
                          return const Padding(
                            padding: EdgeInsets.only(top: 50),
                            child: Center(child: Text("No Notification"),),
                          );
                        }else{
                          return ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                return NotificationTile(
                                    title: snapshot
                                        .data[index]["data"]["name"] != null
                                        ? "${snapshot
                                        .data[index]["data"]["name"]}"
                                        : "",
                                    body: " ${snapshot
                                        .data[index]["data"]["message"]}"
                                );
                                //return NotificationTile();
                              });

                        }
                      }else{
                        return Center(child: Text("You have no Notification"),);
                      }
                    }
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
