import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_app/common/widgets/button/basic_app_button.dart';
import 'package:spotify_app/core/configs/assets/app_images.dart';
import 'package:spotify_app/core/configs/assets/app_vectors.dart';
import 'package:spotify_app/presentation/choose_mode/bloc/theme_cubit.dart';

class ChooseModePage extends StatelessWidget {
  ChooseModePage({super.key});
  final themeCubitOb = ThemeCubit();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Scaffold(
          body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 40,
              horizontal: 40,
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(AppImages.chooseModeBackground),
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(
              0.15,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 40,
              horizontal: 40,
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    AppVectors.logo,
                  ),
                ),
                const Spacer(),
                const Text(
                  'Choose Mode',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Satoshi',
                      color: Colors.white),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            themeCubitOb.updateTheme(ThemeMode.dark);
                            // context
                            //     .read<ThemeCubit>()
                            //     .updateTheme(ThemeMode.dark);
                          },
                          child: Container(
                            width: 73,
                            height: 73,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFF3B3538),
                            ),
                            child: SvgPicture.asset(
                              AppVectors.moon,
                              fit: BoxFit.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 17),
                        const Text(
                          'Dark Mode',
                          style: TextStyle(
                            fontFamily: 'Satoshi',
                            fontSize: 17,
                            color: Color(0xFFDADADA),
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(width: 40),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            context
                                .read<ThemeCubit>()
                                .updateTheme(ThemeMode.light);
                          },
                          child: Container(
                            width: 73,
                            height: 73,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFF30393D),
                            ),
                            child: SvgPicture.asset(
                              AppVectors.sun,
                              fit: BoxFit.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 17),
                        const Text(
                          'Light Mode',
                          style: TextStyle(
                            fontFamily: 'Satoshi',
                            fontSize: 17,
                            color: Color(0xFFDADADA),
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 70),
                BasicAppButton(onPressed: () {}, buttonText: 'Continue'),
              ],
            ),
          )
        ],
      )),
    );
  }
}
