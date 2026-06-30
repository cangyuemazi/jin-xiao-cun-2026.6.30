import 'dart:io';

import 'package:path/path.dart' as p;

class AppDatabasePaths {
  const AppDatabasePaths._();

  static const dataDirectoryName = 'JinXiaoCun_2026_data';
  static const databaseDirectoryName = 'database';
  static const backupDirectoryName = 'backup';
  static const importDirectoryName = 'import';
  static const exportDirectoryName = 'export';
  static const attachmentsDirectoryName = 'attachments';
  static const logsDirectoryName = 'logs';
  static const databaseFileName = 'inventory.db';

  static Directory get dataRootDirectory {
    final basePath =
        Platform.environment['LOCALAPPDATA'] ??
        Platform.environment['APPDATA'] ??
        Platform.environment['USERPROFILE'] ??
        Directory.systemTemp.path;

    return Directory(p.join(basePath, dataDirectoryName));
  }

  static Directory get databaseDirectory {
    return Directory(p.join(dataRootDirectory.path, databaseDirectoryName));
  }

  static File get databaseFile {
    return File(p.join(databaseDirectory.path, databaseFileName));
  }

  static List<Directory> get runtimeDirectories {
    return [
      databaseDirectory,
      Directory(p.join(dataRootDirectory.path, backupDirectoryName)),
      Directory(p.join(dataRootDirectory.path, importDirectoryName)),
      Directory(p.join(dataRootDirectory.path, exportDirectoryName)),
      Directory(p.join(dataRootDirectory.path, attachmentsDirectoryName)),
      Directory(p.join(dataRootDirectory.path, logsDirectoryName)),
    ];
  }

  static void ensureRuntimeDirectories() {
    for (final directory in runtimeDirectories) {
      if (!directory.existsSync()) {
        directory.createSync(recursive: true);
      }
    }
  }
}
