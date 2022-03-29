import 'package:flutter/material.dart';
import 'package:vegan/Constants/sizes.dart';
import 'package:vegan/Widgets/ingredient_input_widget.dart';
import 'input_widget.dart';

//Hält alle Inputs für Zutaten, die Beschreibung und den Titel

class IngredientsWidget extends StatefulWidget {

  String description = "";
  String titel = "";
  List<IngredientInputWidget> inputs = [];

  @override
  _IngredientsWidgetState createState() => _IngredientsWidgetState();
}

class _IngredientsWidgetState extends State<IngredientsWidget> {


  @override
  void initState() {
    widget.inputs.add(IngredientInputWidget());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Titel",
          style: TextStyle(
            fontFamily: "Poppins Regular",
            fontSize: Sizes.textSizeSmall,
            color: Color(0xff585858),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: Sizes.paddingSmall,
            bottom: Sizes.paddingSmall,
          ),
          child: InputWidget(
            maxLines: 1,
            color: Color(0xffEFE2D9),
            focusedColor: Color(0xffEAD9CD),
            textColor: Color(0xff585858),
            textInputType: TextInputType.multiline,
            onFocusChanged: (bool isFocused){

            },
            onInputChanged: (String value){
              widget.titel = value;
            },
            onInputSubmitted: (String value){
              widget.titel = value;
            },
            onReset: (){
              return true;
            },
          ),
        ),
        Container(
          margin: EdgeInsets.only(
              bottom: Sizes.paddingSmall
          ),
          child: Text(
            "Zutaten",
            style: TextStyle(
              fontFamily: "Poppins Regular",
              fontSize: Sizes.textSizeSmall,
              color: Color(0xff585858),
            ),
          ),
        ),
        Column(
          children: widget.inputs
        ),
        GestureDetector(
          onTap: (){
            setState(() {
              widget.inputs.add(IngredientInputWidget());
            });
            print(widget.inputs.length);
          },
          child: Container(
            alignment: Alignment.center,
            height: Sizes.widthPercent*10,
            width: Sizes.widthPercent*10,
            margin: EdgeInsets.only(
              top: Sizes.paddingSmall,
              bottom: Sizes.textSizeBig,
            ),
            decoration: BoxDecoration(
              color: Color(0xffEFE2D9),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(100),
                topRight: Radius.circular(100),
                bottomRight: Radius.circular(100),
                bottomLeft: Radius.circular(100),
              ),
            ),
            child: Text(
              '+',
              style: TextStyle(
                color: Color(0xffFC6D4B),
                fontFamily: 'Poppins Bold'
              ),
            ),
          ),
        ),
        Text(
          "Beschreibung",
          style: TextStyle(
            fontFamily: "Poppins Regular",
            fontSize: Sizes.textSizeSmall,
            color: Color(0xff585858),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: Sizes.paddingSmall,
          ),
          child: InputWidget(
            maxLines: 10,
            color: Color(0xffEFE2D9),
            focusedColor: Color(0xffEAD9CD),
            textColor: Color(0xff585858),
            textInputType: TextInputType.multiline,
            onFocusChanged: (bool isFocused){

            },
            onInputChanged: (String value){
               widget.description = value;
            },
            onInputSubmitted: (String value){
              widget.description = value;
            },
            onReset: (){
              return true;
            },
          ),
        ),
      ],
    );
  }
}
