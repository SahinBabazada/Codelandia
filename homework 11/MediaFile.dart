import 'Playable.dart';

class MediaFile implements Playable{

  String title;
  double duration;
  String filePath;
  
  MediaFile(this.title, this.duration, this.filePath);

  @override
  void pause() {
    print('${this.title} has paused');
  }
  
  @override
  void play() {
    print('${this.title} is playing');
  }
  
  @override
  void stop() {
    print('${this.title} has stoped');
  }
}