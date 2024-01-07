import 'package:flutter/cupertino.dart';

class CustomCupertinoPicker<T> extends StatefulWidget {
  const CustomCupertinoPicker({super.key, required this.lista});
  final List<T> lista;

  @override
  State<CustomCupertinoPicker> createState() => _CustomCupertinoPickerState();
}

class _CustomCupertinoPickerState extends State<CustomCupertinoPicker> {
  static const double _kItemExtent = 32.0;
  int _selectedMovimento = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoPicker(
      magnification: 1.22,
      squeeze: 1.22,
      useMagnifier: true,
      itemExtent: _kItemExtent,
      scrollController: FixedExtentScrollController(
          initialItem: _selectedMovimento
      ),
      onSelectedItemChanged: (int selectedItem) {
        setState(() {
          _selectedMovimento = selectedItem;
        });
      },
      children: List<Widget>.generate(widget.lista.length, (int index) {
        return Center(child: Text(widget.lista[index]));
      }),
    );
  }
}
