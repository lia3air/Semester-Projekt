import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:vegan/Constants/sizes.dart';
import 'package:vegan/Data/recipe.dart';
import 'package:vegan/Data/ingredient.dart';
import 'package:vegan/Pages/recipe_page.dart';
import 'package:vegan/Widgets/ingredient_input_widget.dart';
import 'package:vegan/Widgets/ingredients_widget.dart';
import 'package:vegan/Widgets/input_widget.dart';

//Die Seite, auf der man manuell das Rezept eingibt

class InputManuell extends StatefulWidget {


  IngredientsWidget ingredientsWidget = IngredientsWidget();

  @override
  _InputManuellState createState() => _InputManuellState();
}

class _InputManuellState extends State<InputManuell> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xffFFF7F2),
        body: Column(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                child:Stack(
                  children: [
                    Positioned(
                        top: -150,
                        left:-110,
                        child: Image.asset('assets/hintergrund-bubble.png')
                    ),
                    Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: SafeArea(
                          child: Container(
                            padding: EdgeInsets.only(
                                left: Sizes.paddingRegular
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    bottom: Sizes.paddingSmall,
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
                                Text(
                                  "Rezept\neingeben",
                                  style: TextStyle(
                                    fontFamily: "AbrilFatface Regular",
                                    fontSize: Sizes.textSizeBig,
                                    color: Color(0xff0061E7),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: Sizes.paddingSmall
                ),
                child: SingleChildScrollView(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(
                        left: Sizes.paddingRegular,
                        right: Sizes.paddingRegular
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Container(
                          margin: EdgeInsets.only(
                            bottom: Sizes.paddingSmall,
                          ),
                          child: Text(
                            "Manuell eingeben ",
                            style: TextStyle(
                              fontFamily: "AbrilFatface Regular",
                              fontSize: Sizes.textSizeRegular,
                              color: Color(0xffFC6D4B),
                            ),
                          ),
                        ),

                        widget.ingredientsWidget,
                        SizedBox(
                          height: Sizes.heightPercent * 25,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: (){

                            List<IngredientInputWidget> inputs = widget.ingredientsWidget.inputs;
                            String description = widget.ingredientsWidget.description;
                            String title = widget.ingredientsWidget.titel;
                            List<Ingredient> ingredients = [];

                            for (int i = 0; i< inputs.length; i++){
                              ingredients.add(inputs[i].getIngredient());
                            }

                            // Hier wird das Rezept konvertiert

                            Recipe recipe = new Recipe(
                              description,
                              ingredients,
                              title,
                            );
                            recipe.convert();

                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => RecipePage(recipe, false)));
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
                              "Fertig",
                              style: TextStyle(
                                fontFamily: 'Poppins Regular',
                                fontSize: Sizes.textSizeSmall,
                                color: Color(0xffFFFFFF),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
            )

          ],
        ),
      ),
    );
  }
}
