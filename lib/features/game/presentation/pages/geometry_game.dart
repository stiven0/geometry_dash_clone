import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flame/components.dart';

import 'package:geometry_dash/core/constants/game_palette.dart';
import 'package:geometry_dash/features/game/presentation/providers/game_hub_provider.dart';
import 'package:geometry_dash/features/game/presentation/providers/game_settings_provider.dart';
import 'package:geometry_dash/features/game/presentation/widgets/diamond_widget.dart';
import 'package:geometry_dash/features/game/presentation/widgets/ground_block_widget.dart';
import 'package:geometry_dash/features/game/presentation/widgets/jum_pad_widget.dart';
import 'package:geometry_dash/features/game/presentation/widgets/jum_ring_widget.dart';
import 'package:geometry_dash/features/game/presentation/widgets/platform_widget.dart';
import 'package:geometry_dash/features/game/presentation/managers/effects_manager.dart';
import 'package:geometry_dash/features/game/presentation/managers/game_lifecycle_manager.dart';
import 'package:geometry_dash/features/game/presentation/managers/palette_manager.dart';
import 'package:geometry_dash/features/game/presentation/player/player_controller.dart';
import 'package:geometry_dash/features/game/presentation/systems/world_movement_system.dart';
import 'package:geometry_dash/features/game/presentation/level/level_loader.dart';
import 'package:geometry_dash/features/game/presentation/widgets/player_widget.dart';
import 'package:geometry_dash/features/game/presentation/widgets/speed_portal_widget.dart';
import 'package:geometry_dash/features/game/presentation/widgets/spike_widget.dart';
import 'package:geometry_dash/features/game/presentation/widgets/trialparticle_widget.dart';
import 'package:geometry_dash/features/menu/presentation/providers/progress_state_provider.dart';
import 'package:geometry_dash/features/game/presentation/widgets/background_widget.dart';

class GeometryGame extends FlameGame with HasCollisionDetection, TapCallbacks {

  final int initialLevel;
  final double initialWorldSpeed;
  late final GameHubNotifier gameHubNotifier;
  late final ProgressStateNotifier progressNotifier;
  final VoidCallback onGameCompleted;
  final Function(int level) onLevelCompleted;

  late final PlayerController playerController;
  late final PlayerWidget player;
  late final WorldMovementSystem movementSystem;
  late final LevelLoader levelLoader;
  late final PaletteManager paletteManager;
  late final EffectsManager effectsManager;
  late final GameLifecycleManager lifecycleManager;
  late final RectangleComponent ground1;
  late final RectangleComponent ground2;
  late final List<SpikeWidget> obstacles = [];
  late final List<PlatformWidget> platforms = [];
  late final List<GroundBlockWidget> groundBlocks = [];
  late final List<JumpPadWidget> jumpPads = [];
  late final List<DiamondWidget> diamonds = [];
  late final List<JumpRingWidget> jumpRings = [];
  late final List<SpeedPortalWidget> speedPortals = [];
  late final BackgroundWidget background;
  late GamePalette palette;
  late double columnWidth;
  late double rowHeight;
  late Stopwatch levelTimer;
  late int currentLevel;
  late double worldSpeedValue;

  static const double playerSize = 30;
  static const double trailInterval = 0.06;
  static const double groundRatio = 0.85;
  static const double groundThickness = 64;
  double progress = 0;
  double lastProgress = 0;
  double currentDistance = 0;
  double groundLevel = 0.0;
  double trailTimer = 0;
  final Random random = Random();
  double levelEndX = 0;

  GeometryGame({
    required this.initialLevel,
    required this.initialWorldSpeed,
    required this.gameHubNotifier,
    required this.progressNotifier,
    required this.onGameCompleted,
    required this.onLevelCompleted,
  });

