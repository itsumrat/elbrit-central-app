import 'package:extended_image/extended_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SingleWall extends StatefulWidget {
  final List singleWall;
  final String text;
  const SingleWall({Key? key, required this.singleWall, required this.text}) : super(key: key);

  @override
  State<SingleWall> createState() => _SingleWallState();
}

class _SingleWallState extends State<SingleWall> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.singleWall);
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black87.withOpacity(0.5),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(onPressed: ()=>Navigator.pop(context), icon: Icon(Icons.cancel, color: Colors.white,)),
              ),
              SizedBox(height: 20,),

              Padding(
                padding: const EdgeInsets.only(  right: 20, bottom: 20),
                child: Text("${widget.text}",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),

              Expanded(child: Container(
                margin: EdgeInsets.only(bottom: 20),
                child: ListView.builder(
                  itemCount: widget.singleWall.length,
                    itemBuilder: (context, index){
                      return  Column(
                        children: [
                          ExtendedImage.network(
                            "http://admin.elbrit.org/uploads/${widget.singleWall[index]}",
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 20,)
                        ],
                      );
                    }
                ),
              ))


            ],
          ),
        ),
      ),
    );
  }
}
