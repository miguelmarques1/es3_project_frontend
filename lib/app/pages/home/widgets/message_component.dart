import 'package:flutter/material.dart';

class MessageComponent extends StatelessWidget {
  const MessageComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 100, // Ajuste a posição
      left: 100, // Ajuste a posição
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Text("Sua mensagem aqui"),
      ),
    );
  }
}
