import 'package:test/test.dart';
import 'test_utils.dart';

void main() async {
  testSampleProject('samples_booking');
  testSampleProject('samples_easy_localization');
  testSampleProject('samples_intl_tools');
  testSampleProject('samples_patterns');
  testSampleProject('samples_riverpod');
}

void testSampleProject(String projectName) {
  group(projectName, () {
    setUp(() async {
      var result = await runFlutterPubGet(projectName);
      expect(result.exitCode, 0);
    });

    test('can run monarch', () async {
      await runMonarchAndVerify(projectName);
    });

    tearDown(() async {
      await killMonarch(projectName);
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
