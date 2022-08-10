import 'package:carousel_slider/carousel_slider.dart';
import 'package:elbrit_central/controllers/text_tile.dart';
import 'package:elbrit_central/models/price_info.dart';
import 'package:elbrit_central/models/product_info.dart';
import 'package:elbrit_central/services/api.dart';
import 'package:extended_image/extended_image.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetails extends StatefulWidget {
  ProductDetails({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  final ProductModel productModel;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool isLoading = false;

  late ProductModel productModels;
  @override
  void initState() {
    super.initState();
    // getProductInfo(id: widget.id);
    productModels = widget.productModel;
  }

  Future<void> getProductInfo({required String id}) async {
    setState(() {
      isLoading = true;
    });
    print(id);
    productModels = await Api().getProductData(id: id);
    print(productModels);
    setState(() {
      isLoading = false;
    });
  }

  // List titles = [
  //   // "Contains anywhere between 2 to 5 lines",
  //   // " Example 1:",
  //   // "Each film coated tablet contains",
  //   "Contains anywhere between 2 to 5 lines. Example 1 : Each film coated tablet contains Telmisartan IP 40mg Each hard gelatin capsule contains Atorvastatin IP 10mg Clopidogerol IP 75mg Aspirin IP 75 mg"
  // ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          title: const Text(
            "Product Details",
            style: TextStyle(color: Colors.black),
          ),
          elevation: 1,
          backgroundColor: const Color(0xffFFFFFF),
        ),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            height: 300,
                            width: double.infinity,
                            child: CarouselSlider(
                              items: [
                                productModels.cartonImage != null
                                    ? ExtendedImage.network(
                                        "http://admin.elbrit.org/uploads/carton/${productModels.cartonImage!}",

                                        // productModels[0].tabletImage![0],
                                        fit: BoxFit.cover,
                                      )
                                    : Image.asset(
                                        'images/img_7.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                productModels.cartonImage != null
                                    ? ExtendedImage.network(
                                        "http://admin.elbrit.org/uploads/strip/${productModels.stripImage!}",

                                        // productModels[0].tabletImage![0],
                                        fit: BoxFit.cover,
                                      )
                                    : Image.asset(
                                        'images/img_8.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                productModels.cartonImage != null
                                    ? ExtendedImage.network(
                                        "http://admin.elbrit.org/uploads/tablet/${productModels.tabletImage!}",

                                        // productModels[0].tabletImage![0],
                                        fit: BoxFit.cover,
                                      )
                                    : Image.asset(
                                        'images/img_9.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                productModels.cartonImage != null
                                    ? ExtendedImage.network(
                                        "http://admin.elbrit.org/uploads/logo/${productModels.logoImage!}",

                                        // productModels[0].tabletImage![0],
                                        fit: BoxFit.cover,
                                      )
                                    : Image.asset(
                                        'images/img_7.jpg',
                                        fit: BoxFit.cover,
                                      ),
                              ],
                              options: CarouselOptions(
                                autoPlay: true,
                                height: 360,
                                viewportFraction: 1,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            child: Container(
                              padding: EdgeInsets.only(left: 20),
                              color: Color(0xff191919).withOpacity(.6),
                              height: 48,
                              width: MediaQuery.of(context).size.width,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Tablet Image',
                                  style: GoogleFonts.dmSans(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 15),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  productModels.productName != null
                                      ? productModels.productName!
                                      : 'TELBRIT',
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
                                  productModels.productUniqueness != null
                                      ? productModels.productUniqueness!
                                      : 'Uniqueness of the product:',
                                  style: GoogleFonts.dmSans(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff8394AA)),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  productModels.others != null
                                      ? productModels.others!
                                      : 'The only brand that has ALA 200mg.',
                                  style: GoogleFonts.dmSans(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff191919)),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Type of Product:',
                                  style: GoogleFonts.dmSans(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff8394AA)),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  productModels.others != null
                                      ? productModels.others!
                                      : 'Medicine',
                                  style: GoogleFonts.dmSans(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff191919)),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Label Claim:',
                                  style: GoogleFonts.dmSans(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff8394AA)),
                                ),

                                const SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  productModels.labelClaim != null
                                      ? productModels.labelClaim!
                                      : 'Medicine',
                                  style: GoogleFonts.dmSans(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff191919)),
                                ),
                                // ListView.builder(
                                //     physics: const NeverScrollableScrollPhysics(),
                                //     shrinkWrap: true,
                                //     itemCount: titles.length,
                                //     itemBuilder: (context, index) {
                                //       return TextTile(
                                //           title: productModels[0].labelClaim!);
                                //     }),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
