import 'package:elbrit_central/views/product_details.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductTile extends StatelessWidget {
  final String picture;
  final String title;
  final String brandPromo;
  final String medicineName;
  const ProductTile(
      {Key? key,
      required this.picture,
      required this.title,
      required this.brandPromo,
      required this.medicineName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 5,
        bottom: 5,
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xffFFFFFF),
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: Row(children: [
          Container(
            height: 50,
            width: 50,
            child: Center(
              child: ExtendedImage.network(
                picture,
                scale: 5,
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                // productModels.isNotEmpty
                //     ? productModels[0].productName!
                //     :
                title,
                style: GoogleFonts.dmSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff262930),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                // productModels.isNotEmpty
                //     ? productModels[0].productUniqueness!
                //     :

                brandPromo,
                style: GoogleFonts.dmSans(
                    fontSize: 12, color: const Color(0xff8394AA)),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                // productModels.isNotEmpty
                //     ? productModels[0].labelClaim!
                //     :
                medicineName,
                style: GoogleFonts.dmSans(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff262930),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
