$include_const 'ZeroMQ/Constants.pasm';

function main[main](var argv) {
    using extern Test.More;
    using extern ZeroMQ;

    using Test.More.plan;
    using Test.More.ok;

    plan(3);

    var ctx  = new ZeroMQ.Context();

    var sock = ctx.socket(ZMQ_REP);
    sock.close();
    ok(1, 'manual close');

    ${ sweep 1 };
    ok(1, 'redundant automatic close');

    sock = new ZeroMQ.Socket(ctx, ZMQ_REP);
    sock = null;
    ${ sweep 1 };
    ok(1, 'automatic close');
}
