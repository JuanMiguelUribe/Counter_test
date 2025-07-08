import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  int clickCounter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Counter Functions"),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh_rounded),
            onPressed: () {
              setState(() {
                clickCounter = 0;
              });
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$clickCounter",
              style: TextStyle(fontSize: 160, fontWeight: FontWeight.w100),
            ),
            Text(
              "Click${clickCounter == 1 ? "" : "s"}",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButton(
            icon: Icons.refresh_outlined,
            onPressed: () {
              setState(() {
                clickCounter = 0;
              });
            },
          ),
          SizedBox(height: 10),
          CustomButton(
            icon: Icons.plus_one,
            onPressed: () {
              setState(() {
                clickCounter++;
              });
            },
          ),
          SizedBox(height: 10),
          CustomButton(
            icon: Icons.exposure_minus_1,
            onPressed: () {
              setState(() {
                if (clickCounter == 0) return;
                clickCounter--;
              });
            },
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const CustomButton({super.key, required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      // shape: Border.all(),
      onPressed: onPressed,
      enableFeedback: true,
      focusElevation: 300, //This is for the shadow of the button
      // Animación loca: botón que rota y cambia de tamaño al presionarse
      foregroundColor: Colors.black,
      splashColor: Colors.teal,
      elevation: 1,
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 1, end: onPressed == null ? 1 : 1.2),
        duration: const Duration(milliseconds: 300),
        curve: Curves.elasticOut,
        builder: (context, scale, child) {
          return AnimatedRotation(
            turns: onPressed == null ? 0 : 1,
            duration: const Duration(milliseconds: 100),
            curve: Curves.easeInOutCubicEmphasized,
            child: Transform.scale(scale: scale, child: Icon(icon)),
          );
        },
      ),
    );
  }
}
