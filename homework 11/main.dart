import 'MediaFile.dart';
import 'PlayList.dart';

mixin Shuffleable {
  void shufflePlaylist(){}
}

void main(List<String> args) {
  MediaFile song1 = MediaFile("Nirvana - Smells Like Teen Spirit", 4.38, "https://www.youtube.com/watch?v=hTWKbfoikeg");
  MediaFile song2 = MediaFile("Yuxu – Döngə", 4.49, "https://www.youtube.com/watch?v=eNBpxT4h5fk");
  MediaFile song3 = MediaFile("The White Buffalo - House of the Rising Sun", 5.22, "https://www.youtube.com/watch?v=MOqm0qGJhpw");

  PlayList playList1 = PlayList("Shahin's playlist", [song1, song2, song3], '', 10.0, '');

  playList1.playPlaylist();

  playList1.shufflePlaylist();
  playList1.playPlaylist();
  song3.pause();
  song3.play();

  song2.stop();
}
