import 'dart:io';
import 'dart:math';

main() {


  //Araşdırma  random(), nextİnt(), generate(), shuffle() və base64UrlEncode() 
  var random = new Random();
  int randomNumber = random.nextInt(20) + 10;
  print(randomNumber);

  List<int> generatedList = List<int>.generate(30, (counter) => ( random.nextInt(20) * counter));
  print(generatedList);

  // base64UrlEncode()  ?

  List<String> regions = ["Baku", "Lankaran","Quba", "Shaki", "Gandja"];
  regions.shuffle();
  print(regions);

  // task
  /*
  İstifadəçidən ədəd tələb edin. Sonra həmin ədədin bütün tam bölənlərinin siyahısını çap edən proqram yaradın.
  məs: 7, 1-ə tam bölünür. 
  7, 7-yə tam bölünür.
  */

  print("Bir ədəd daxil edin və həmin ədədin tam bölənlərini görün");
  int inputNumber = int.parse(stdin.readLineSync().toString());

  for(int i = 0; i <= inputNumber; i++){
    (i == 0)? null: ((inputNumber%i == 0)? print('$inputNumber, $i-ə tam bölünür.'): null);
  }

}
