import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Base dialog class to reduce code duplication
abstract class BaseAttributeDialog extends StatefulWidget {
  const BaseAttributeDialog({super.key});
}

abstract class BaseAttributeDialogState<T extends BaseAttributeDialog> extends State<T> {
  final TextEditingController _nameCtr = TextEditingController();

  @override
  void dispose() {
    _nameCtr.dispose();
    super.dispose();
  }

  // Common dialog actions
  List<Widget> getDefaultActions(BuildContext context) => [
    TextButton(onPressed: () => context.pop(), child: const Text('Cancel')),
    TextButton(onPressed: isValid ? () => onSave(context) : null, child: const Text('Save')),
  ];

  bool get isValid;
  void onSave(BuildContext context);
}

class TextAttributeDialog extends BaseAttributeDialog {
  const TextAttributeDialog({super.key});

  @override
  State<TextAttributeDialog> createState() => _TextAttributeDialogState();
}

class _TextAttributeDialogState extends BaseAttributeDialogState<TextAttributeDialog> {
  @override
  bool get isValid => _nameCtr.text.trim().isNotEmpty;

  @override
  void onSave(BuildContext context) => context.pop(_nameCtr.text.trim());

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Text Attribute'),
      content: TextField(
        controller: _nameCtr,
        decoration: const InputDecoration(labelText: 'Attribute Name', hintText: 'Enter attribute name'),
        onChanged: (_) => setState(() {}), // Trigger validation update
      ),
      actions: getDefaultActions(context),
    );
  }
}

class MultiAttributeDialog extends BaseAttributeDialog {
  const MultiAttributeDialog({super.key});

  @override
  State<MultiAttributeDialog> createState() => _MultiAttributeDialogState();
}

class _MultiAttributeDialogState extends BaseAttributeDialogState<MultiAttributeDialog> {
  final TextEditingController _optionsCtr = TextEditingController();
  final List<String> _options = [];

  @override
  void dispose() {
    _optionsCtr.dispose();
    super.dispose();
  }

  @override
  bool get isValid => _nameCtr.text.trim().isNotEmpty && _options.isNotEmpty;

  @override
  void onSave(BuildContext context) => context.pop((_nameCtr.text.trim(), List<String>.from(_options)));

  void _addOptions() {
    final values = _optionsCtr.text.split(',').map((e) => e.trim()).where((e) => e.isNotEmpty).toList();
    if (values.isNotEmpty) {
      setState(() {
        _options.addAll(values);
        _optionsCtr.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AlertDialog(
      title: const Text('Add Multi-Choice Attribute'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _nameCtr,
              decoration: const InputDecoration(
                labelText: 'Attribute Name',
                hintText: 'Enter attribute name',
              ),
              onChanged: (_) => setState(() {}),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _optionsCtr,
              decoration: InputDecoration(
                labelText: 'Options',
                hintText: 'Enter options (comma-separated)',
                suffixIcon: IconButton(icon: const Icon(Icons.add), onPressed: _addOptions),
              ),
              onSubmitted: (_) => _addOptions(),
            ),
            if (_options.isNotEmpty) ...[
              const SizedBox(height: 12),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children:
                    _options.map((option) {
                      return Chip(
                        label: Text(option),
                        onDeleted: () => setState(() => _options.remove(option)),
                        backgroundColor: theme.colorScheme.primaryContainer,
                      );
                    }).toList(),
              ),
            ],
          ],
        ),
      ),
      actions: getDefaultActions(context),
    );
  }
}
