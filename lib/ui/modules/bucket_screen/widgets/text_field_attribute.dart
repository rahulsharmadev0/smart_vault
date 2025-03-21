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

//------------------------
// Multi Select Dropdown
//------------------------

class MultiSelectDropdown extends StatefulWidget {
  final Attribute attribute;
  final ValueNotifier<List<Option>>? selectedOptions;

  const MultiSelectDropdown({super.key, required this.attribute, this.selectedOptions});

  @override
  State<MultiSelectDropdown> createState() => _MultiSelectDropdownState();
}

class _MultiSelectDropdownState extends State<MultiSelectDropdown> {
  late final ValueNotifier<List<Option>> _valueNotifier =
      widget.selectedOptions ?? ValueNotifier([]);

  final MenuController controller = MenuController();
  final FocusNode _buttonFocusNode = FocusNode(debugLabel: 'Menu Button');

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _valueNotifier,
      builder:
          (_, selectedItems, __) => MenuAnchor(
            controller: controller,
            childFocusNode: _buttonFocusNode,
            builder: (context, menuCtrl, child) {
              return FilledButton(
                child: Text('${widget.attribute.label} (${selectedItems.length})'),
                onPressed: () => menuCtrl.isOpen ? menuCtrl.close() : menuCtrl.open(),
              );
            },
            menuChildren: [
              for (var item in (widget.attribute as MultiSelectAttribute).options)
                CheckboxMenuButton(
                  style: ButtonStyle(
                    minimumSize: WidgetStateProperty.all(const Size(100, 48)),
                  ),
                  key: Key(item.id),
                  closeOnActivate: false,
                  value: selectedItems.contains(item),
                  onChanged: (bool? value) {
                    final updatedItems = List<Option>.from(selectedItems);
                    value == true ? updatedItems.add(item) : updatedItems.remove(item);
                    _valueNotifier.value = updatedItems;
                  },
                  child: Text(item.value),
                ),
            ],
          ),
    );
  }

  @override
  void dispose() {
    _buttonFocusNode.dispose();
    super.dispose();
  }
}

//------------------------
// Single Radio Select Dropdown
//------------------------

class SingleSelectDropdown extends StatefulWidget {
  final Attribute attribute;
  final ValueNotifier<Option?>? selectedOption;

  const SingleSelectDropdown({super.key, required this.attribute, this.selectedOption});

  @override
  State<SingleSelectDropdown> createState() => _SingleSelectDropdownState();
}

class _SingleSelectDropdownState extends State<SingleSelectDropdown> {
  late final ValueNotifier<Option?> _valueNotifier =
      widget.selectedOption ?? ValueNotifier(null);

  final MenuController controller = MenuController();
  final FocusNode _buttonFocusNode = FocusNode(debugLabel: 'Single Select Menu Button');

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _valueNotifier,
      builder:
          (_, selectedItem, __) => MenuAnchor(
            controller: controller,
            childFocusNode: _buttonFocusNode,
            builder: (context, menuCtrl, child) {
              return FilledButton(
                child: Text(selectedItem?.value ?? 'Select an option'),
                onPressed: () => menuCtrl.isOpen ? menuCtrl.close() : menuCtrl.open(),
              );
            },
            menuChildren: [
              for (var item in (widget.attribute as SingleSelectAttribute).options)
                RadioMenuButton<Option>(
                  key: Key(item.id),
                  value: item,
                  groupValue: selectedItem,
                  onChanged: (value) {
                    _valueNotifier.value = value;
                    controller.close();
                  },
                  child: Text(item.value),
                ),
            ],
          ),
    );
  }

  @override
  void dispose() {
    _buttonFocusNode.dispose();
    super.dispose();
  }
}

class DateSelectorFieldAttribute extends StatefulWidget {
  final Attribute attribute;
  final ValueNotifier<DateTime?>? selectedDate;

  const DateSelectorFieldAttribute({
    super.key,
    required this.attribute,
    this.selectedDate,
  });

  @override
  State<DateSelectorFieldAttribute> createState() => _DateSelectorFieldAttributeState();
}

class _DateSelectorFieldAttributeState extends State<DateSelectorFieldAttribute> {
  late final ValueNotifier<DateTime?> _valueNotifier =
      widget.selectedDate ?? ValueNotifier(null);

  final FocusNode _buttonFocusNode = FocusNode(debugLabel: 'Date Selector Button');

  @override
  Widget build(BuildContext context) {
    var attribute = widget.attribute as DateTimeAttribute;
    return ValueListenableBuilder(
      valueListenable: _valueNotifier,
      builder:
          (_, selectedDate, __) => FilledButton(
            child: Text(
              selectedDate != null
                  ? '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}'
                  : 'Select a date',
            ),
            onPressed: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: selectedDate ?? DateTime.now(),
                firstDate: attribute.firstDate,
                lastDate: attribute.lastDate,
              );
              if (pickedDate != null && pickedDate != selectedDate) {
                _valueNotifier.value = pickedDate;
              }
            },
          ),
    );
  }

  @override
  void dispose() {
    if (widget.selectedDate == null) {
      _valueNotifier.dispose();
    }
    _buttonFocusNode.dispose();
    super.dispose();
  }
}
