import 'package:test/test.dart';
import 'package:test_process/test_process.dart';
import 'package:path/path.dart' as p;

import 'test_utils.dart';

void main() async {
  group('samples_booking', () {
    setUp(() async {
      var result = await runFlutterPubGet('samples_booking');
      expect(result.exitCode, 0);
    });

    test('can run monarch', () async {
      await runMonarchAndVerify('samples_booking');
    });

    tearDown(() async {
      await killMonarch('samples_booking');
    });
  });
}

Future<void> runMonarchAndVerify(String projectName) async {
  var monarchRun = await startTestProcess(monarch_exe, ['run', '-v'],
      workingDirectory: getWorkingDirectory('samples_booking'));
  var stdout_ = monarchRun.stdout;
  await expectLater(stdout_, emitsThrough('Starting Monarch.'));
  await expectLater(stdout_, emitsThrough('Preparing stories...'));
  await expectLater(stdout_, emitsThrough('Launching Monarch app...'));
  await expectLater(stdout_, emitsThrough('Attaching to stories...'));
  await expectLater(stdout_, emitsThrough('Setting up stories watch...'));
  await expectLater(stdout_, emitsThrough('Monarch key commands:'));
  await expectLater(stdout_, emitsThrough(startsWith('Monarch is ready.')));
  monarchRun.kill();
  await monarchRun.shouldExit();
}
