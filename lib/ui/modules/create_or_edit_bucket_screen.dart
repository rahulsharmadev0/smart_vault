import 'package:edukit/ui/bloc/bucket_bloc.dart';
import 'package:edukit/ui/bloc/organization_bloc.dart';
import 'package:edukit/ui/material/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:repositories/models.dart';
import 'package:uuid/uuid.dart';

class EditFormState {
  final String bucketName;
  final String bucketDescription;
  final List<DocumentType> fileTypes;

  const EditFormState({required this.bucketName, required this.bucketDescription, required this.fileTypes});

  static const empty = EditFormState(bucketName: '', bucketDescription: '', fileTypes: []);

  EditFormState copyWith({String? bucketName, String? bucketDescription, List<DocumentType>? fileTypes}) {
    return EditFormState(
      bucketName: bucketName ?? this.bucketName,
      bucketDescription: bucketDescription ?? this.bucketDescription,
      fileTypes: fileTypes ?? this.fileTypes,
    );
  }

  bool get isValid {
    return bucketName.isNotEmpty && bucketDescription.isNotEmpty && fileTypes.isNotEmpty;
  }

  Bucket? toBucket(String orgId) {
    if (!isValid) return null;
    return Bucket(
      bucketId: Uuid().v4(),
      title: bucketName,
      description: bucketDescription,
      fileTypes: fileTypes,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      attributes: [],
      orgId: orgId,
    );
  }
}

class EditFormCubit extends Cubit<EditFormState> {
  OrganizationBloc orgBloc;
  EditFormCubit(this.orgBloc) : super(EditFormState.empty);

  void updateBucketName(String bucketName) {
    emit(state.copyWith(bucketName: bucketName));
  }

  void updateBucketDescription(String bucketDescription) {
    emit(state.copyWith(bucketDescription: bucketDescription));
  }

  void addFileType(DocumentType fileType) {
    emit(state.copyWith(fileTypes: [...state.fileTypes, fileType]));
  }

  void removeFileType(DocumentType fileType) {
    var fileTypes = [...state.fileTypes]..remove(fileType);
    emit(state.copyWith(fileTypes: fileTypes));
  }
}

class CreateOrEditBucketScreen extends StatelessWidget {
  const CreateOrEditBucketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orgBloc = context.read<OrganizationBloc>();
    final editFormCubit = EditFormCubit(orgBloc);

    return BlocProvider(
      create: (context) => editFormCubit,
      child: Builder(
        builder: (context) {
          return AppScaffold(
            titleText: 'Create Bucket',
            bottomBarActions: [SaveButton()],
            body: Column(
              spacing: 12,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [BucketNameField(), BucketDescriptionField(), FileTypeSelector()],
            ),
          );
        },
      ),
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
          onPressed: () {
            if (state.isValid) {
              final bucketBloc = context.read<BucketBloc>();
              final orgBloc = context.read<OrganizationBloc>();
              var bucket = state.toBucket(orgBloc.orgId);
              bucketBloc.add(
                BucketEvent.create(
                  orgBloc.orgId,
                  bucket!,
                  onCompleted:
                      () => context.pushReplacementNamed(
                        'attribute-management',
                        pathParameters: {'bucketId': bucket.bucketId},
                      ),
                ),
              );
            }
          },
          child: Text('Save'),
        );
      },
    );
  }
}

class BucketNameField extends StatelessWidget {
  const BucketNameField({super.key});

  @override
  Widget build(BuildContext context) {
    var read = context.read<EditFormCubit>();
    return TextFormField(
      onChanged: read.updateBucketName,
      decoration: InputDecoration(labelText: 'Bucket Name', hintText: 'Enter the name of the bucket'),
    );
  }
}

class BucketDescriptionField extends StatelessWidget {
  const BucketDescriptionField({super.key});

  @override
  Widget build(BuildContext context) {
    var read = context.read<EditFormCubit>();
    return TextFormField(
      onChanged: read.updateBucketDescription,
      maxLines: 4,
      decoration: InputDecoration(
        labelText: 'Bucket Description',
        hintText: 'Enter the description of the bucket',
      ),
    );
  }
}

class FileTypeSelector extends StatelessWidget {
  const FileTypeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    var read = context.read<EditFormCubit>();
    return BlocBuilder<EditFormCubit, EditFormState>(
      buildWhen: (previous, current) => previous.fileTypes != current.fileTypes,
      builder: (context, state) {
        var fileTypes = state.fileTypes;
        return Wrap(
          spacing: 8.0,
          children:
              DocumentType.values.map((doc) {
                return FilterChip(
                  label: Text(doc.fullName),
                  selected: fileTypes.contains(doc),
                  onSelected: (value) {
                    if (value == true) {
                      read.addFileType(doc);
                    } else {
                      read.removeFileType(doc);
                    }
                  },
                );
              }).toList(),
        );
      },
    );
  }
}
