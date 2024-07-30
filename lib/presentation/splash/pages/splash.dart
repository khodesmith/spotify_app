import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_app/core/configs/assets/app_vectors.dart';
import 'package:spotify_app/presentation/intro/pages/get_started.dart';

class SpotifySplashScreen extends StatefulWidget {
  const SpotifySplashScreen({super.key});

  @override
  State<SpotifySplashScreen> createState() => _SpotifySplashScreenState();
}

class _SpotifySplashScreenState extends State<SpotifySplashScreen> {
  @override
  void initState() {
    // Future.delayed(const Duration(seconds: 2));
    redirect();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(AppVectors.logo),
      ),
    );
  }

  Future<void> redirect() async {
    await Future.delayed(
      const Duration(
        seconds: 2,
      ),
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const GetStarted(),
      ),
    );
  }
}
