import 'package:edukit/ui/bloc/bucket_bloc';
import 'package:edukit/ui/bloc/organization_bloc.dart';
import 'package:edukit/ui/material/scaffold.dart';
import 'cubit/edit_form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:repositories/models.dart';

class CreateOrEditBucketScreen extends StatelessWidget {
  const CreateOrEditBucketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orgBloc = context.read<OrganizationBloc>();

    return BlocProvider(
      create: (context) => EditFormCubit(orgBloc),
      child: Builder(
        builder: (context) {
          return AppScaffold(
            titleText: 'Create Bucket',
            bottomBarActions: const [SaveButton()],
            body: const _BucketForm(),
          );
        },
      ),
    );
  }
}

class _BucketForm extends StatelessWidget {
  const _BucketForm();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditFormCubit, EditFormState>(
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

class SaveButton extends StatelessWidget {
  const SaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditFormCubit, EditFormState>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed:
              state.isValid && !state.isSubmitting ? () => _saveBucket(context) : null,
          child:
              state.isSubmitting
                  ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                  : const Text('Save'),
        );
      },
    );
  }

  Future<void> _saveBucket(BuildContext context) async {
    final formCubit = context.read<EditFormCubit>();
    final bucketBloc = context.read<BucketBloc>();
    final orgBloc = context.read<OrganizationBloc>();

    formCubit.setSubmitting(true);

    try {
      final bucket = formCubit.state.toBucket(orgBloc.orgId);
      if (bucket == null) {
        formCubit.setError('Invalid bucket data');
        formCubit.setSubmitting(false);
        return;
      }

      bucketBloc.add(
        BucketEvent.create(
          orgBloc.orgId,
          bucket,
          onCompleted: () {
            formCubit.setSubmitting(false);
            context.pushReplacementNamed(
              'attribute-management',
              pathParameters: {'bucketId': bucket.bucketId},
            );
          },
          onError: (error) {
            formCubit.setError('Failed to create bucket: $error');
            formCubit.setSubmitting(false);
          },
        ),
      );
    } catch (e) {
      formCubit.setError('An unexpected error occurred: $e');
      formCubit.setSubmitting(false);
    }
  }
}

class BucketNameField extends StatelessWidget {
  const BucketNameField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditFormCubit, EditFormState>(
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
          enabled: !state.isSubmitting,
        );
      },
    );
  }
}

class BucketDescriptionField extends StatelessWidget {
  const BucketDescriptionField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditFormCubit, EditFormState>(
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
          enabled: !state.isSubmitting,
        );
      },
    );
  }
}

class FileTypeSelector extends StatelessWidget {
  const FileTypeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditFormCubit, EditFormState>(
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
                          state.isSubmitting
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
