import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flame/game.dart';
import 'package:geometry_dash/core/constants/game_palette.dart';
import 'package:geometry_dash/core/constants/palettes.dart';
import 'package:geometry_dash/features/game/presentation/providers/game_hub_provider.dart';
import 'package:geometry_dash/features/menu/presentation/pages/level_select_page.dart';
import 'package:geometry_dash/features/menu/presentation/providers/progress_state_provider.dart';
import 'package:geometry_dash/features/menu/presentation/widgets/menu_background_game.dart';
import 'package:geometry_dash/features/menu/presentation/widgets/menu_button.dart';
import 'package:geometry_dash/features/statistics/presentation/pages/statistics_page.dart';

class MenuPage extends ConsumerStatefulWidget {

  const MenuPage({super.key});

  @override
  ConsumerState<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends ConsumerState<MenuPage> {

  late final GamePalette palette;

  GamePalette getRandomPalette() {
    const palettes = [
      Palettes.classic,
      Palettes.lava,
      Palettes.neon,
      Palettes.ice,
      Palettes.forest,
      Palettes.desert,
      Palettes.space,
    ];
    final random = Random().nextInt(palettes.length);
    return palettes[random];
  }

  @override
  void initState() {
    super.initState();
    palette = getRandomPalette();

    Future.microtask(() {
      ref.read(gameHubProvider.notifier).loadInitialData();
      ref.read(progressStateProvider.notifier).loadProgress();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [

          Positioned.fill(
            child: GameWidget(
              game: MenuBackgroundGame(
                palette: palette,
              ),
            ),
          ),

          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  const Text(
                    "GEOMETRY RUNNER",
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                const SizedBox(height: 80),
                  
                MenuButton(
                  buttonBackgroundColor: palette.platformTop,
                  text: "PLAY",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LevelSelectPage(
                          palette: palette,
                        ),
                      ),
                    );
                  },
                ),

                const SizedBox(
                  height: 25,
                ),

                MenuButton(
                  buttonBackgroundColor: palette.platformTop,
                  text: "STATISTICS",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StatisticsPage(
                          palette: palette,
                        ),
                      ),
                    );
                  },
                ),

                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}