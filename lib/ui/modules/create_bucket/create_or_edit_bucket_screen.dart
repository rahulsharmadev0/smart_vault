import 'package:bloc_suite/bloc_suite.dart';
import 'package:edukit/ui/app/routes.dart';
import 'package:edukit/ui/material/scaffold.dart';
import 'package:go_router/go_router.dart';
import 'cubit/edit_form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repositories/models.dart';

class CreateOrEditBucketScreen extends StatelessWidget {
  const CreateOrEditBucketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('>>>>> CreateOrEditBucketScreen');
    return BlocProvider(
      create: (context) => EditFormCubit(),
      child: BlocListener<EditFormCubit, EditFormData>(
        listener: (context, state) {
          if (state.isSuccess) {
            context.go(AppRoutes.I.bucket(state.bucketId!));
          }
        },
        child: AppScaffold(
          titleText: 'Create Bucket',
          bottomBarActions: const [SaveButton()],
          body: const _BucketForm(),
        ),
      ),
    );
  }
}

class _BucketForm extends StatelessWidget {
  const _BucketForm();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditFormCubit, EditFormData>(
      builder: (context, state) {
        if (state.errorMessage != null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage!),
                backgroundColor: Colors.red,
                action: SnackBarAction(
                  label: 'Dismiss',
                  textColor: Colors.white,
                  onPressed: () {
                    context.read<EditFormCubit>().setError(null);
                  },
                ),
              ),
            );
          });
        }

        return Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: const [
              SizedBox(height: 8),
              BucketNameField(),
              SizedBox(height: 16),
              BucketDescriptionField(),
              SizedBox(height: 24),
              FileTypeSelector(),
              SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}

class SaveButton extends BlocWidget<EditFormCubit, EditFormData> {
  const SaveButton({super.key});

  @override
  Widget build(BuildContext context, bloc, state) {
    return ElevatedButton(
      onPressed: state.isValid && !state.isProgress ? () => _saveBucket(context) : null,
      child:
          state.isProgress
              ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
              : const Text('Save'),
    );
  }

  void _saveBucket(BuildContext context) {
    final formCubit = context.read<EditFormCubit>();
    formCubit.onSubmit();
  }
}

class BucketNameField extends StatelessWidget {
  const BucketNameField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditFormCubit, EditFormData>(
      buildWhen: (previous, current) => previous.bucketName != current.bucketName,
      builder: (context, state) {
        return TextFormField(
          key: const ValueKey('bucket-name-field'),
          onChanged: context.read<EditFormCubit>().updateBucketName,
          decoration: InputDecoration(
            labelText: 'Bucket Name',
            hintText: 'Enter the name of the bucket',
            errorText: state.bucketName.isNotEmpty ? null : state.nameError,
            prefixIcon: const Icon(Icons.folder),
            border: const OutlineInputBorder(),
          ),
          textInputAction: TextInputAction.next,
          validator: (_) => state.nameError,
          enabled: !state.isProgress,
        );
      },
    );
  }
}

class BucketDescriptionField extends StatelessWidget {
  const BucketDescriptionField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditFormCubit, EditFormData>(
      buildWhen:
          (previous, current) => previous.bucketDescription != current.bucketDescription,
      builder: (context, state) {
        return TextFormField(
          key: const ValueKey('bucket-description-field'),
          onChanged: context.read<EditFormCubit>().updateBucketDescription,
          maxLines: 4,
          decoration: InputDecoration(
            labelText: 'Bucket Description',
            hintText: 'Enter the description of the bucket',
            errorText: state.bucketDescription.isNotEmpty ? null : state.descriptionError,
            prefixIcon: const Icon(Icons.description),
            border: const OutlineInputBorder(),
          ),
          validator: (_) => state.descriptionError,
          enabled: !state.isProgress,
        );
      },
    );
  }
}

class FileTypeSelector extends StatelessWidget {
  const FileTypeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditFormCubit, EditFormData>(
      buildWhen: (previous, current) => previous.fileTypes != current.fileTypes,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Supported File Types',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            if (state.fileTypes.isEmpty)
              Text(
                state.fileTypesError ?? 'Select at least one file type',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                  fontSize: 12,
                ),
              ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children:
                  DocumentType.values.map((doc) {
                    return FilterChip(
                      key: ValueKey('file-type-${doc.name}'),
                      label: Text(doc.fullName),
                      selected: state.fileTypes.contains(doc),
                      onSelected:
                          state.isProgress
                              ? null
                              : (_) => context.read<EditFormCubit>().toggleFileType(doc),
                      avatar: _getIconForDocType(doc),
                    );
                  }).toList(),
            ),
          ],
        );
      },
    );
  }

  Widget _getIconForDocType(DocumentType type) {
    IconData iconData;
    switch (type) {
      case DocumentType.pdf:
        iconData = Icons.picture_as_pdf;
        break;
      case DocumentType.md:
        iconData = Icons.description;
        break;
      case DocumentType.doc:
        iconData = Icons.description;
        break;
      default:
        iconData = Icons.insert_drive_file;
    }
    return Icon(iconData, size: 16);
  }
}
