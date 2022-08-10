import 'package:elbrit_central/components/search_bar.dart';
import 'package:elbrit_central/controllers/app_bar.dart';
import 'package:elbrit_central/controllers/product_tile.dart';
import 'package:elbrit_central/models/product_info.dart';
import 'package:elbrit_central/services/api.dart';
import 'package:elbrit_central/views/product_details.dart';

import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<ProductModel> productModels = [];
  TextEditingController _search = TextEditingController();

  @override
  void initState() {
    super.initState();
    getProductFeatuers = getProductInfo();
  }

   late Future getProductFeatuers;
  getProductInfo() async {
    productModels = await Api().getProducts();
    print('productModels: ${productModels.length}');
    setState(() {});
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
        body: productModels.length!=0?Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 10, bottom: 10),
                  child: Container(
                    height: 36,
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: const Color(0xffE9EEF3), width: 1),
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffE9EEF3),
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      controller: _search,
                      onChanged: (value){
                        setState(() {

                        });
                      },
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.search,
                        ),
                        hintText: "Search Product",
                        contentPadding: EdgeInsets.only(left: 10, right: 10,),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10,),
                          borderSide: BorderSide(
                            width: 1, color: Colors.grey
                          )
                        )
                      ),
                    ),
                    // child: IconButton(
                    //   icon: const Align(
                    //       alignment: Alignment.topLeft,
                    //       child: Icon(Icons.search)),
                    //   onPressed: () {
                    //     showSearch(
                    //         context: context, delegate: CustomSearchDelegate());
                    //   },
                    // ),
                  ),
                ),
                productModels.isNotEmpty?ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: productModels.length,
                    itemBuilder: (context, index) {
                      String name = productModels[index].productName!;
                      print(productModels[index].cartonImage!);
                      if(_search.text.isEmpty){
                        return GestureDetector(
                          child: ProductTile(
                            picture:
                            "http://admin.elbrit.org/uploads/carton/${productModels[index].cartonImage!}",
                            title: productModels[index].productName!,
                            brandPromo: productModels[index].others!,
                            medicineName: productModels[index].labelClaim!,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (
                                    context,
                                    ) =>
                                    ProductDetails(
                                      // id: productModels[index].id.toString(),
                                      productModel: productModels[index],
                                      // productModels: productModels[index],
                                    ),
                              ),
                            );
                          },
                        );
                      }else if(name.toLowerCase().contains(_search.text.toLowerCase())){
                        return GestureDetector(
                          child: ProductTile(
                            picture:
                            "http://admin.elbrit.org/uploads/carton/${productModels[index].cartonImage!}",
                            title: productModels[index].productName!,
                            brandPromo: productModels[index].others!,
                            medicineName: productModels[index].labelClaim!,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (
                                    context,
                                    ) =>
                                    ProductDetails(
                                      // id: productModels[index].id.toString(),
                                      productModel: productModels[index],
                                      // productModels: productModels[index],
                                    ),
                              ),
                            );
                          },
                        );
                      }else{
                         return Container();
                      }


                    }):Center(child: const Text("There is no data to show")),
              ],
            ),
          ),
        ):Center(child: CircularProgressIndicator()),
      ),
    );
  }

  searchProduct(String value) {
    if (value.isNotEmpty) {
      final suggesion = productModels.where((product) {
        final productTitle = product.productName;
        final input = value.toLowerCase();
        return productTitle!.contains(input);
      }).toList();
      setState(() {
        productModels = suggesion.toList();
      });
    }
  }
}
