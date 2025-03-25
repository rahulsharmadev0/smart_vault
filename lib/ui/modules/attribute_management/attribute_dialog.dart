import 'package:flutter/material.dart';
import 'package:repositories/models/organization.dart';

class AttributeDialog extends StatefulWidget {
  final Attribute attribute;

  const AttributeDialog({required this.attribute, super.key});

  @override
  State<AttributeDialog> createState() => _AttributeDialogState();
}

class _AttributeDialogState extends State<AttributeDialog> {
  late final _nameController = TextEditingController(text: widget.attribute.label);
  late final ValueNotifier<List<Option>> _options = ValueNotifier(
    widget.attribute.map(
      singleSelect: (attribute) => attribute.options,
      multiSelect: (attribute) => attribute.options,
      orElse: () => [],
    ),
  );

  late final TextEditingController _optionsController;
  bool _hasOptionsText = false;

  bool get hasOption =>
      widget.attribute is SingleSelectAttribute ||
      widget.attribute is MultiSelectAttribute;

  @override
  void initState() {
    super.initState();

    if (hasOption) {
      _optionsController = TextEditingController();
      _optionsController.addListener(() {
        setState(() {
          _hasOptionsText = _optionsController.text.trim().isNotEmpty;
        });
      });
    }
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

    widget.attribute.map(
      text: (attribute) => Navigator.of(context).pop(attribute.copyWith(label: name)),
      singleSelect: (attribute) {
        return Navigator.of(
          context,
        ).pop(attribute.copyWith(label: name, options: _options.value));
      },
      multiSelect: (attribute) {
        return Navigator.of(
          context,
        ).pop(attribute.copyWith(label: name, options: _options.value));
      },
      orElse: () => null,
    );
  }

  void _onAdd() {
    final newOptions = _optionsController.text
        .split(',')
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .map((e) => Option(value: e));

    if (newOptions.isEmpty) return;
    _options.value = [..._options.value, ...newOptions];
    _optionsController.clear();

    setState(() {});
  }

  void _onDelete(Option option) {
    _options.value = [..._options.value]..remove(option);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        widget.attribute.map(
          text: (attribute) => 'Text Attribute',
          singleSelect: (attribute) => 'Single Select Attribute',
          multiSelect: (attribute) => 'Multi Select Attribute',
          orElse: () => 'Attribute',
        ),
      ),
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
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            if (hasOption) ...[
              SizedBox(height: 16),
              TextField(
                controller: _optionsController,
                decoration: InputDecoration(
                  labelText: 'Options',
                  hintText: 'eg. Option 1, Option 2',
                  suffix: IconButton(
                    onPressed: !_hasOptionsText ? null : _onAdd,
                    icon: Icon(Icons.add),
                  ),
                ),
              ),

              ValueListenableBuilder(
                valueListenable: _options,
                builder: (context, options, __) {
                  if (options.isEmpty) return SizedBox.shrink();
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Added Options:',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          TextButton.icon(
                            onPressed: () => setState(() => _options.value = []),
                            icon: Icon(Icons.clear_all),
                            label: Text('Clear All'),
                          ),
                        ],
                      ),
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children:
                            options
                                .map(
                                  (e) => Chip(
                                    label: Text(e.value),
                                    onDeleted: () => _onDelete(e),
                                  ),
                                )
                                .toList(),
                      ),
                    ],
                  );
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}
