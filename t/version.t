
function main[main](var argv) {
    load_bytecode('ZeroMQ.pbc');
    using ZeroMQ.version;
    string vstring;
    ${ get_repr vstring, version() };
    say(vstring);
}

