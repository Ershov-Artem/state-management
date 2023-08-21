import 'package:flutter/material.dart';
import 'package:state_management/universities/domain/domain.dart';

class UniversityItem extends StatelessWidget {
  const UniversityItem({
    super.key,
    required this.university,
  });

  final University university;

  static const _separator = SizedBox(
    height: 8,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green,
        boxShadow: const [BoxShadow(color: Colors.black)],
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            university.name,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          _separator,
          Text(
            university.country,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
