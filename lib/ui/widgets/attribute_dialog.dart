import 'package:flutter/material.dart';
import 'package:repositories/models/organization.dart';

enum AttributeDialogType { simple, withOptions }

class AttributeDialog extends StatefulWidget {
  final AttributeDialogType type;
  final Set<String> _options;

  AttributeDialog({super.key}) : type = AttributeDialogType.simple, _options = {};

  AttributeDialog.withOptions({super.key, List<String> options = const []})
    : type = AttributeDialogType.withOptions,
      _options = Set.from(options);

  @override
  State<AttributeDialog> createState() => _AttributeDialogState();
}

class _AttributeDialogState extends State<AttributeDialog> {
  final _nameController = TextEditingController();
  final _optionsController = TextEditingController();
  bool _hasOptionsText = false;

  @override
  void initState() {
    super.initState();
    _optionsController.addListener(() {
      setState(() {
        _hasOptionsText = _optionsController.text.trim().isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _optionsController.dispose();
    super.dispose();
  }

  void _handleSave(BuildContext context) {
    final name = _nameController.text.trim();
    if (name.isEmpty) return;

    if (widget.type == AttributeDialogType.simple) {
      Navigator.of(context).pop(Attribute.text(label: name));
    } else {
      var attribute = Attribute.multiSelect(
        label: name,
        options: widget._options.map((e) => Option(value: e)).toList(),
      );
      Navigator.of(context).pop(attribute);
    }
  }

  void _onAdd() {
    final newOptions = _optionsController.text.split(',').map((e) => e.trim()).where((e) => e.isNotEmpty);
    if (newOptions.isEmpty) return;
    widget._options.addAll(newOptions);
    _optionsController.clear();

    setState(() {});
  }

  void _onDelete(String option) {
    widget._options.remove(option);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.type == AttributeDialogType.simple ? 'Create Attribute' : 'Create Multi Attribute'),
      actions: [
        TextButton(onPressed: Navigator.of(context).pop, child: Text('Close')),
        TextButton(onPressed: () => _handleSave(context), child: Text('Save')),
      ],
      content: SizedBox(
        width: 400,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(controller: _nameController, decoration: InputDecoration(labelText: 'Name')),
            if (widget.type == AttributeDialogType.withOptions) ...[
              SizedBox(height: 16),
              TextField(
                controller: _optionsController,
                decoration: InputDecoration(
                  labelText: 'Options',
                  hintText: 'eg. Option 1, Option 2',
                  suffix: IconButton(onPressed: !_hasOptionsText ? null : _onAdd, icon: Icon(Icons.add)),
                ),
              ),
              if (widget._options.isNotEmpty) ...[
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Added Options:', style: Theme.of(context).textTheme.titleSmall),
                    TextButton.icon(
                      onPressed: () => setState(() => widget._options.clear()),
                      icon: Icon(Icons.clear_all),
                      label: Text('Clear All'),
                    ),
                  ],
                ),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children:
                      widget._options
                          .map((e) => Chip(label: Text(e), onDeleted: () => _onDelete(e)))
                          .toList(),
                ),
              ],
            ],
          ],
        ),
      ),
    );
  }
}
