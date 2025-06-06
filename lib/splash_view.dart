import 'package:flutter/material.dart';
import 'package:piano_game/Home_Veiw.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    getOnboarding();
  }

  void getOnboarding() {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeView()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: const Color.fromARGB(255, 202, 211, 211),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            width: double.infinity,
            child: Image.asset(
              'assets/images/download.jpeg',
              fit: BoxFit.cover,
            ),
          ),

       
          const SizedBox(height: 20),

          const Text(
            "😂😂أرحب يامدلع ",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
