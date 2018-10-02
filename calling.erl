-module(calling).
-export([receiveMessage/0]).

receiveMessage() ->
	receive
		{test ,Sender} ->
		%io:fwrite("messageadfd received ~w~n", [A]),
		%io:fwrite("~w received intro message from ~w~n",[A])
		%PID ! {intro, adsd, sd, sf};
		%Sender ! "Thanks";
		io:fwrite("test"),
		io:fwrite("testinggg")
		%{inro ,Sender, {A, B}} ->
		%"received intto"
		%johnpoe ! {resp, dfdfdf};
		
		%{resp ,Sender, {A, B}} ->
		%master ! {reso receved}

	end.

