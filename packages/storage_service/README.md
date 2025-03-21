# Storage Service

A Flutter package that provides a simple interface for interacting with Firebase Storage.

## Features

- Upload files to Firebase Storage
- Download files from Firebase Storage
- Delete files from Firebase Storage
- Track upload progress with UI components
- File type detection and handling
- Web support with proper file saving

## Getting started

1. Add this package to your `pubspec.yaml`:

```yaml
dependencies:
  storage_service: ^0.0.1
```

2. Make sure your app is initialized with Firebase:

```dart
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
```

## Usage

```dart
// Create a storage service instance
final storageService = StorageService();

// Pick files from device
final files = await storageService.pickFiles(
  allowedExtensions: ['pdf', 'doc', 'docx']
);

// Upload files
storageService.uploadFiles(files);

// Get download URL
final ref = FirebaseStorage.instance.ref().child('path/to/file');
final url = await storageService.getDownloadURL(ref);

// Download file
await storageService.downloadBytes(ref);

// Delete file
await storageService.deleteFile(ref);
```

### Tracking uploads

The service provides a ValueNotifier to track uploads:

```dart
ValueListenableBuilder<List<UploadTask>>(
  valueListenable: storageService.uploadTasks,
  builder: (context, tasks, _) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return YourUploadTaskWidget(
          task: task,
          onDismissed: () => storageService.removeTask(index),
          // ...other callbacks
        );
      },
    );
  },
),
```

## Additional information

This package is designed to be used with Firebase Storage. Make sure you have Firebase correctly set up in your project before using this package.
