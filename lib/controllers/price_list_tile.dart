import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PriceListTile extends StatelessWidget {
  final String title;
  final String brand;
  final String pack;
  final String mrp;
  final String prt;
  final String prs;
  const PriceListTile(
      {Key? key,
      required this.title,
      required this.brand,
      required this.pack,
      required this.mrp,
      required this.prt,
      required this.prs})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 5),
      child: Container(
        height: 101,
        decoration: const BoxDecoration(
          color: Color(0xffFFFFFF),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.dmSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Brand:',
                          style: GoogleFonts.dmSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff8394AA),
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          brand.toString(),
                          style: GoogleFonts.dmSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const VerticalDivider(
                      color: Color(0xffD3D9E0),
                      endIndent: 3,
                      thickness: 2,
                      indent: 3,
                    ),
                    Row(
                      children: [
                        Text(
                          'Pack:',
                          style: GoogleFonts.dmSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff8394AA),
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          pack,
                          style: GoogleFonts.dmSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const VerticalDivider(
                      color: Color(0xffD3D9E0),
                      endIndent: 3,
                      thickness: 2,
                      indent: 3,
                    ),
                    Row(
                      children: [
                        Text(
                          'MRP:',
                          style: GoogleFonts.dmSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff8394AA),
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          mrp.toString(),
                          style: GoogleFonts.dmSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              IntrinsicHeight(
                child: Row(
                  children: [
                    Row(
                      children: [
                        Text(
                          'PTR:',
                          style: GoogleFonts.dmSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff8394AA),
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          prt,
                          style: GoogleFonts.dmSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const VerticalDivider(
                      color: Color(0xffD3D9E0),
                      endIndent: 3,
                      thickness: 2,
                      indent: 3,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Row(
                      children: [
                        Text(
                          'PTS:',
                          style: GoogleFonts.dmSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff8394AA),
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          prs,
                          style: GoogleFonts.dmSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
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
