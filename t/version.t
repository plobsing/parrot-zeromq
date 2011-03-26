
function main[main](var argv) {
    using extern Test.More;
    using Test.More.plan;
    plan(1);

    using extern ZeroMQ;
    using ZeroMQ.version;
    var ver = version();

    using Test.More.is;
    using Test.More.ok;
    using Test.More.nok;
    using Test.More.diag;

    string vstring;
    ${ get_repr vstring, ver };
    diag('libzmq version: ' + vstring);

    is(ver[0], 2, 'major version');
    if (ver[1] == 0)
	diag('WARNING: libzmq version 2.0 is known to hang in certain situations');
}

