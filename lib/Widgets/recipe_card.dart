import 'package:flutter/material.dart';
import 'package:vegan/Constants/sizes.dart';

//Rezeptkärtchen auf der Startseite

class RecipeCard extends StatelessWidget {
  bool isFirstBackground = true;
  String title = "";

  RecipeCard({required this.isFirstBackground, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(
        right: Sizes.paddingSmall,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            isFirstBackground ? "assets/hintergrund-1.png" : "assets/hintergrund-2.png",
          )
        ),
        borderRadius: BorderRadius.circular(Sizes.borderRadius)
      ),
      width: Sizes.widthPercent*60,
      height: Sizes.widthPercent*60*1.3,
      padding: EdgeInsets.only(
        left: Sizes.paddingBig,
        right: Sizes.paddingBig,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontFamily: "AbrilFatface Regular",
          color: Color(0xff0061E7),
          fontSize: Sizes.textSizeRegular,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
