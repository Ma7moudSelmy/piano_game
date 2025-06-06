import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with SingleTickerProviderStateMixin {
  final List<Color> keyColors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.purple,
    Colors.teal,
    Colors.pink,
  ];

  final List<String> soundPaths = [
    'assets/note1.wav',
    'assets/note2.wav',
    'assets/note3.wav',
    'assets/note4.wav',
    'assets/note5.wav',
    'assets/note6.wav',
    'assets/note7.wav',
  ];

  final List<String> imagePaths = [
    'assets/images/download.jpeg',
    'assets/images/download.jpeg',
    'assets/images/download.jpeg',
    'assets/images/download.jpeg',
    'assets/images/download.jpeg',
    'assets/images/download.jpeg',
    'assets/images/download.jpeg',
  ];

  final AudioPlayer player = AudioPlayer();

  int? pressedIndex;

  // لتشغيل الصوت
  void playSound(String path) {
    player.play(AssetSource(path.replaceFirst('assets/', '')));
  }

  // لعرض الصورة مع خلفية مظللة
  void showImage(BuildContext context, String imagePath) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: Colors.black.withOpacity(0.8),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset(imagePath),
        ),
      ),
    );
  }

  // دالة للضغط على زر
  void onKeyTap(int index) {
    setState(() {
      pressedIndex = index;
    });
    playSound(soundPaths[index]);
    showImage(context, imagePaths[index]);

    Future.delayed(const Duration(milliseconds: 150), () {
      setState(() {
        pressedIndex = null;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 20),
        itemCount: soundPaths.length,
        itemBuilder: (context, index) {
          bool isPressed = pressedIndex == index;
          return GestureDetector(
            onTap: () => onKeyTap(index),
            onPanUpdate: (details) {
              // لو المستخدم بيمرر على الزر، نشغل الصوت ونظهر الصورة
              onKeyTap(index);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              height: isPressed ? 90 : 80,
              decoration: BoxDecoration(
                color: keyColors[index % keyColors.length],
                borderRadius: BorderRadius.circular(12),
                boxShadow: isPressed
                    ? [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.7),
                          blurRadius: 12,
                          spreadRadius: 1,
                        ),
                      ]
                    : [],
              ),
              child: Center(
                child: Text(
                  'Key ${index + 1}',
                  style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
