import 'package:vegan/Data/recipe.dart';

import 'ingredient.dart';

//Datenbank

class Data {

  static final Map<List<String>, dynamic> ingredientData = {
    ['butter']: {
      'name': 'Rein pflanzliche Margarine',
      'conversionFactor': 1,
      'keepUnit': true,
      'newUnit': Unit.gramm
    },
    ['ei', 'eier']: {
      'name': 'Seidentofu',
      'conversionFactor': 60,
      'keepUnit': false,
      'newUnit': Unit.gramm
    },
    ['milch']: {
      'name': 'Sojamilch, Hafermilch oder Nussmilch Drink',
      'conversionFactor': 1,
      'keepUnit': true,
      'newUnit': Unit.gramm
    },
    ['quark']: {
      'name': 'gesiebter Sojajoghurt',
      'conversionFactor': 1,
      'keepUnit': true,
      'newUnit': Unit.gramm
    },
    ['frischkäse']: {
      'name': 'Sojasahne oder Sojajoghurt + Gewürze, Öl und Salz',
      'conversionFactor': 1,
      'keepUnit': true,
      'newUnit': Unit.gramm
    },
    ['streukäse']: {
      'name': 'Hefeflocke oder Vegane Alternative',
      'conversionFactor': 1,
      'keepUnit': true,
      'newUnit': Unit.gramm
    },
    ['parmesan']: {
      'name': 'Cashews',
      'conversionFactor': 1,
      'keepUnit': true,
      'newUnit': Unit.gramm
    },
    ['honig']: {
      'name': 'Zuckerrübensirup, Agavendicksaft, Apfeldicksaft, Kokosblüten- oder Ahornsirup',
      'conversionFactor': 1,
      'keepUnit': true,
      'newUnit': Unit.gramm
    },
    ['spätzle']: {
      'name': 'Weizennudeln, Bohnennudeln oder Kartoffelklöße',
      'conversionFactor': 1,
      'keepUnit': true,
      'newUnit': Unit.gramm
    },
    ['gnocchi']: {
      'name': 'Weizennudeln, Bohnennudeln oder Kartoffelklöße',
      'conversionFactor': 1,
      'keepUnit': true,
      'newUnit': Unit.gramm
    },
    ['hühnerbrühe']: {
      'name': 'Gemüsebrühe',
      'conversionFactor': 1,
      'keepUnit': true,
      'newUnit': Unit.gramm
    },
    ['fischsauce']: {
      'name': 'Sojasauce',
      'conversionFactor': 1,
      'keepUnit': true,
      'newUnit': Unit.gramm
    },
    ['hackfleisch']: {
      'name': 'gekrümelter Tofu',
      'conversionFactor': 1,
      'keepUnit': true,
      'newUnit': Unit.gramm
    },
    ['fleisch']: {
      'name': 'Tofu, Tempeh, Seitan am Stück + Gewürze',
      'conversionFactor': 1,
      'keepUnit': true,
      'newUnit': Unit.gramm
    },
    ['fischfilets']: {
      'name': 'Tofu, Tempeh, Seitan am Stück + Gewürze',
      'conversionFactor': 1,
      'keepUnit': true,
      'newUnit': Unit.gramm
    },
    ['buttermilch']: {
      'name': 'Verhältnis veganer Buttermilch ersatz zum selber machen: 500 ml pflanzliche Milch mit 2-3 EL Apfelessig',
      'conversionFactor': 1,
      'keepUnit': true,
      'newUnit': Unit.gramm
    },
    ['buttermilch']: {
      'name': 'Verhältnis zum selber machen: 500 ml pflanzliche Milch mit 2-3 EL Apfelessig',
      'conversionFactor': 1,
      'keepUnit': true,
      'newUnit': Unit.gramm
    },
    ['sahne']: {
      'name': 'vegane Kochsahne oder vegane Schlagsahne + Sahnesteif',
      'conversionFactor': 1,
      'keepUnit': true,
      'newUnit': Unit.gramm
    },
    ['gelatine']: {
      'name': 'Agar-Agar oder Agartine',
      'conversionFactor': 1,
      'keepUnit': true,
      'newUnit': Unit.gramm
    },
  };

  static Ingredient convertIngredient(Ingredient ingredient) {
    List<List<String>> keys = ingredientData.keys.toList();
    String searchTerm = ingredient.name.toLowerCase();


    for (int i = 0; i < keys.length; i++) {
      for (int j = 0; j < keys[i].length; j++) {
        if (searchTerm == keys[i][j]) {
          Map<String, dynamic> entry = ingredientData[keys[i]];
          Unit e;
          if (entry['keepUnit'] == true) {
            e = ingredient.einheit;
          } else {
            e = entry['newUnit'];
          }

          Ingredient result = new Ingredient(ingredient.menge * int.parse(entry['conversionFactor'].toString()), entry['name'], e);

          return result;
        }
      }
    }

    return ingredient;
  }
}


