enum FileMessage {
  creating('Creating file...'),
  created('File created successfully'),
  updating('Updating file...'),
  updated('File updated successfully'),
  deleting('Deleting file...'),
  deleted('File deleted successfully'),
  loading('Loading files...'),
  loaded('Files loaded successfully'),
  noFiles('No files found');

  final String message;
  const FileMessage(this.message);

  String getErrorMessage(Object error) => 'Failed to $name file: $error';
}

enum OrganizationMessage {
  loading('Loading organization...'),
  loaded('Organization loaded successfully'),
  updating('Updating organization...'),
  updated('Organization updated successfully');

  final String message;
  const OrganizationMessage(this.message);

  String getErrorMessage(Object error) => 'Failed to $name organization: $error';
}

enum BucketMessage {
  creating('Creating bucket...'),
  created('Bucket created successfully'),
  updating('Updating bucket...'),
  updated('Bucket updated successfully'),
  deleting('Deleting bucket...'),
  deleted('Bucket deleted successfully'),
  loading('Loading buckets...'),
  loaded('Buckets loaded successfully');

  final String message;
  const BucketMessage(this.message);

  String getErrorMessage(Object error) => 'Failed to $name bucket: $error';
}
