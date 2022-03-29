import 'package:flutter/material.dart';
import 'package:vegan/Constants/sizes.dart';
import 'package:vegan/Data/ingredient.dart';
import 'input_widget.dart';

typedef void VoidCallback();

//Eingabefeld für eine Zutat

class IngredientInputWidget extends StatefulWidget {

  int quantity = 0;
  Unit unit = Unit.gramm;
  String ingredient = '';

  Ingredient getIngredient (){
    return new Ingredient((quantity),ingredient , unit);
  }

  @override
  _IngredientInputWidgetState createState() => _IngredientInputWidgetState();
}

class _IngredientInputWidgetState extends State<IngredientInputWidget> {


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: Sizes.paddingSmall,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              child: InputWidget(
                color: Color(0xffEFE2D9),
                focusedColor: Color(0xffEAD9CD),
                textColor: Color(0xff585858),
                textInputType: TextInputType.number,
                onFocusChanged: (bool isFocused){

                },
                onInputChanged: (String value){
                  widget.quantity = int.parse(value);
                },
                onInputSubmitted: (String value){
                  widget.quantity = int.parse(value);
                },
                onReset: (){
                  return true;
                },
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              right: Sizes.paddingSmall,
              left: Sizes.widthPercent
            ),
            padding: EdgeInsets.only(
              left: Sizes.paddingSmall,
              right: Sizes.paddingSmall
            ),
            decoration: BoxDecoration(
              color: Color(0xffEFE2D9),
              borderRadius: BorderRadius.circular(Sizes.width),
            ),
            child: DropdownButton<Unit>(
              underline: SizedBox(),
              borderRadius: BorderRadius.circular(Sizes.borderRadius),

              style: TextStyle(
                fontFamily: "Poppins Regular",
                fontSize: Sizes.textSizeSmall,
                color: Color(0xff585858),
              ),
                value: widget.unit,
                onChanged: (Unit? newEinheit){
                  setState(() {
                    widget.unit = newEinheit!;
                  });
                },
                items: List.generate(Unit.values.length, (index){
                  return DropdownMenuItem(
                    value: Unit.values[index],
                    child: Text(
                      convertEinheit(Unit.values[index]),
                    ),
                  );
                })
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              child: InputWidget(
                color: Color(0xffEFE2D9),
                focusedColor: Color(0xffEAD9CD),
                textColor: Color(0xff585858),
                onFocusChanged: (bool isFocused){

                },
                onInputChanged: (String value){
                  widget.ingredient = value;
                },
                onInputSubmitted: (String value){
                  widget.ingredient = value;
                },
                onReset: (){
                  return true;
                },
              ),
            ),
          ),
        ],

      ),
    );
  }
}

