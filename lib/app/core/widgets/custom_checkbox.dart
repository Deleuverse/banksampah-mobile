import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  final bool isChecked;
  final ValueChanged<bool> onChanged;
  final String label;
  final Color checkedColor;
  final Color uncheckedColor;
  final double size;
  final double borderThickness;

  const CustomCheckbox({
    super.key,
    required this.isChecked,
    required this.onChanged,
    required this.label,
    this.checkedColor = Colors.blue,
    this.uncheckedColor = Colors.grey,
    this.size = 30.0,
    this.borderThickness = 2.0,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomCheckboxWithLabelState createState() =>
      _CustomCheckboxWithLabelState();
}

class _CustomCheckboxWithLabelState extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChanged(!widget.isChecked); // Mengubah status checkbox
      },
      child: Row(
        children: [
          CustomPaint(
            size: Size(widget.size, widget.size), // Ukuran checkbox
            painter: _CheckboxPainter(
              isChecked: widget.isChecked,
              checkedColor: widget.checkedColor,
              uncheckedColor: widget.uncheckedColor,
              borderThickness: widget.borderThickness,
            ),
          ),
          const SizedBox(width: 10), // Spasi antara checkbox dan teks
          Text(widget.label), // Teks yang terhubung dengan checkbox
        ],
      ),
    );
  }
}

class _CheckboxPainter extends CustomPainter {
  final bool isChecked;
  final Color checkedColor;
  final Color uncheckedColor;
  final double borderThickness;

  _CheckboxPainter({
    required this.isChecked,
    required this.checkedColor,
    required this.uncheckedColor,
    required this.borderThickness,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = isChecked ? checkedColor : uncheckedColor
      ..style = PaintingStyle.fill;

    // Gambar kotak checkbox
    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(rect, paint);

    // Gambar border kotak
    paint
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderThickness;
    canvas.drawRect(rect, paint);

    if (isChecked) {
      // Gambar tanda centang (check) di dalam checkbox
      paint
        ..color = Colors.white
        ..strokeWidth = 5
        ..style = PaintingStyle.stroke;
      Path checkPath = Path()
        ..moveTo(size.width * 0.2, size.height * 0.5)
        ..lineTo(size.width * 0.4, size.height * 0.7)
        ..lineTo(size.width * 0.8, size.height * 0.3);
      canvas.drawPath(checkPath, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
