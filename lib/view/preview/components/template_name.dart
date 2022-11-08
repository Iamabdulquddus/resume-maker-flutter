import 'dart:async';
import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import '../../templates/first_template.dart';
import '../../templates/second_template.dart';
import 'data.dart';

const templateName = <TemplateName>[
  TemplateName('Resume', 'resume.dart', generateResume),
  // TemplateName('Resume', 'resume.dart', generate),
];

typedef LayoutCallbackWithData = Future<Uint8List> Function(
    PdfPageFormat pageFormat, CustomData data);

class TemplateName {
  const TemplateName(
    this.name,
    this.file,
    this.builder,
  );
  final String name;
  final String file;
  final LayoutCallbackWithData builder;
}
