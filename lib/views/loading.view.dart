import 'package:flutter/material.dart';

class LoadingView extends StatefulWidget {
  const LoadingView({ Key? key }) : super(key: key);

  @override
  _LoadingViewState createState() => _LoadingViewState();
}

class _LoadingViewState extends State<LoadingView> with SingleTickerProviderStateMixin {
  late final AnimationController _animController;
  late final Animation<double> _animation;

  @override
  void initState() {   
    super.initState();

    _animController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: -0.35, end: 0.35)
      .chain(CurveTween(curve: Curves.elasticInOut))
      .animate(_animController);
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pokedex"),
        centerTitle: true,
      ),
      body: Center(
        child: AnimatedPokeball(animation: _animation)
      ),
    );
  }
}

class AnimatedPokeball extends AnimatedWidget {
  const AnimatedPokeball({ Key? key, required Animation<double> animation }) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final _animation = listenable as Animation<double>;
    return Transform.rotate(
      angle: _animation.value,
      child: Image.asset('images/pokeball-loading.png', height: 50.0)
    );
  }
}