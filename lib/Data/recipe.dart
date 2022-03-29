import 'ingredient.dart';

class Recipe{
    //Hier habe das Grund Konzept erstellt, wie ein Rezept am Ende aussehen soll
    String beschreibung;
    String title;

    //Hier füge ich ein Array mit den Objekten Zutat ein
    List<Ingredient> zutaten;

    Recipe(this.beschreibung, this.zutaten, this.title){

    }

    //Konvertiert ein ganzes Rezept
    void convert(){


      for (int i = 0; i < zutaten.length; i++){
        // Ich benutze hier die Formatierung der Zutat
        split(zutaten[i]);
      }

      for (int i = 0; i < zutaten.length; i++){
        // Ich benutze hier die Formatierung der Zutat
        zutaten[i] = zutaten[i].convert();
      }
    }

    // Hier lege ich eine Formatierung für das Rezept fest
    void format () {
      for (int i = 0; i < zutaten.length; i++){
        // Ich benutze hier die Formatierung der Zutat

          zutaten[i].format();
      }
      print(beschreibung);
    }

    void split (Ingredient ingredient){

      String searchTerm = ingredient.name.toLowerCase();
      List<String> splitted = beschreibung.split(' ');
      String result = '';

      print(searchTerm.toLowerCase());
      print(splitted);

      for (int i = 0; i < splitted.length; i++){
        if (searchTerm == splitted[i].toLowerCase() && searchTerm != ingredient.convert().name.toLowerCase()){
          splitted[i] = splitted[i] + ' (Hier die vegane Alternative: ' + ingredient.convert().name + ")";
          print(splitted);
        }
      }

      if(splitted.length > 0){
        result = splitted[0];
        for (int j = 1; j < splitted.length; j++){

          result = result + ' ' + splitted[j];

        }
      }

      beschreibung = result;
    }

    Map<String, dynamic> toMap(){

      List<Map<String, dynamic>> ingredients = [];

      for(int i = 0; i<zutaten.length; i++){
        ingredients.add(zutaten[i].toMap());
      }

      Map<String, dynamic> result = {
        'title' : title,
        'beschreibung' : beschreibung,
        'zutaten' : ingredients
      };

      return result;
    }

    static Recipe fromMap(Map<String, dynamic> data){

      List<Ingredient> ingredients = [];
      for(int i = 0; i<data['zutaten'].length; i++){
        ingredients.add(Ingredient.fromMap(data['zutaten'][i]));
      }

      return new Recipe(data['beschreibung'], ingredients, data['title']);
    }

}