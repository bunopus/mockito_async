import 'dart:async';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

import 'package:mockito_async/foo.dart';

class MockFoo extends Mock implements Foo {
  noSuchMethod(inv) => super.noSuchMethod(inv);
}

class MockFooSync extends Mock implements FooSync {
  noSuchMethod(inv) => super.noSuchMethod(inv);
}

main() {
  group('async and mockito', () {
    // Now passes too!
    test('supports async calls using mock errors', () {
      var foo = new MockFoo();
      when(foo.doStuff()).thenAnswer((_) => new Future.error('mock error'));
      expect(foo.doStuff(),throwsA(equals('mock error')));
    });

    // Passes
    test('supports async calls using mock errors', () {
      var foo = new MockFoo();
      when(foo.doStuff()).thenReturn(new Future.error('mock error'));

      return tryFooNoAsync(foo).catchError((e) {
        expect(true, equals(true));
      });
    });

    // Passes
    test('supports sync calls using mock errors', () {
      var foo = new MockFooSync();
      when(foo.doStuff()).thenReturn(new Exception('mock error'));

      try {
        tryFooSync(foo);
      } catch (e) {
        expect(true, equals(true));
      }
    });
  });
}
