
import 'data.dart';

enum Unit {
  gramm,
  kilogramm,
  milliliter,
  liter,
  stueck,
  el,
  tl
}

class Ingredient {
  //Hier habe das Grund Konzept erstellt, wie eine Zutat am Ende aussehen soll

  Unit einheit = Unit.gramm;
  int menge = 0;
  String name = "";

  // Das ist Konstruktor und hier werden die eingegebenen Werte eingefügt. Wird am Anfang zum Start aufegrufen
  Ingredient(int mengeTemp, String nameTemp, Unit einheitTemp){
    menge = mengeTemp;
    name = nameTemp;
    einheit = einheitTemp;
  }

  Ingredient convert (){

    return Data.convertIngredient(this);

  }

  // Hier lege ich eine Formatierung für Zutat fest
  void format () {
    print(menge.toString()+ ' ' + convertEinheit(einheit) + ' ' + name);
  }

  Map<String, dynamic> toMap(){

    Map<String, dynamic> result = {
      'name' : name,
      'menge' : menge,
      'einheit' : convertEinheit(einheit)
    };

    return result;
  }

  static Ingredient fromMap(Map<String, dynamic> data){
    return new Ingredient(data['menge'], data['name'], unitFromString(data['einheit']));
  }

}

// Hier konvertiere ich den Wert von Einheit in ein String
String convertEinheit (Unit einheit) {
  if (einheit == Unit.gramm){
    return('gramm');
  }else if (einheit == Unit.kilogramm){
    return('kilogramm');
  }else if (einheit == Unit.liter){
    return('liter');
  }else if (einheit == Unit.stueck){
    return('stück');
  }else if (einheit == Unit.tl){
    return('tl');
  }else if (einheit == Unit.el){
    return('el');
  }else{
    return('milliliter');
  }

}

Unit unitFromString (String einheit){
  if (einheit == 'gramm'){
    return Unit.gramm;
  }else if (einheit == 'kilogramm'){
    return Unit.kilogramm;
  }else if (einheit == 'liter'){
    return Unit.liter;
  }else if (einheit == 'stück'){
    return Unit.stueck;
  }else if (einheit == 'tl'){
    return Unit.tl;
  }else if (einheit == 'el'){
    return Unit.el;
  }else{
    return Unit.milliliter;
  }
}