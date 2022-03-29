import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vegan/Constants/sizes.dart';
import 'package:vegan/Data/recipe.dart';
import 'package:vegan/Pages/home.dart';
import 'package:vegan/Widgets/ingredient_line.dart';

//Zeigt das Rezept an, bietet die Möglichkeit an das Rezept zu speichern

class RecipePage extends StatefulWidget {
 late Recipe recipe;
 late bool hideButton;

 RecipePage(Recipe tempRecipe, bool tempHideButton){
   recipe = tempRecipe;
   hideButton = tempHideButton;
 }

  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFF7F2),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 50,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/hintergrund-2.png"),
                    )
                  ),
                ),
              ),
              Expanded(
                flex: 50,
                child: Container(

                ),
              )
            ],
          ),
          Column(
            children: [
              Expanded(
                flex: 40,
                child: Container(
                  alignment: Alignment.center,
                  width: Sizes.widthPercent*60,
                  padding: EdgeInsets.only(
                    top: Sizes.paddingBig
                  ),
                  child: Text(
                    widget.recipe.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "AbrilFatface Regular",
                      fontSize: Sizes.textSizeBig,
                      color: Color(0xff0061E7),
                    ),
                  ),
                )
              ),
              Expanded(
                  flex: 60,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(
                            left: Sizes.paddingRegular,
                            right: Sizes.paddingRegular,
                            top: Sizes.paddingBig,
                            bottom: Sizes.paddingBig,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xffFFF7F2),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50),
                            )
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Column(
                                  children: List.generate(widget.recipe.zutaten.length, (index) {
                                    return IngredientLine(widget.recipe.zutaten[index]);
                                  }),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    top: Sizes.paddingRegular,
                                    bottom: Sizes.widthPercent,
                                  ),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Beschreibung',
                                    style: TextStyle(
                                      fontFamily: "Poppins Bold",
                                      fontSize: Sizes.textSizeSmall,
                                      color: Color(0xff585858),
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    widget.recipe.beschreibung,
                                    style: TextStyle(
                                      fontFamily: "Poppins Regular",
                                      fontSize: Sizes.textSizeSmall,
                                      color: Color(0xff585858),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      widget.hideButton == false ? Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () async{
                              await save(widget.recipe);
                              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Home()), (Route<dynamic> route) => false);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xffFC6D4B),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(Sizes.borderRadius),
                                )
                              ),
                              alignment: Alignment.center,
                              padding: EdgeInsets.only(
                                left: Sizes.paddingBig*1.2,
                                right: Sizes.paddingBig*1.2,
                                top: Sizes.paddingRegular,
                                bottom: Sizes.paddingRegular,
                              ),
                              child: Text(
                                "Speichern",
                                style: TextStyle(
                                  fontFamily: 'Poppins Regular',
                                  fontSize: Sizes.textSizeSmall,
                                  color: Color(0xffFFFFFF),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ) : Container(),
                    ],
                  )
              )
            ],
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                left: Sizes.paddingRegular,
              ),
              child: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Icon(
                  Ionicons.chevron_back_outline,
                  color: Color(0xffFC6D4B),
                  size: Sizes.iconsSize,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> save(Recipe recipe) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> recipes = prefs.getStringList('RECIPE') ?? [];

    recipes.add(jsonEncode(recipe.toMap()));

    prefs.setStringList('RECIPE', recipes);
  }

}
