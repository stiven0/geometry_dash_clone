import 'package:flame/components.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geometry_dash/core/constants/palettes.dart';
import 'package:geometry_dash/features/game/domain/repositories/game_repository.dart';
import 'package:geometry_dash/features/game/presentation/pages/geometry_game.dart';
import 'package:geometry_dash/features/game/presentation/player/player_controller.dart';
import 'package:geometry_dash/features/game/presentation/providers/game_hub_provider.dart';
import 'package:geometry_dash/features/game/presentation/widgets/platform_widget.dart';
import 'package:geometry_dash/features/game/presentation/widgets/shield_widget.dart';
import 'package:geometry_dash/features/game/presentation/widgets/spike_widget.dart';
import 'package:geometry_dash/features/menu/domain/repositories/progress_repository.dart';
import 'package:geometry_dash/features/menu/presentation/providers/progress_state_provider.dart';

class _FakeGameRepository implements GameRepository {
  @override
  Future<void> addDiamonds(int amount) async {}

  @override
  Future<int> getDiamonds() async => 0;

  @override
  Future<int> getFastestLevelCompleted() async => 0;

  @override
  Future<double> getFastestLevelTime() async => 0;

  @override
  Future<void> setFastestLevelCompleted(int level) async {}

  @override
  Future<void> setFastestLevelTime(double time) async {}
}

class _FakeProgressRepository implements ProgressRepository {
  @override
  Future<int> getUnlockedLevel() async => 1;

  @override
  Future<void> unlockLevel(int level) async {}
}

GeometryGame _stubGame() {
  return GeometryGame(
    initialLevel: 1,
    initialWorldSpeed: 200,
    gameHubNotifier: GameHubNotifier(_FakeGameRepository()),
    progressNotifier: ProgressStateNotifier(_FakeProgressRepository()),
    onGameCompleted: () {},
    onLevelCompleted: (_) {},
  );
}

void main() {
  late GeometryGame game;
  late List<PlatformWidget> platforms;
  late int gameOverCount;
  late PlayerController controller;

  setUp(() {
    game = _stubGame();
    game.palette = Palettes.classic;
    platforms = <PlatformWidget>[];
    gameOverCount = 0;

    controller = PlayerController(
      initialX: 100,
      groundLevel: () => 400,
      palette: () => Palettes.classic,
      platforms: platforms,
      onGameOver: () => gameOverCount++,
      onSpeedPortalCollision: () {},
      onDiamondCollected: () {},
    );
    controller.createPlayer();
  });

  test('collecting shield activates invincibility for 5s', () {
    expect(controller.isShieldActive, isFalse);

    controller.player.onCollisionStart({}, ShieldWidget(
      game: game,
      position: Vector2(100, 200),
    ));

    expect(controller.isShieldActive, isTrue);
    expect(controller.shieldTimer, PlayerController.shieldDuration);
  });

  test('spike collision does not kill while shield is active', () {
    controller.activateShield();

    controller.player.onCollisionStart({}, SpikeWidget(
      game: game,
      position: Vector2(120, 380),
    ));

    expect(gameOverCount, 0);
  });

  test('spike collision kills after shield expires', () {
    controller.activateShield();
    controller.update(PlayerController.shieldDuration + 0.01);

    expect(controller.isShieldActive, isFalse);

    controller.player.onCollisionStart({}, SpikeWidget(
      game: game,
      position: Vector2(120, 380),
    ));

    expect(gameOverCount, 1);
  });

  test('being inside a platform does not kill while shield is active', () {
    final platform = PlatformWidget(
      game: game,
      position: Vector2(85, 370),
      height: 40,
      width: 40,
    );
    platforms.add(platform);

    controller.activateShield();
    controller.player.position = Vector2(100, 385);
    controller.player.previousY = 385;
    controller.player.velocityY = 0;
    controller.player.currentPlatform = null;

    controller.update(0.016);

    expect(gameOverCount, 0);
    expect(controller.isShieldActive, isTrue);
  });

  test('player can still land on platforms while shield is active', () {
    final platform = PlatformWidget(
      game: game,
      position: Vector2(85, 300),
      height: 30,
      width: 60,
    );
    platforms.add(platform);

    // Place the player just above the platform top so gravity this frame
    // crosses the top edge (landing path), not the "inside" death path.
    controller.activateShield();
    controller.player.currentPlatform = null;
    controller.player.isOnPlatform = false;
    controller.player.velocityY = 400;
    controller.player.position = Vector2(100, 280);

    controller.update(0.016);

    expect(gameOverCount, 0);
    expect(controller.player.isOnPlatform, isTrue);
    expect(controller.player.currentPlatform, same(platform));
    expect(controller.isShieldActive, isTrue);
  });

  test('shield expires after duration and reset clears it', () {
    controller.activateShield();
    controller.update(2.0);
    expect(controller.isShieldActive, isTrue);
    expect(controller.shieldTimer, closeTo(3.0, 0.001));

    controller.update(3.0);
    expect(controller.isShieldActive, isFalse);
    expect(controller.shieldTimer, 0);

    controller.activateShield();
    expect(controller.isShieldActive, isTrue);

    controller.reset();
    expect(controller.isShieldActive, isFalse);
    expect(controller.shieldTimer, 0);
  });

  test('shield widget marks itself collected on player hit', () {
    final shield = ShieldWidget(
      game: game,
      position: Vector2(100, 200),
    );

    shield.onCollisionStart({}, controller.player);

    expect(shield.isCollected, isTrue);
  });
}
