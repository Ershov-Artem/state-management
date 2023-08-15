import 'package:flutter/material.dart';
import 'package:state_management/home/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const _divider = SizedBox(height: 16,);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Choose state manager'),),
      body: Column(
        children: [
          ManagerButton(title: 'BLoC', onPressed: (){}),
          _divider,
          ManagerButton(title: 'Riverpod',onPressed: (){},),
          _divider,
          ManagerButton(title: 'Provider', onPressed: (){}),
        ],
      ),
    );
  }
}
