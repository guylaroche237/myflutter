import 'package:flutter/material.dart';
import 'package:myflutter/domain/widget/button/black_outline_button.dart';



class CustomDatePicker extends StatefulWidget {
  CustomDatePicker(
      {Key key,
      this.label,
      this.onChanged,
      this.isSmall = false,
      this.initialDate,
      this.firstDate,
      this.lastDate})
      : super(key: key);
  final String label;
  final Function(DateTime) onChanged;
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final bool isSmall;
  @override
  _CustomDatePickerState createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime _selectedDate;
  @override
  Widget build(BuildContext context) {
    return BlackButtonOutline(
        padding: widget.isSmall
            ? EdgeInsets.symmetric(horizontal: 16, vertical: 8)
            : null,
        text: _selectedDate == null
            ? widget.label
            : widget.label +
                ": ${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}",
        expandText: true,
        onPressed: () {
          Future<DateTime> selectedDate = showDatePicker(
            context: context,
            initialDate: widget.initialDate ?? DateTime.now().add(Duration(days: 3)),
            firstDate: widget.firstDate ?? DateTime.now(),
            lastDate: widget.lastDate ?? DateTime.now().add(Duration(days: 30)),
            builder: (BuildContext context, Widget child) {
              return Theme(
                data: ThemeData.light(),
                child: child,
              );
            },
          );
          selectedDate.then((v) {
            setState(() => _selectedDate = v);
            widget.onChanged(v);
          });
        });
  }
}
