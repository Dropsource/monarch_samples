import 'dart:io';
import 'package:test_process/test_process.dart';
import 'package:test/test.dart';
import 'package:monarch_utils/timers.dart';
import 'package:monarch_io_utils/monarch_io_utils.dart';
import 'package:path/path.dart' as p;

/// Returns the monarch exe path as set by environment variable
/// MONARCH_EXE; if not set, then the monarch exe should be
/// sourced in the environment PATH before running these tests.
String monarch_exe = Platform.environment['MONARCH_EXE'] ?? 'monarch';

/// Returns the flutter exe path as set by environment variables
/// FLUTTER_EXE; if not set, then the flutter exe should be sourced
/// in the environment PATH before running these tests.
String flutter_exe = Platform.environment['FLUTTER_EXE'] ?? 'flutter';

/// 250ms delay.
Future<void> get briefly => Future.delayed(const Duration(milliseconds: 250));

Future<void> killMonarch(String projectName) async {
  await futureForPlatform(
    macos: () async {
      await runProcess('pkill', ['Monarch']);
      await runProcess('pkill', [
        '-f',
        '.dart_tool/build/generated/$projectName/lib/main_monarch.g.dart'
      ]);
    },
    windows: () async {
      await runProcess(
          'taskkill', ['/F', '/IM', 'monarch_windows_app.exe', '/T']);
      await runProcess('taskkill', ['/F', '/IM', 'monarch.exe', '/T']);
    },
    linux: () async {
      await runProcess('pkill', ['-f', 'monarch_linux_app']);
      await runProcess('pkill', ['-f', 'monarch.run']);
      await runProcess('pkill', [
        '-f',
        '.dart_tool/build/generated/$projectName/lib/main_monarch.g.dart'
      ]);
    },
  );
}

String prettyCommand(String executable, Iterable<String> arguments) =>
    '$executable ${arguments.join(' ')}';

void print_(String message) {
  if (Platform.environment.containsKey('VERBOSE')) {
    print(message);
  }
}

Future<ProcessResult> runProcess(String executable, List<String> arguments,
        {String? workingDirectory,
        Map<String, String>? environment,
        bool includeParentEnvironment = true}) =>
    Process.run(executable, arguments,
        workingDirectory: workingDirectory,
        environment: environment,
        includeParentEnvironment: includeParentEnvironment,
        runInShell: Platform.isWindows);

Future<TestProcess> startTestProcess(
        String executable, Iterable<String> arguments,
        {String? workingDirectory,
        Map<String, String>? environment,
        bool includeParentEnvironment = true,
        bool runInShell = false,
        String? description,
        bool forwardStdio = false}) =>
    TestProcess.start(executable, arguments,
        workingDirectory: workingDirectory,
        includeParentEnvironment: includeParentEnvironment,
        runInShell: Platform.isWindows,
        description: description,
        forwardStdio: forwardStdio);

String getWorkingDirectory(String projectName) => p.join('..', projectName);

Future<ProcessResult> runFlutterPubGet(String projectName) async {
  return runProcess(flutter_exe, ['pub', 'get'],
      workingDirectory: getWorkingDirectory(projectName));
}

Future<void> runMonarchInit(String projectName,
    {required String workingDirectory, required IOSink sink}) async {
  await setEmailCapturedFlag();
  var process = await startTestProcess(monarch_exe, ['init', '-v'],
      workingDirectory: workingDirectory);
  var heartbeat = Heartbeat('`${process.description}`', print_)..start();
  await expectLater(process.stdout,
      emitsThrough('Monarch successfully initialized in this project.'));
  await process.shouldExit();
  heartbeat.complete();
}

Future<void> setEmailCapturedFlag() =>
    emailCapturedFile.writeAsString('1', mode: FileMode.write);

Future<void> resetEmailCapturedFlag() => emailCapturedFile.delete();

String get userDirectoryEnvironmentVariable =>
    valueForPlatform(macos: 'HOME', windows: 'USERPROFILE', linux: 'HOME');

String? get userDirectoryPath =>
    Platform.environment[userDirectoryEnvironmentVariable];

String get dataDirectoryRelativePath => valueForPlatform(
    macos: 'Library/Application Support/com.dropsource.monarch/data',
    windows: r'AppData\Local\Monarch\data',
    linux: '.config/monarch/data');

File get emailCapturedFile => File(p.join(
    userDirectoryPath!, dataDirectoryRelativePath, 'email_captured.info'));