  @override
  Future<void> onTapDown(TapDownEvent event) async {
    super.onTapDown(event);
    playerController.onTapDown();
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    await Future.delayed(
      const Duration(milliseconds: 500),
    );

    groundLevel = size.y * groundRatio;
    currentLevel = initialLevel - 1;
    worldSpeedValue = _normalizeWorldSpeed(initialWorldSpeed);

    columnWidth = size.x / 20;
    rowHeight = (groundLevel - 40) / 8;

    paletteManager = const PaletteManager();
    updatePalette();
    createBackground();
    createPlayer();
    createGround();
    movementSystem = WorldMovementSystem(
      ground1: ground1,
      ground2: ground2,
      groundBlocks: groundBlocks,
      obstacles: obstacles,
      platforms: platforms,
      jumpPads: jumpPads,
      diamonds: diamonds,
      jumpRings: jumpRings,
      speedPortals: speedPortals,
      worldSpeed: () => worldSpeedValue,
    );
    effectsManager = EffectsManager(this);
    levelLoader = LevelLoader(
      game: this,
      obstacles: obstacles,
      platforms: platforms,
      groundBlocks: groundBlocks,
      jumpPads: jumpPads,
      diamonds: diamonds,
      jumpRings: jumpRings,
      speedPortals: speedPortals,
      groundLevel: () => groundLevel,
      toX: toX,
      toY: toY,
      toWidth: toWidth,
      toHeight: toHeight,
      onDiamondCollected: createDiamondExplosion,
    );
    lifecycleManager = GameLifecycleManager(
      game: this,
      levelLoader: levelLoader,
      gameHubNotifier: gameHubNotifier,
      progressNotifier: progressNotifier,
      paletteManager: paletteManager,
      effectsManager: effectsManager,
      onGameCompleted: onGameCompleted,
      onLevelCompleted: onLevelCompleted,
    );
    levelEndX = levelLoader.loadLevel(currentLevel);
    levelTimer = Stopwatch()..start();
    gameHubNotifier.setLevel(currentLevel + 1);
  }

  @override
  void update(double dt) {
    super.update(dt);

    currentDistance += worldSpeedValue * dt;
    progress = (currentDistance / levelEndX).clamp(0.0, 1.0);

    if (player.isDead) return;
    if (lifecycleManager.isGameCompleted) return;
    if (lifecycleManager.isChangingLevel) return;

    if ((progress - lastProgress).abs() > 0.01) {
      lastProgress = progress;
      Future(() {
        gameHubNotifier.updateProgress(progress);
      });
    }

    movementSystem.update(dt);
    updateTrail(dt);
    playerController.update(dt);
    checkLevelCompleted();
  }

  void createPlayer() {
    playerController = PlayerController(
      initialX: size.x * 0.10,
      groundLevel: () => groundLevel,
      platforms: platforms,
      onGameOver: gameOver,
      onSpeedPortalCollision: increaseSpeed,
      onDiamondCollected: () {
        gameHubNotifier.addDiamond();
      },
    );

    player = playerController.createPlayer();
    add(player);
  }

  void createGround() {
    ground1 = RectangleComponent(
      position: Vector2(
          0,
          groundLevel,
        ),
        size: Vector2(size.x, 2),
        paint: Paint()..color = Colors.transparent,
      );

    ground2 = RectangleComponent(
      position: Vector2(
        size.x,
        groundLevel,
      ),
      size: Vector2(size.x, 2),
      paint: Paint()..color = Colors.transparent,
    );

    add(ground1);
    add(ground2);
  }
  
  void updateTrail(double dt) {
    trailTimer += dt;

    if (!player.isJumping && trailTimer > trailInterval) {
      trailTimer = 0;
      add(
        TrailParticleWidget(
          game: this,
          position: Vector2(
            player.position.x - 15,
            player.position.y +
                player.size.y * 0.7,
          ),
          speed: worldSpeedValue,
        ),
      );
    }
  }

  void resetGame() {
    lifecycleManager.resetGame();
  }

  Future<void> nextLevel() async {
    await lifecycleManager.nextLevel();
  }

  void checkLevelCompleted() {
    if (currentDistance >= levelEndX) {
      lifecycleManager.nextLevel();
    }
  }

  void gameOver() {
    lifecycleManager.onGameOver();
  }

  void createDiamondExplosion() {
    effectsManager.createDiamondExplosion(player.position);
  }

  void createBackground() {
    background = BackgroundWidget(
      palette: palette,
      size: size,
    );

    add(background);
  }

  void updateBackgroundPalette() {
    background.setPalette(palette);
  }

  double toX(double column) {
    return column * columnWidth;
  }

  double toY(double row) {
    return row * rowHeight;
  }

  double toWidth(double columns) {
    return columns * columnWidth;
  }

  double toHeight(double rows) {
    return rows * rowHeight;
  }

  void updatePalette() {
    palette = paletteManager.getPaletteForLevel(currentLevel);
  }

  void increaseSpeed() {
    worldSpeedValue = (worldSpeedValue * 1.15)
        .clamp(kPlayerSpeedMin, kPlayerSpeedMax)
        .toDouble();
  }

  void resetWorldSpeed() {
    worldSpeedValue = _normalizeWorldSpeed(initialWorldSpeed);
  }

  double _normalizeWorldSpeed(double speed) {
    return speed.clamp(kPlayerSpeedMin, kPlayerSpeedMax).toDouble();
  }

}