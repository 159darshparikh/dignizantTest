import 'package:dignizant_example/screen/home/homeController.dart';
import 'package:dignizant_example/utils/gridView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  var _controller = Get.put(HomeController());

  @override
  void initState() {
    _controller.callAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("Movie list")),
      body: SafeArea(
        child: GetBuilder<HomeController>(builder: (_controller){
          return SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  gridViewList(function: (){},size: size,movieListData: _controller.movieData)
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}