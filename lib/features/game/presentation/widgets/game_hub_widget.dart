import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geometry_dash/core/constants/levels/game_levels.dart';
import 'package:geometry_dash/features/game/presentation/pages/game_page.dart';
import 'package:geometry_dash/features/game/presentation/pages/geometry_game.dart';
import 'package:geometry_dash/features/game/presentation/providers/game_hub_provider.dart';
import 'package:geometry_dash/features/game/presentation/providers/game_settings_provider.dart';
import 'progress_bar_widget.dart';

class GameHubWidget extends ConsumerWidget {

  final GeometryGame game;
  final GameState gameState;
  final VoidCallback onPausePressed;

  const GameHubWidget({
    super.key, 
    required this.game,
    required this.gameState,
    required this.onPausePressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hub = ref.watch(gameHubProvider);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [

            Row(
              children: [
            
                const Icon(
                  Icons.diamond,
                  color: Colors.cyan,
                ),
            
                const SizedBox(width: 8),
            
                Text(
                  "${hub.diamonds}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                  ),
                ),
            
                const SizedBox(width: 20),
            
                const Icon(
                  Icons.flag,
                  color: Colors.green,
                ),
            
                Text(
                  "${hub.currentLevel}/${gameLevels.length}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                  ),
                ),
            
                const SizedBox(width: 20),

                Text(
                  "${(hub.progress * 100).toStringAsFixed(0)}%",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                  ),
                ),

                const Spacer(),
            
                IconButton(
                  onPressed: onPausePressed,
                  icon: Icon(
                    gameState == GameState.paused
                        ? Icons.play_arrow
                        : Icons.pause_circle_outline,
                  ),
                ),

                IconButton(
                  onPressed: () {
                    showModalBottomSheet<void>(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (_) => const _SpeedSettingsSheet(),
                    );
                  },
                  icon: const Icon(Icons.settings),
                ),
              ],
            ),

            const SizedBox(height: 15),

            ProgressBarWidget(
              progress: hub.progress,
            ),

          ],
        ),
      ),
    );
  }
}

class _SpeedSettingsSheet extends ConsumerStatefulWidget {
  const _SpeedSettingsSheet();

  @override
  ConsumerState<_SpeedSettingsSheet> createState() => _SpeedSettingsSheetState();
}

class _SpeedSettingsSheetState extends ConsumerState<_SpeedSettingsSheet> {
  late double selectedSpeed;

  String get selectedSpeedString => selectedSpeed.toStringAsFixed(0);

  @override
  void initState() {
    super.initState();
    selectedSpeed = ref.read(gameSettingsProvider).playerStartSpeed;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 18, 20, 24),
        decoration: const BoxDecoration(
          color: Color(0xff202020),
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Game Speed',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              selectedSpeedString,
              style: const TextStyle(
                color: Colors.cyanAccent,
                fontSize: 34,
                fontWeight: FontWeight.w700,
              ),
            ),
            Slider(
              value: selectedSpeed,
              min: kPlayerSpeedMin,
              max: kPlayerSpeedMax,
              divisions: 30,
              label: selectedSpeedString,
              onChanged: (value) {
                setState(() {
                  selectedSpeed = value;
                });
              },
            ),
            const SizedBox(height: 6),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  await ref
                      .read(gameSettingsProvider.notifier)
                      .setPlayerStartSpeed(selectedSpeed);

                  if (!context.mounted) return;
                  Navigator.pop(context);
                },
                child: const Text('Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}