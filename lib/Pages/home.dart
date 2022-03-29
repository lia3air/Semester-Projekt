import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vegan/Constants/sizes.dart';
import 'package:vegan/Data/recipe.dart';
import 'package:vegan/Pages/input_manuell.dart';
import 'package:vegan/Pages/recipe_page.dart';
import 'package:vegan/Widgets/recipe_card.dart';
import 'input_link.dart';

//Die Startseite der App

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Recipe> saved = [];

  @override
  void initState() {

    getSavedRecipes().then((List<Recipe> recipes){
      setState(() {
        saved = recipes;
        saved = saved.reversed.toList();
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Sizes().initialize(context);
    return Scaffold(
      backgroundColor: Color(0xffFFF7F2),
      body: Container(
        child: Stack(
          children: [
            Positioned(
              top: -110,
              left:-110,
              child: Image.asset('assets/hintergrund-bubble.png')
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              child: Container(
                padding: EdgeInsets.only(
                  left: Sizes.paddingRegular,
                  top:90,
                ),
                child: Text(
                  "Deine letzten\nRezepte",
                  style: TextStyle(
                    fontFamily: "AbrilFatface Regular",
                    fontSize: Sizes.textSizeBig,
                    color: Color(0xff0061E7),
                  ),
                )
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: Sizes.widthPercent*60*1.3,
                  margin: EdgeInsets.only(
                    left: Sizes.paddingRegular,
                  ),
                  child: ListView.builder(
                    itemCount: saved.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder:(BuildContext c, int index){
                      return GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => RecipePage(saved[index], true)));
                        },
                        child: RecipeCard(
                          isFirstBackground: index % 2 == 0,
                          title: saved[index].title,
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: (){
                        showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(Sizes.borderRadius),
                              topRight: Radius.circular(Sizes.borderRadius),
                            )
                          ),
                          context: context,
                          builder: (context) {
                            return Container(
                              decoration: BoxDecoration(
                                color: Color(0xffFFF7F2),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(Sizes.borderRadius),
                                  topRight: Radius.circular(Sizes.borderRadius),
                                )
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      top: Sizes.paddingBig,
                                    ),
                                    width: Sizes.widthPercent*60,
                                    child: Text(
                                      'Wie möchtest du dein Rezept eingeben?',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xff0061E7),
                                        fontFamily: 'AbrilFatface Regular',
                                        fontSize: Sizes.textSizeRegular
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap:(){
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => InputLink()));
                                     },
                                    child: Container(
                                      width:double.infinity,
                                      padding: EdgeInsets.only(
                                          left: Sizes.paddingSmall,
                                          right: Sizes.paddingSmall,
                                          bottom: Sizes.paddingSmall,
                                          top: Sizes.paddingSmall
                                      ),
                                      margin: EdgeInsets.only(
                                        left: Sizes.paddingRegular,
                                        right: Sizes.paddingRegular,
                                        top: Sizes.paddingRegular
                                      ),
                                      decoration: BoxDecoration(
                                          color: Color(0xffFC6D4B),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(Sizes.borderRadius),
                                            topRight: Radius.circular(Sizes.borderRadius),
                                            bottomLeft: Radius.circular(Sizes.borderRadius),
                                            bottomRight: Radius.circular(Sizes.borderRadius),
                                          )
                                      ),

                                      child: Text(
                                        'Link eingeben',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xffFFFFFF),
                                            fontFamily: 'Poppins Regular',

                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap:(){
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => InputManuell()));
                                    },
                                    child: Container(
                                      width:double.infinity,
                                      padding: EdgeInsets.only(
                                          left: Sizes.paddingSmall,
                                          right: Sizes.paddingSmall,
                                          bottom: Sizes.paddingSmall,
                                          top: Sizes.paddingSmall
                                      ),
                                      margin: EdgeInsets.only(
                                          left: Sizes.paddingRegular,
                                          right: Sizes.paddingRegular,
                                          bottom: Sizes.paddingBig,
                                          top: Sizes.paddingRegular
                                      ),
                                      decoration: BoxDecoration(
                                          color: Color(0xffFC6D4B),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(Sizes.borderRadius),
                                            topRight: Radius.circular(Sizes.borderRadius),
                                            bottomLeft: Radius.circular(Sizes.borderRadius),
                                            bottomRight: Radius.circular(Sizes.borderRadius),
                                          )
                                      ),

                                      child: Text(
                                        'Manuell eingeben',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xffFFFFFF),
                                          fontFamily: 'Poppins Regular',

                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          }
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xffFC6D4B),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(Sizes.borderRadius),
                          )
                        ),
                        margin: EdgeInsets.only(
                          top: Sizes.paddingBig,
                        ),
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(
                          left: Sizes.paddingBig,
                          right: Sizes.paddingBig,
                          top: Sizes.paddingRegular,
                          bottom: Sizes.paddingRegular,

                        ),
                        child: Text(
                          "Neues Rezept",
                          style: TextStyle(
                            fontFamily: 'Poppins Regular',
                            fontSize: Sizes.textSizeSmall,
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        )
      ),
    );
  }

  Future<List<Recipe>> getSavedRecipes() async{
    List<Recipe> recipes = [];

    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> result = prefs.getStringList('RECIPE') ?? [];

    for(int i = 0; i<result.length; i++){
      Map<String, dynamic> mapResult = jsonDecode(result[i]);
      recipes.add(Recipe.fromMap(mapResult));
    }

    return recipes;
  }

}
