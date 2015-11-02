-module(ppool_tests).
-include_lib("eunit/include/eunit.hrl").

-export([find_unique_name/0]).

basic_test_() ->
       fun () -> ?assert(1 + 1 =:= 2) end.

find_unique_name() ->
    ok = application:start(ppool),
    Name = list_to_atom(lists:flatten(io_lib:format("~p",[erlang:timestamp()]))),
    ?assertEqual(undefined, whereis(Name)),
    Name.
