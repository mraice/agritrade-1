import 'package:flutter/material.dart';
class AgriculturalInfo extends StatelessWidget {
  const AgriculturalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agricultural Info",style: Theme.of(context).textTheme.headlineMedium,),
      ),
      body: const Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text("Ju Likha hu Raees likh dein")
          ],
        ),
      ),
    );
  }
}
