import 'package:app_foundation/gen/assets.gen.dart';

enum DocumentType {
  pdf(fullName: 'PDF', extension: 'pdf'),
  doc(fullName: 'Document', extension: 'doc'),
  sheet(fullName: 'Spreadsheet', extension: 'xlsx'),
  md(fullName: 'Markdown', extension: 'md'),
  txt(fullName: 'Text File', extension: 'txt'),
  csv(fullName: 'CSV', extension: 'csv');

  final String fullName;
  final String extension;
  const DocumentType({required this.fullName, required this.extension});

  SvgGenImage get icon => switch (this) {
    DocumentType.pdf => Assets.svg.pdf,
    DocumentType.doc => Assets.svg.doc,
    DocumentType.sheet => Assets.svg.md,
    DocumentType.md => Assets.svg.md,
    DocumentType.txt => Assets.svg.txt,
    DocumentType.csv => Assets.svg.txt,
  };
}
