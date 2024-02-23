import 'package:flutter/material.dart';

class ArcedSquareButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  ArcedSquareButton(this.colorlists, this.color,
      {required this.icon, required this.label, required this.onPressed});

  final Color color;
  final List<Color> colorlists;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 103,
            height: 103,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: colorlists,
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Icon(
              icon,
              color: color,
              size: 70,
              shadows: [
                Shadow(
                    color: Color.fromARGB(80, 0, 0, 0), offset: Offset(-3, 5))
              ],
            ),
          ),
          SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
