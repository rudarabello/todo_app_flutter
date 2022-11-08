import 'package:flutter/material.dart';

class ContactWidget extends StatelessWidget {
  final String name;
  final String profissao;
  const ContactWidget({
    Key? key,
    required this.name,
    required this.profissao,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.all(8),
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.amber,
          ),
        ),
        //const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(name),
              Text(profissao),
            ],
          ),
        )
      ],
    );
  }
}
