import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:elbrit_central/controllers/app_bar.dart';
import 'package:elbrit_central/models/wall_info.dart';
import 'package:elbrit_central/views/single-wall.dart';
import 'package:elbrit_central/views/video-play.dart';
import 'package:extended_image/extended_image.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:path_provider/path_provider.dart';
import 'package:intl/intl.dart';


class WallPage extends StatefulWidget {
  WallPage({Key? key}) : super(key: key);

  @override
  State<WallPage> createState() => _WallPageState();
}

class _WallPageState extends State<WallPage> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  List<WallModel> wallModels = [];
  List<WallModel> pinnedWallModel = [];

  bool _isPlayingVideo = false;

  bool isLoading = false;

  List fileType = [
    "images/file.png",
    "images/csv.jpeg",

  ];
  @override
  void initState() {
    super.initState();
    // _controller = VideoPlayerController.network(
    //     'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
    //   ..initialize().then((_) {
    //     print("video init");
    //     // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
    //     setState(() {});
    //   });
    // _controller =
    //     VideoPlayerController.network("http://admin.elbrit.org/uploads/20220806202630.mp4");
    // getWallData = _controller.initialize();

    getWallData = getWallDataMethod();
    getWallDataMethod();
  }


  // Future<void> getWallInfo() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //
  //   wallModels.clear();
  //   pinnedWallModel.clear();
  //   final List<WallModel> walls = await Api().getWallData();
  //
  //   for (final WallModel wallModel in walls) {
  //     if (wallModel.pinPost == "1") {
  //       pinnedWallModel.add(wallModel);
  //     } else {
  //       wallModels.add(wallModel);
  //     }
  //   }
  //
  //   print(wallModels);
  //   print(pinnedWallModel);
  //
  //
  //   setState(() {
  //     isLoading = false;
  //   });
  //
  // }

  var inputFormat = DateFormat('dd/MM/yyyy HH:mm');

  var getWalldataList;
  late Future getWallData;
  getWallDataMethod() async {
    SharedPreferences localDatabase = await SharedPreferences.getInstance();
    var userID = localDatabase.getString("userId");
    //var response = await client.get(uri);
    var response = await http.get(Uri.parse('http://admin.elbrit.org/api/walls/$userID'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body.toString());
      //print(json["data"].toString());
       //getWalldataList = json["data"].toString();
       //print(getWalldataList);
      print(data["data"]);
      print(data["data"][0]["created_at"]);
      print(data["data"][0]["created_at"]);


      // print(inputFormat.parse(data["data"]));
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
          color: const Color(0xffEFF3F8),
          width: MediaQuery.of(context).size.width,
          child: FutureBuilder(
            future: getWallData,
            builder: (context, AsyncSnapshot<dynamic> snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                  //   shrinkWrap: true,
                  //   physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                      vertical: 20, horizontal: 10),
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    print(snapshot.data[0]);
                    print(snapshot.data[index]["video"]);
                    DateTime y = DateTime.parse(snapshot.data[index]["created_at"]);
                    final DateFormat formatter = DateFormat('dd-MM-yyyy, HH:mm');
                    final String formatted = formatter.format(y);
                    print(formatted);
                    return Container(
                        width: 380,
                        margin: EdgeInsets.only(bottom: 20),
                        decoration: const BoxDecoration(
                          color: Color(0xffFFFFFF),
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 12, right: 12, top: 12),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Stack(
                                          children: [
                                            SizedBox(
                                              height: 30,
                                              width: 30,
                                              child: Image.asset(
                                                'images/Vector-11.png',
                                                scale: .8,
                                              ),
                                            ),
                                            const Positioned(
                                              top: 8,
                                              left: 6,
                                              child: Center(
                                                child: Text(
                                                  'EC',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                      FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Elbrit Central',
                                          style: GoogleFonts.dmSans(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xff262930),
                                          ),
                                        ),
                                      ],
                                    ),
                                    snapshot.data[index]["pin_post"] == 1 ?
                                    Row(
                                        children: [
                                          Image.asset(
                                            'images/Vector-12.png',
                                            scale: 1,
                                          ),
                                          const SizedBox(
                                            width: 4,
                                          ),

                                          Text(
                                            'Pinned Post',
                                            style: GoogleFonts.dmSans(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color:
                                              const Color(0xff8394AA),
                                            ),
                                          )
                                        ],
                                      ): Center(),
                                  ],
                                ),
                              ),
                            snapshot.data[index]["image"].length > 0 ?
                                InkWell(
                                onTap: ()=>snapshot.data[index]["image"].length > 0 ?
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>SingleWall(singleWall: snapshot.data[index]["image"], text: snapshot.data[index]["details"],)))
                                    : null,
                                child: Container(
                                     decoration: const BoxDecoration(
                                       color: Color(0xffFFFFFF),
                                       borderRadius: BorderRadius.all(
                                         Radius.circular(12),
                                       ),
                                     ),
                                     child: Padding(
                                       padding: const EdgeInsets.only(
                                           left: 10, right: 10),
                                       child: Column(
                                         children: [
                                           const SizedBox(
                                             height: 10,
                                           ),
                                           Row(
                                             mainAxisAlignment:
                                             MainAxisAlignment
                                                 .spaceBetween,
                                             children: [
                                               Expanded(
                                                 child: Container(
                                                   height: snapshot.data[index]["image"].length > 3 ? 150 : 300,
                                                   decoration:
                                                    BoxDecoration(
                                                     borderRadius:BorderRadius.circular(12)
                                                   ),
                                                   child:  snapshot.data[index]["image"][0].isNotEmpty?  ExtendedImage.network(
                                                     "http://admin.elbrit.org/uploads/${snapshot.data[index]["image"][0]}",
                                                     fit: BoxFit.cover,
                                                   ):Center(),
                                                 ),
                                               ),
                                               SizedBox(width: 10,),
                                               if(snapshot.data[index]["image"].length > 2)
                                               Expanded(
                                                 child: Container(
                                                     height: snapshot.data[index]["image"].length > 2? 150 : 300,
                                                   margin: EdgeInsets.only(left: 10),
                                                   decoration:
                                                    BoxDecoration(
                                                       borderRadius:BorderRadius.circular(12),
                                                   ),
                                                   child: snapshot.data[index]["image"].length > 3?  ExtendedImage.network(
                                                     "http://admin.elbrit.org/uploads/${snapshot.data[index]["image"][1]}",
                                                     fit: BoxFit.cover,
                                                   ):Center(),
                                                 ),
                                               ),
                                             ],
                                           ),
                                           SizedBox(height: 10,),
                                           snapshot.data[index]["image"].length > 2 ?
                                           Row(
                                             mainAxisAlignment:
                                             MainAxisAlignment
                                                 .spaceBetween,
                                             children: [

                                                 Expanded(
                                                   child: Container(
                                                       height: 150,
                                                       decoration:
                                                         BoxDecoration(
                                                           borderRadius:BorderRadius.circular(12),
                                                       ),
                                                       child:  snapshot.data[index]["image"][2] != null? ExtendedImage.network(
                                                         "http://admin.elbrit.org/uploads/${snapshot.data[index]["image"][2]}",
                                                         fit: BoxFit.cover,
                                                       ):Center(),
                                                   ),
                                                 ),
                                                if(snapshot.data[index]["image"].length > 3)
                                                 Expanded(
                                                   child: Container(
                                                       height: 150,
                                                       margin: EdgeInsets.only(left: 10),
                                                       decoration:
                                                        BoxDecoration(
                                                         borderRadius: BorderRadius.circular(20),
                                                       ),
                                                       child: snapshot.data[index]["image"][3] != null?   ExtendedImage.network(
                                                         "http://admin.elbrit.org/uploads/${snapshot.data[index]["image"][3]}",
                                                         fit: BoxFit.cover,
                                                       ):Center(),
                                                   ),
                                                 ),
                                             ],
                                           )
                                               :Center(),
                                         ],
                                       ),
                                     ),
                                   ),
                              ):Center(),




                           SizedBox(height: 20,),
                           snapshot.data[index]["video"] != null ?
                                Stack(
                                  children: [

                                    Container(
                                      margin: EdgeInsets.only(left: 30, right: 30, ),
                                     // color: Colors.w.withOpacity(0.1),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.grey.shade200,
                                    ),
                                      width: double.infinity,
                                      height: 150,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.only(top: 50, bottom: 50, left: MediaQuery.of(context).size.width/2.4, right: 100),
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        color: Colors.blueAccent,
                                      ),
                                      child: IconButton(
                                        onPressed: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>VideoApp(video: snapshot.data[index]["video"],)));
                                          //Navigator.push(context, MaterialPageRoute(builder: (context)=>BasicPlayerPage()));
                                          print("object");
                                        },
                                        icon: Icon(Icons.play_arrow, color: Colors.white,),
                                      ),
                                    ),

                                  ],
                                ):Center(),


                            snapshot.data[index]["filenames"] != null ? SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 80,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data[index]["filenames"].lenght,
                                  itemBuilder: (_, index){
                                    var completePath = "https://admin.elbrit.org/uploads/2022081919063373.pdf";

                                    var fileName = (completePath.split('/').last);
                                    var filePath = completePath.replaceAll("/$fileName", '');


                                    print(fileName);
                                    print(filePath);
                                    return Container(
                                      width: 80,
                                      height: 80,
                                      margin: EdgeInsets.only(right: 10, left: 10),
                                      padding: EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            spreadRadius: 2,
                                            blurRadius: 6,
                                            offset: Offset(0,2),
                                            color: Colors.grey.shade200,
                                          ),
                                        ],
                                        // image: DecorationImage(
                                        //   image: AssetImage(snapshot.data[index]["filenames"] = ),
                                        //   fit: BoxFit.cover
                                        // )
                                      ),

                                    );
                                  }
                              ),
                            ):Center(),




                            //  Stack(
                            //   children: [
                            //     Container(
                            //       width: 380,
                            //       child: _controller.value.isInitialized
                            //           ? AspectRatio(
                            //         aspectRatio: _controller.value.aspectRatio,
                            //         child: VideoPlayer(_controller),
                            //       )
                            //           : Container(),
                            //     ),
                            //     Positioned(
                            //         left: MediaQuery.of(context).size.width/2.4,
                            //         right: MediaQuery.of(context).size.width/2.4,
                            //         top: 0,
                            //         bottom: 10,
                            //         child: FloatingActionButton(
                            //           backgroundColor: _isPlayingVideo? Colors.transparent: Colors.blueAccent,
                            //           child: Icon(_isPlayingVideo? Icons.play_arrow_outlined:Icons.play_arrow, color: Colors.white,),
                            //           onPressed: () {
                            //             print("Dasfds");
                            //             setState(() {
                            //               if (_controller.value.isPlaying) {
                            //                 _controller.pause();
                            //               } else {
                            //
                            //                 setState(() {
                            //                   VideoPlayerController.network(
                            //                       'https://admin.elbrit.org/uploads/${snapshot.data[index]["video"] }').play();
                            //                   _isPlayingVideo = true;
                            //                 });
                            //               }
                            //             });
                            //           },
                            //         )),
                            //   ],
                            // ):Center(),



                            // snapshot.data[index]["details"] != null?
                            //   Padding(
                            //     padding: const EdgeInsets.only(
                            //         left: 12, right: 12, top: 8),
                            //     child: Html(
                            //       data: "${snapshot.data[index]["details"]}",
                            //     ),
                            //
                            //
                            //
                            //     // Text(
                            //     //
                            //     // "${snapshot.data[index]["details"]}",
                            //     //   textAlign: TextAlign.left,
                            //     //   maxLines: 100,
                            //     //   overflow: TextOverflow.ellipsis,
                            //     //   textScaleFactor: 1.1,
                            //     //   style: GoogleFonts.dmSans(
                            //     //     fontSize: 14,
                            //     //     fontWeight: FontWeight.w400,
                            //     //     color: const Color(0xff262930),
                            //     //   ),
                            //     // ),
                            //   ):Center(),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                              height: 30,
                              padding: const EdgeInsets.only(
                                  left: 12, bottom: 10),
                              child: Text(
                               '$formatted',
                                style: GoogleFonts.dmSans(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xff8394AA),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                  },

                );
              }else if(snapshot.connectionState == ConnectionState.waiting){
                return Center(
                  child: CircularProgressIndicator(),
                );
              }else{
                return Center(
                  child: Text("No data found"),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Future<String> downloadFile(String url, String fileName, String dir) async {
    HttpClient httpClient = new HttpClient();
    File file;
    String filePath = '';
    String myUrl = '';

    try {
      myUrl = url+'/'+fileName;
      var request = await httpClient.getUrl(Uri.parse(myUrl));
      var response = await request.close();
      if(response.statusCode == 200) {
        var bytes = await consolidateHttpClientResponseBytes(response);
        filePath = '$dir/$fileName';
        file = File(filePath);
        await file.writeAsBytes(bytes);
      }
      else
        filePath = 'Error code: '+response.statusCode.toString();
    }
    catch(ex){
      filePath = 'Can not fetch url';
    }

    return filePath;
  }
}






  // child: SingleChildScrollView(
          //   child: Column(
          //     children: [
          //       const SizedBox(
          //         height: 15,
          //       ),
          //       const SizedBox(
          //         height: 15,
          //       ),
          //       Padding(
          //         padding: const EdgeInsets.only(
          //           left: 15,
          //           right: 15,
          //         ),
          //         child: Container(
          //           height: 130,
          //           width: 380,
          //           decoration: BoxDecoration(
          //             color: const Color(0xffFFFFFF),
          //             borderRadius: BorderRadius.circular(12),
          //           ),
          //           child: Padding(
          //             padding:
          //                 const EdgeInsets.only(left: 8, right: 8, top: 20),
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Row(
          //                   children: [
          //                     Stack(
          //                       children: [
          //                         Container(
          //                           height: 30,
          //                           width: 30,
          //                           child: Image.asset(
          //                             'images/Vector-11.png',
          //                             scale: .8,
          //                           ),
          //                         ),
          //                         const Positioned(
          //                           top: 8,
          //                           left: 6,
          //                           child: Center(
          //                             child: Text(
          //                               'EC',
          //                               style: TextStyle(
          //                                   color: Colors.white,
          //                                   fontWeight: FontWeight.bold),
          //                             ),
          //                           ),
          //                         ),
          //                       ],
          //                     ),
          //                     const SizedBox(
          //                       width: 10,
          //                     ),
          //                     Text(
          //                       'Elbrit Central',
          //                       style: GoogleFonts.dmSans(
          //                         fontSize: 14,
          //                         fontWeight: FontWeight.w500,
          //                         color: const Color(0xff262930),
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //                 const SizedBox(
          //                   height: 20,
          //                 ),
          //                 Row(
          //                   mainAxisAlignment: MainAxisAlignment.start,
          //                   children: [
          //                     const Icon(Icons.attachment_sharp),
          //                     const SizedBox(
          //                       width: 20,
          //                     ),
          //                     Text(
          //                       'new.pdf',
          //                       style: GoogleFonts.dmSans(
          //                         fontSize: 14,
          //                         fontWeight: FontWeight.bold,
          //                         color: const Color(0xff191919),
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //                 const SizedBox(
          //                   height: 15,
          //                 ),
          //                 Padding(
          //                   padding: const EdgeInsets.only(
          //                     left: 12,
          //                   ),
          //                   child: Text(
          //                     '20 hours ago',
          //                     style: GoogleFonts.dmSans(
          //                       fontSize: 10,
          //                       fontWeight: FontWeight.w500,
          //                       color: const Color(0xff8394AA),
          //                     ),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ),
          //       const SizedBox(
          //         height: 20,
          //       )
          //     ],
          //   ),
          // ),