import 'package:es3_proj/app/pages/home/widgets/message_component.dart';
import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatefulWidget {
  const CustomFloatingActionButton({super.key});

  @override
  State<CustomFloatingActionButton> createState() =>
      _CustomFloatingActionButtonState();
}

class _CustomFloatingActionButtonState
    extends State<CustomFloatingActionButton> {
  bool _showOverlay = false;

  void showOverlay() {
    setState(() {
      _showOverlay = true;
    });
  }

  void hideOverlay() {
    setState(() {
      _showOverlay = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) {
        if (event.position.distance < 10) {
          showOverlay();
        } else {
          hideOverlay();
        }
      },
      child: Stack(
        children: [
          FloatingActionButton(
            backgroundColor: Colors.blue,
            onPressed: () {},
            child: Icon(Icons.add),
            shape: CircleBorder(),
          ),
          if (_showOverlay)
            Overlay(
              initialEntries: [
                OverlayEntry(
                  builder: (context) {
                    return MessageComponent();
                  },
                )
              ],
            ),
        ],
      ),
    );
  }
}
