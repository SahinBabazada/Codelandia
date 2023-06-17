import 'MediaFile.dart';
import 'main.dart';

class PlayList extends MediaFile with Shuffleable {
  String name;
  List<MediaFile> mediaFiles = [];

  PlayList(this.name, this.mediaFiles, super.title, super.duration, super.filePath);


  void playPlaylist(){
    mediaFiles.forEach((element) => {element.play()});
  }

  void shufflePlaylist(){
    mediaFiles.shuffle();
    print('shuffle playlist');
  }

}