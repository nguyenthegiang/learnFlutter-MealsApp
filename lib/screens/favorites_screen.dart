import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FavoriesScreen extends StatelessWidget {
  const FavoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filter'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text('Filters'),
      ),
    );
  }
}
