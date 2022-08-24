import 'package:elbrit_central/components/search_bar.dart';
import 'package:elbrit_central/controllers/app_bar.dart';
import 'package:elbrit_central/controllers/price_list_tile.dart';
import 'package:elbrit_central/models/price_info.dart';
import 'package:elbrit_central/services/api.dart';

import 'package:elbrit_central/views/profile.dart';

import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../view_model/employee_data_view_model.dart';

class PriceListPage extends StatefulWidget {
  PriceListPage({Key? key}) : super(key: key);

  @override
  State<PriceListPage> createState() => _PriceListPageState();
}

class _PriceListPageState extends State<PriceListPage> {
  //List<Data> priceModels = [];
  List<Data> priceList = [];
  TextEditingController _search = TextEditingController();
  @override
  void initState() {
    super.initState();
    getPriceInfoFutuer = getPriceInfo();
  }

  Future? getPriceInfoFutuer;
   getPriceInfo() async {
    //final provider=Provider.of<VerifiedEmployeeDataViewModel>(context,listen: false);
    //priceModels = await Api().getPriceData();
    //print(provider.teamId.toString());
    final list = await Api().getPriceData();//provider.teamId.toString());
    //priceList=list;
    print('productModels: ${priceList.length}');
    setState(() {priceList=list;});
    return list;
    //provider.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //getPriceInfo();
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
        body: FutureBuilder(
          future: getPriceInfoFutuer,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }else if(snapshot.hasData){
            return Container(
              color: const Color(0xffF8FAFC),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
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
                          onChanged: (value)=>setState(() {

                          }),
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
                      ),
                    ),
                    priceList.length!=0?ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        //itemCount: priceModels.length,
                        itemCount: priceList.length,
                        itemBuilder: (context, index) {
                          String name = priceList[index].productName!;
                          if(_search.text.isEmpty) {
                            return PriceListTile(
                              // title: priceModels[index].productName!,
                              // textRate: priceModels[index].mrp!,
                              // pack: priceModels[index].pack!,
                              // mrp: priceModels[index].mrp!,
                              // prt: priceModels[index].ptr!,
                              // prs: priceModels[index].pts!,

                              title: priceList[index].productName!,
                              brand: priceList[index].brandName!.toString(),
                              pack: priceList[index].pack!,
                              mrp: priceList[index].mrp!.toString(),
                              prt: priceList[index].ptr!,
                              prs: priceList[index].pts!,
                            );
                          }else if(name.toLowerCase().contains(_search.text.toLowerCase())){
                            return PriceListTile(
                              // title: priceModels[index].productName!,
                              // textRate: priceModels[index].mrp!,
                              // pack: priceModels[index].pack!,
                              // mrp: priceModels[index].mrp!,
                              // prt: priceModels[index].ptr!,
                              // prs: priceModels[index].pts!,

                              title: priceList[index].productName!,
                              brand: priceList[index].mrp!.toString(),
                              pack: priceList[index].pack!,
                              mrp: priceList[index].mrp!.toString(),
                              prt: priceList[index].ptr!,
                              prs: priceList[index].pts!,
                            );
                          }else{
                            return Container();
                          }
                        }):Align(alignment: Alignment.center,child: Center(child: const Text("There is no data to show"))),
                  ],
                ),
              ),
            );
          }else{
            return Center(
              child: Text("No data found"),
            );
          }
        },

        )
      ),
    );
  }

  searchProduct(String value) {
    if (value.isNotEmpty) {
      final suggesion = priceList.where((productName) {
        final productTitle =productName.productName;
        final input = value.toUpperCase();
        return productTitle!.contains(input);
      }).toList();
      setState(() {
        priceList = suggesion.toList();
      });
    }
  }
}
