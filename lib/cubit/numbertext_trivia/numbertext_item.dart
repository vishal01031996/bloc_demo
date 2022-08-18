import 'package:bloc_demo/cubit/db/numbertext.dart';
import 'package:flutter/material.dart';

class NumberTextItem extends StatefulWidget {
  NumberText numberText;

  NumberTextItem(this.numberText, {Key? key}) : super(key: key);

  @override
  State<NumberTextItem> createState() => _NumberTextItemState();
}

class _NumberTextItemState extends State<NumberTextItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 1,
      color: const Color(0xFFF8F8F8),
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(6),
        child: Column(
          children: [
            Text(
              "Number :- ${widget.numberText.number.toString()}",
              style: const TextStyle(fontSize: 16, color: Color(0xFF1D343F)),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              widget.numberText.text.toString(),
              style: const TextStyle(fontSize: 16, color: Color(0xFF1D343F)),
            ),
          ],
        ),
      ),
    );
  }
}
