import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pokedex"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(
              image: AssetImage('images/missingno.png'),
              height: 200.0,
            ),
            Text('Oh-no! Something went wrong...')
          ],
        )
      ),
    );
  }
}