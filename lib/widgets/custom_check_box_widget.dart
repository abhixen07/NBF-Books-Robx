import 'package:flutter/material.dart';

import '../style/style.dart';

class CustomCheckboxGroup extends StatefulWidget {
  final String? label;
  final List<Widget> options;
  final bool isRequired;
  final ValueChanged<Map<int, bool>> onChanged;
  final Color? labelColor;
  final FontWeight? labelFontWeight;
  final double? labelFontSize;
  final Color? checkboxActiveColor;
  final Color? optionTextColor;
  final double? optionFontSize;
  final FontWeight? optionFontWeight;
  final BoxShape checkboxShape;
  final Map<int, bool>? controller;
  final Color? checkColor; // New optional parameter for check color

  const CustomCheckboxGroup({
    this.label,
    required this.options,
    this.isRequired = false,
    required this.onChanged,
    this.labelColor =whiteColor,
    this.labelFontWeight = FontWeight.bold,
    this.labelFontSize = 16.0,
    this.checkboxActiveColor = whiteColor,
    this.optionTextColor = whiteColor,
    this.optionFontSize = 16.0,
    this.optionFontWeight = FontWeight.w600,
    this.checkboxShape = BoxShape.rectangle,
    this.controller,
    this.checkColor = blackColor, // Default check color
    super.key,
  });

  @override
  _CustomCheckboxGroupState createState() => _CustomCheckboxGroupState();
}

class _CustomCheckboxGroupState extends State<CustomCheckboxGroup> {
  late Map<int, bool> selectedOptions;

  @override
  void initState() {
    super.initState();
    selectedOptions = widget.controller ??
        {
          for (int i = 0; i < widget.options.length; i++) i: false,
        };
  }

  void _toggleCheckbox(int index) {
    setState(() {
      selectedOptions[index] = !(selectedOptions[index] ?? false);
      widget.controller?[index] = selectedOptions[index]!;
      widget.onChanged(selectedOptions);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Row(
            children: [
              Text(
                widget.label!,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: widget.labelFontSize,
                  fontWeight: widget.labelFontWeight,
                  color: widget.labelColor,
                ),
              ),
              if (widget.isRequired)
                Text(
                  "*",
                  style: TextStyle(
                    fontFamily: 'Inter',

                    color: redColor,
                    fontSize: widget.labelFontSize,
                  ),
                ),
            ],
          ),
        Wrap(
          spacing: 0.0, // Tightens spacing between items horizontally
          runSpacing: 0.0, // Tightens spacing between items vertically
          children: List.generate(widget.options.length, (index) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Checkbox(
                  value: selectedOptions[index] ?? false,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  visualDensity: VisualDensity.compact,
                  fillColor: MaterialStateProperty.resolveWith<Color>((states) {
                    if (states.contains(MaterialState.selected)) {
                      return widget.checkboxActiveColor ?? whiteColor;
                    }
                    return Colors.transparent;
                  }),
                  checkColor: widget.checkColor, // Use the new parameter
                  side: BorderSide(
                    color: blackColor,
                    width: 2.0,
                  ),
                  shape: widget.checkboxShape == BoxShape.circle
                      ? RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  )
                      : null,
                  onChanged: (bool? value) {
                    _toggleCheckbox(index);
                  },
                ),
                widget.options[index], // Render the rich text or any widget
              ],
            );
          }),
        ),
      ],
    );
  }
}