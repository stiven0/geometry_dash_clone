import 'package:flutter/material.dart';
import 'package:geometry_dash/features/game/presentation/providers/game_hub_provider.dart';
import 'package:geometry_dash/features/menu/presentation/providers/progress_state_provider.dart';
import 'package:geometry_dash/core/constants/game_palette.dart';
import 'package:geometry_dash/core/constants/levels/game_levels.dart';

class StatisticsContent extends StatelessWidget {
  final ProgressState progress;
  final GameHubState gameHub;
  final GamePalette palette;

  const StatisticsContent({
    super.key, 
    required this.progress,
    required this.gameHub,
    required this.palette,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 12,
      ),
      children: [

        _StatisticCard(
          title: "LEVELS COMPLETED",
          value: "${progress.unlockedLevel - 1} / ${gameLevels.length}",
          icon: Icons.flag,
          iconColor: Colors.white,
          palette: palette,
        ),

        const SizedBox(height: 20),

        _StatisticCard(
          title: "DIAMONDS",
          value: "${gameHub.diamonds}",
          icon: Icons.diamond,
          iconColor: Colors.cyanAccent,
          palette: palette,
        ),

        const SizedBox(height: 20),

        _StatisticCard(
          title: "FASTEST LEVEL COMPLETED", 
          value: "${gameHub.fastestLevelCompleted} - ${gameHub.fastestLevelTime.toStringAsFixed(2)}s", 
          // value: "${gameHub.fastestLevelCompleted} - ${gameHub.fastestLevelTime.toStringAsFixed(2)}s", 
          icon: Icons.speed, 
          iconColor: Colors.orangeAccent, 
          palette: palette
        )
      ],
    );
  }
}

class _StatisticCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color iconColor;
  final GamePalette palette;

  const _StatisticCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.iconColor,
    required this.palette,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      decoration: BoxDecoration(
        color: palette.platformBody,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.white54,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: palette.platformTop.withValues(alpha: .35),
            blurRadius: 18,
            spreadRadius: 2,
          ),
        ],
      ),

      child: Column(
        children: [

          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: palette.platformTop,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
            ),
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Row(
                children: [

                  Icon(
                    icon,
                    color: iconColor,
                    size: 54,
                  ),

                  const SizedBox(width: 20),

                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        value,
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
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