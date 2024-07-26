// controllers/audio_controller.dart
import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

class AudioController extends GetxController {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final AudioPlayer buttonclick = AudioPlayer();
  final _isPlaying = false.obs;

  bool get isPlaying => _isPlaying.value;

  @override
  void onInit() {
    super.onInit();
    _audioPlayer.setReleaseMode(ReleaseMode.loop);
    playMusic(); // Loop the music
  }

  void playMusic() {
    if (!_isPlaying.value) {
      _audioPlayer.play(AssetSource(
          'sounds/background_music.mp3')); // Add your audio file in assets folder
      _isPlaying.value = true;
      update();
    }
  }

  void clickbutton() {
    buttonclick.play(AssetSource('sounds/ic_click.mp3'));
  }

  void stopMusic() {
    if (_isPlaying.value) {
      _audioPlayer.stop();
      _isPlaying.value = false;
      update();
    }
  }

  void toggleMusic() {
    if (_isPlaying.value) {
      stopMusic();
    } else {
      playMusic();
    }
  }
}
