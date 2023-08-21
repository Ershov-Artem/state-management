import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:state_management/universities/domain/domain.dart';

class CountriesWidget extends StatelessWidget {
  const CountriesWidget({
    Key? key,
    required this.currentCountry,
    required this.onChange,
  }) : super(key: key);

  final Countries currentCountry;
  final void Function(Countries value) onChange;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (_) => <PopupMenuEntry<Countries>>[
        PopupMenuItem(
          onTap: () => onChange(Countries.Armenia),
          value: Countries.Armenia,
          child: Text('Ar'),
        ),
        PopupMenuItem(
          onTap: () => onChange(Countries.France),
          value: Countries.France,
          child: Text('Fr'),
        ),
        PopupMenuItem(
          onTap: () => onChange(Countries.Spain),
          value: Countries.Spain,
          child: Text('Es'),
        ),
        PopupMenuItem(
          onTap: () => onChange(Countries.Georgia),
          value: Countries.Georgia,
          child: Text('Gr'),
        ),
        PopupMenuItem(
          onTap: () => onChange(Countries.Italy),
          value: Countries.Italy,
          child: Text('It'),
        ),
      ],
    );
  }
}
