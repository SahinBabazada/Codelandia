

main() {

  //Task-1
  // tam ədədlərdən ibarət 2 List yaradın
  // bu 2 siyahının elementlərini yeni bir siyahıda yerləşdirin və çap edin.
  // yeni siyahını azdan çoxa doğru sıralayın və çap edin.

  List<int> lst1 = [2,3,1,4];
  List<int> lst2 = [5,7,6,8];

  List<int> lst = lst1 + lst2;
  print(lst);
  lst.sort();
  print(lst);
  print("-"*25);

  // Task - 2 
  // daxilində təkrarlanan və təkrarlanmayan tam ədədlərin olduğu qarışıq siyahı qurun
  // siyahıda təkrarlanan elementləri silin
  // siyahının ən yüksək dəyərə sahib 2ci elementini tapın
  // siyahını çoxdan aza doğru sıralayın

  List<int> mixList = [1,2,3,3,5,8,1,4,6,7,9,5];
  print('list: $mixList');
  print('list with unique values: ${mixList = mixList.toSet().toList()}'); // setə convert elədiyimiz zaman təkrarlanan elementlər silinəcək
  mixList.sort((a, b) => b.compareTo(a));
  print('Second largest number in list: ${mixList[1]} ');
  print('list in descending order: $mixList');
}