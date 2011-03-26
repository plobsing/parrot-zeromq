function main[main](var argv) {
    using extern Test.More;
    using extern ZeroMQ;

    using Test.More.plan;
    using Test.More.ok;

    plan(3);

    var ctx = new ZeroMQ.Context();
    ctx.term();
    ${ sweep 1 };
    ok(1, 'manual termination');

    ctx = new ZeroMQ.Context();
    ${ sweep 1 };
    ok(1, 'redundant automatic termination');

    ctx = null;
    ${ sweep 1 };
    ok(1, 'automatic termination');
}

