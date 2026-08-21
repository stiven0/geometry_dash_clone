import 'package:flutter/material.dart';
import 'package:geometry_dash/features/menu/presentation/pages/menu_page.dart';

class GameCompletedPage extends StatefulWidget {
  const GameCompletedPage({super.key});

  @override
  State<GameCompletedPage> createState() => _GameCompletedPageState();
}

class _GameCompletedPageState extends State<GameCompletedPage> with SingleTickerProviderStateMixin {

  late final AnimationController controller;
  late final Animation<double> scale;
  late final Animation<double> opacity;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    scale = CurvedAnimation(
      parent: controller,
      curve: Curves.elasticOut,
    );

    opacity = CurvedAnimation(
      parent: controller,
      curve: Curves.easeIn,
    );

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      body: Center(
        child: FadeTransition(
          opacity: opacity,
          child: ScaleTransition(
            scale: scale,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.emoji_events,
                  color: Colors.amber,
                  size: 120,
                ),

                const SizedBox(height: 30),

                const Text(
                  "¡FELICIDADES!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 46,
                    fontWeight: FontWeight.bold,
                  ),

                ),

                const SizedBox(height: 15),

                const Text(
                  "You have completed all the levels.",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 22,
                  ),

                ),

                const SizedBox(height: 60),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(250, 55),
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const MenuPage(),
                      ),
                      (_) => false,
                    );
                  },

                  child: const Text(
                    "Return to Menu",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}