import 'package:flutter/material.dart';
import 'package:flutter_suite/flutter_suite.dart';
import 'package:repositories/models/organization.dart';

class TextFieldAttribute extends StatelessWidget {
  final Attribute attribute;
  final TextEditingController textFieldController;
  const TextFieldAttribute({
    super.key,
    required this.attribute,
    required this.textFieldController,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 56,
        maxHeight: 64,
        minWidth: 100,
        maxWidth: 300,
      ),
      child: TextField(
        controller: textFieldController,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: attribute.label,
        ),
      ),
    );
  }
}

//------------------------
// 2 in 1
//------------------------
enum TwoInOne { first, second }

class TwoInOneTextFieldAttribute extends StatefulWidget {
  final Attribute first;
  final Attribute second;
  final TextEditingController textFieldController;
  final ValueNotifier<TwoInOne>? controller;

  const TwoInOneTextFieldAttribute({
    super.key,
    required this.first,
    required this.second,
    required this.textFieldController,
    this.controller,
  });

  @override
  State<TwoInOneTextFieldAttribute> createState() => _TwoInOneTextFieldAttributeState();
}

class _TwoInOneTextFieldAttributeState extends State<TwoInOneTextFieldAttribute> {
  late final ValueNotifier<TwoInOne> _valueNotifier =
      widget.controller ?? ValueNotifier(TwoInOne.first);

  late String _firstCache = '';
  late String _secondCache = '';

  @override
  void initState() {
    super.initState();
    _updateTextField();
    _valueNotifier.addListener(() => _updateTextField());
  }

  void _updateTextField() {
    setState(() {
      if (_valueNotifier.value == TwoInOne.first) {
        _secondCache = widget.textFieldController.text;
        widget.textFieldController.text = _firstCache;
      } else {
        _firstCache = widget.textFieldController.text;
        widget.textFieldController.text = _secondCache;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 56,
        maxHeight: 64,
        minWidth: 100,
        maxWidth: 300,
      ),
      child: ValueListenableBuilder<TwoInOne>(
        valueListenable: _valueNotifier,
        builder: (context, value, child) {
          Attribute curr = value == TwoInOne.first ? widget.first : widget.second;
          return TextField(
            controller: widget.textFieldController,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: curr.label,
              suffixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: toggle,
                  child: Chip(
                    labelStyle: context.TxT.l3,
                    labelPadding: EdgeInsets.all(2),
                    label: Text(curr.attributeId),
                    avatar: Icon(Icons.sync, size: 15),
                  ),
                ),
              ),
            ),
            onChanged: (text) {
              if (_valueNotifier.value == TwoInOne.first) {
                _firstCache = text;
              } else {
                _secondCache = text;
              }
            },
          );
        },
      ),
    );
  }

  void toggle() =>
      _valueNotifier.value =
          _valueNotifier.value == TwoInOne.first ? TwoInOne.second : TwoInOne.first;

  @override
  void dispose() {
    _valueNotifier.dispose();
    super.dispose();
  }
}

//------

class MultiSelectDropdown extends StatefulWidget {
  final List<String> items;
  final List<String> initialSelected;
  final String title;

  const MultiSelectDropdown({
    super.key,
    required this.items,
    this.initialSelected = const [],
    this.title = 'Select Items',
  });

  @override
  State<MultiSelectDropdown> createState() => _MultiSelectDropdownState();
}

class _MultiSelectDropdownState extends State<MultiSelectDropdown> {
  late List<String> _selectedItems;

  @override
  void initState() {
    super.initState();
    _selectedItems = List.from(widget.initialSelected);
  }

  void _toggleSelection(String item) {
    setState(() {
      if (_selectedItems.contains(item)) {
        _selectedItems.remove(item);
      } else {
        _selectedItems.add(item);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      items:
          widget.items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: StatefulBuilder(
                builder:
                    (context, setState) => CheckboxListTile(
                      title: Text(item),
                      value: _selectedItems.contains(item),
                      onChanged: (bool? selected) {
                        _toggleSelection(item);
                        setState(() {});
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
              ),
            );
          }).toList(),
      onChanged: (_) {},
    );
  }
}
