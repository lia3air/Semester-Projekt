import 'package:flutter/material.dart';
import 'package:vegan/Constants/sizes.dart';
import 'package:vegan/Data/ingredient.dart';

//Eine Reihe, die im fertigen Rezept angezeigt wird

class IngredientLine extends StatelessWidget {
  late Ingredient ingredient;

  IngredientLine (Ingredient tempZutat){
    ingredient = tempZutat;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          margin: EdgeInsets.only(
            right: Sizes.widthPercent*2,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Sizes.borderRadius),
            color: Color(0xffFD6038),
          ),
         
        ),
        Container(
          margin: EdgeInsets.only(
            right: Sizes.widthPercent*2,
          ),
          child: Text(
            ingredient.menge.toString(),
            style: TextStyle(
              fontFamily: 'Poppins Bold',
              fontSize: Sizes.textSizeSmall,
              color: Color(0xff585858),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            right: Sizes.widthPercent*2,
          ),
          child: Text(
            convertEinheit(ingredient.einheit),
            style: TextStyle(
              fontFamily: 'Poppins Bold',
              fontSize: Sizes.textSizeSmall,
              color: Color(0xff585858),
            ),
          ),
        ),
        Expanded(
          child: Text(
            ingredient.name,
            style: TextStyle(
              fontFamily: 'Poppins Regular',
              fontSize: Sizes.textSizeSmall,
              color: Color(0xff585858),
            ),
          ),
        )
      ],

    );
  }
}
