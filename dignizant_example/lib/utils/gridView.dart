import 'package:dignizant_example/model/movieData.dart';
import 'package:dignizant_example/screen/details/detailsView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

gridViewList(
    {var size,
    required Function function,
    required List<Movies> movieListData}) {
  final double itemWidth = (size.width - 30) / 3;
  final double itemHeight = itemWidth - 5;
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 9),
    child: GridView.count(
      mainAxisSpacing: 5,
      physics: BouncingScrollPhysics(),
      childAspectRatio: (itemWidth / itemHeight),
      crossAxisCount: 3,
      shrinkWrap: true,
      crossAxisSpacing: 10.0,
      children: List.generate(movieListData.length, (index) {
        dynamic data = movieListData[index];
        return gridView(function, "image", data);
      }),
    ),
  );
}

Widget gridView(Function function, String image, Movies movieData) {
  return GestureDetector(
      onTap: () {
        Get.to(DetailsView(selectedMovie: movieData));
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),        /*decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(Radius.circular(10))),*/
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(movieData.bannerImageURL, width: 50, height: 50),
              SizedBox(height: 10.0),
              Text(movieData.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              Text(movieData.year, style: TextStyle(fontSize: 12)),
            ]),
      ));
}
