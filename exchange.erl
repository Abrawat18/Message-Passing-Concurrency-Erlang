-module(exchange).
-export([start/0,read_with_consult/0,iter/1,iterate/1,iterate1/1]).
-import(lists,[nth/2]).

%% Your code here!

read_with_consult() ->
 {Status, Datalist} = file:consult("calls.txt"),
 io:fwrite("**   Calls to be made   **\n"),
	[iter(Y) || Y <- Datalist], 
    [iterate(X) || X <- Datalist],
	[iterate1(Z) || Z <- Datalist].
	%io:fwrite("~p~n",[maps:get("john",Map)]).
	%register("life", self()).
	
iter(Y) ->
	{A,B} = Y,
	io:format(" ~p:", [A]),
	io:format("~p~n", [B]).

iterate(X) ->
	%Caller = nth(1,X),
	{Caller,B} = X,
	io:fwrite("testiggg ~w ~n",[Caller]),
	%register(masterPID,self()),
	%io:fwrite("Master PID ~w~n",[whereis(masterPID)]),
	CallerPid =  spawn(calling, receiveMessage, []),
	io:fwrite("CallerPid ~w ~n",[CallerPid]),	
	register(Caller,CallerPid).
	%io:fwrite("PID == ~w ~n ", [whereis(A)]).
	%PID=whereis(A),
	%maps:put([A], PID, Map).
	%PID ! {test ,self(), {A,B}},

iterate1(Z) ->
	{Caller,B} = Z,
	PID = whereis(Caller),
	
	io:format("map value ~w~n", [PID]).
	
	
start() ->
	read_with_consult().
	