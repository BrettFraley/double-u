# Exploratory Notes on `W` language's design, purpose, scope, and implementation

#### Initial Idea / Example

An extrememly simple I/O based domain language, where W means 'write', to write output..
to file, to stream, to json, to html.. etc.

Organization:
If writing in Crystal..it needs modularized, and possibly use other languages
as well for special functionality (eg: extra scripting capability for tooling).

- Runtime, Interpretter, REPL, transpilation, networking/web ready, cross-platform,
- concurrency, real parallelism
- code re-write at runtime, code rewind, state-save, code-replay, system-constraints/aware

------------------------
Start with writing to files and string processing, and interpretting a .wlang file
------------------------

Syntax Ideas:

w .txt.out => hello world
w .txt.file hello world => hello.txt
w .json.from[src] => resp
w .json.to
w .stream
w .stream.bytes => stream
w .in.read => [var1, var2]

w .calc [1 * 3] => ans

w  [a, b, c] <= 1 2 3 

Variables:
    ? This is maybe nuts, but simple.. that all values are variables in an array,
    or a program or process is an array of 'scoped' arrays..
    - This can be implemented and referenced internally with stack and que like structures,
    procedurally referenced and executed accordingly.

w bytes from stream => 'f'

w* myFunc  [ firstName, lastName =>

  w .json => [
        "name": [firstName w+ lastName]
        "time": [w .timeLocal]
    ]
]

w* add [ n1, n2, n3 =>
    w .sum => [1, 2, 3]
]

IMPLEMENTATION STEPS, GOALS, DETAILS
--------------------------------------

Internals and internal supportive tooling

- Runtime / Execution environment for pause/rewind/replay features
- Built in SQLite3 runtime tooling integration
    - This is for tracking program diagnostics, transactions, program paths,
      and see how valuable or not this may be or where it may lead.

- File & Data  Read/Write commands per format/protocol
    - eg: .json, byte stream, udp, sockets, tcp/http

- Channels, concurrency and parallelism

Crystal based DSL. User program gets built as executable,
and uses SQLlite as a kind of runtime manager. A 'side' layer of tooling written in Elixir uses Elixir 'ports' to
interop with SQLite and the running program. I know,
crazy idea, but am exploring this area.

1. Get a very simple REPL working for reading and writing files with super basic grammar. All commands will directly
translate into valid Crystal code, thus Crystal is our 
target output format.

2. Add the SQLite piece to understand a command and sequence
of data manipulation tasks.

3. Integrate Elixir for the basic file read/writes.































