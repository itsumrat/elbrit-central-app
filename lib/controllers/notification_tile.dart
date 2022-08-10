import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationTile extends StatelessWidget {
  final String title;
  final String body;
  final bool isRead;
  NotificationTile({
     this.title = "",
    required this.body,
     this.isRead = true,

});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      color: isRead ? Color(0xffFFFFFF) : Colors.grey.shade200,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      child: Image.asset(
                        'images/logo.png',
                        scale: .8,
                      ),
                    ),
                    // const Positioned(
                    //   top: 8,
                    //   left: 6,
                    //   child: Center(
                    //     child: Text(
                    //       'EB',
                    //       style: TextStyle(
                    //           color: Colors.white, fontWeight: FontWeight.bold),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "$title",
                              style: GoogleFonts.dmSans(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff262930),
                              ),
                            ),
                            TextSpan(
                              text:
                                  "$body",
                              style: GoogleFonts.dmSans(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff262930),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      // Align(
                      //   alignment: Alignment.topLeft,
                      //   child: Text(
                      //     '20 hours ago',
                      //     style: GoogleFonts.dmSans(
                      //       fontSize: 10,
                      //       fontWeight: FontWeight.w500,
                      //       color: const Color(0xff8394AA),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            height: 4,
            color: Color(0xffE9EEF3),
          )
        ],
      ),
    );
  }
}
