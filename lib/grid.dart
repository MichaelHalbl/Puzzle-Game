import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'gridButton.dart';


class Grid extends StatelessWidget {
  var numbers = [];
  var size;
  Function clickGrid;

  Grid(this.numbers, this.size, this.clickGrid);

  @override
  Widget build(BuildContext context) {
    var height = size.height;

    return Container(
      height: height * 0.80,
      child: Padding(
          padding: EdgeInsets.all(25.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemCount: numbers.length,
            itemBuilder: (context,index){
              return numbers[index] != 0 ? gridButton("${numbers[index]}", (){
                clickGrid(index);
              }) : SizedBox.fromSize(
                size: Size(5, 5),
              );
            }
          )),
    );
  }
}
