import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: HitTests()));
}

class HitTests extends StatefulWidget {
  @override
  State<HitTests> createState() => _HitTestsState();
}

class _HitTestsState extends State<HitTests> {
  @override
  Widget build(BuildContext context) {
    double btnSize = 20;
    List<Widget> buttons = [];
    Size stageSize = MediaQuery.of(context).size;
    int cols = (stageSize.width / btnSize).floor();
    int rows = (stageSize.height / btnSize).floor();
    for (var x = 0; x < cols; x++) {
      for (var y = 0; y < rows; y++) {
        buttons.add(Positioned(
          left: x * btnSize,
          top: y * btnSize,
          child: Button(btnSize),
        ));
      }
    }

    return Container(
      color: Colors.white,
      child: Stack(
        children: buttons,
      ),
    );
  }
}

class Button extends StatefulWidget {
  Button(this.size, {Key? key});
  final double size;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool _isMouseOver = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isMouseOver = true),
      onExit: (_) => setState(() => _isMouseOver = false),
      child: Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(99),
          color: Colors.red.withOpacity(_isMouseOver ? .6 : .1),
        ),
      ),
    );
  }
}
