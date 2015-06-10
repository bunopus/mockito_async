library foo;

import 'dart:async';

class Foo {
  Future<String> doStuff() {}
}

tryFoo(Foo foo) async {
  try {
    await foo.doStuff();
  } catch(e) {}
  throw('foo threw an exception');
}


class FooSync {
  String doStuff() {}
}

tryFooSync(FooSync foo) {
  try {
    foo.doStuff();
  } catch(e) {}
  throw('foo threw an exception');
}
