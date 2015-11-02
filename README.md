# Pool example

```
> application:start(ppool).
ok
> ppool:start_pool(nagger, 2, {ppool_nagger, start_link, []}).
{ok,<0.109.0>}
> ppool:run(nagger, ["finish the chapter!", 10000, 10, self()]).
{ok,<0.113.0>}
> ppool:run(nagger, ["watch a good movie", 10000, 10, self()]).
{ok,<0.115.0>}
> flush().
Shell got {<0.113.0>,"finish the chapter!"}
ok
> ppool:run(nagger, ["clean up a bit", 10000, 10, self()]).
noalloc
> flush().
Shell got {<0.115.0>,"watch a good movie"}
Shell got {<0.113.0>,"finish the chapter!"}
Shell got {<0.115.0>,"watch a good movie"}
Shell got {<0.113.0>,"finish the chapter!"}
Shell got {<0.115.0>,"watch a good movie"}
ok

> eunit:test(ppool_tests).

> observer:start().

> application:stop(ppool).
ok


```