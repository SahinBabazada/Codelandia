

// Tam ədədlərdən ibarət bir list hazırlayın.
// Listin üzərində əməliyyat aparmaq üçün 4 funksiya yaradın.
// 1- funksiya: listin ən böyük elementin tapır
// 2- funksiya listin ən kiçik elementin tapır
// 3- funksiya elementlərin cəmini tapır
// 4- funksiya elementlərin ədədi ortasını tapır


import 'dart:math';

main() {
  List<int> list = [1,6,12,36,93, 92, 94, 91, 92];

  print("listin ən böyük elementi: ${biggestItem(list)}");
  print("listin ən kiçik elementi: ${smallestItem(list)}");
  print("elementlərin cəmi: ${sumList(list)}");
  print("elementlərin ədədi ortası: ${avrgList(list)}");

}
int biggestItem(List<int> list){
  return list.reduce((value, element) => max(value, element));
}

int smallestItem(List<int> list){
  return list.reduce((value, element) => min(value, element));
}

int sumList(List<int> list){
  return list.reduce((value, element) => value + element);
}

double avrgList(List<int> list){
  return list.reduce((value, element) => (value + element))/list.length;
}