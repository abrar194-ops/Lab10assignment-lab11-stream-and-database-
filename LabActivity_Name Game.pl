

:- dynamic letter/1.

letter(a).
letter(b).
letter(c).


start :-
    writeln('Hi, This is the "Name Game".'),
    writeln('You will be given a set of English letters in which you will add, delete or move to create your name.'),
    interface.

interface :-
    nl,
    writeln('Choose from the following:'),
    writeln('1- Display the current set of letters'),
    writeln('2- Add a letter'),
    writeln('3- Add a letter at the top'),
    writeln('4- Add a letter at the botton'),
    writeln('5- Delete a letter'),
    writeln('6- Delete all letters'),
    writeln('7- Exit'),
    write('Enter your choice.'), nl,
    write('|: '),
    read(Choice),
    perform(Choice).




% Choice 1
perform(1) :- !,
    display_letters,
    interface.

% Choices 2..6: Each number gets its own clause, then calls interface again
perform(2) :- !,
    add_letters,
    interface.

perform(3) :- !,
    add_letters_start,
    interface.

perform(4) :- !,
    add_letters_end,
    interface.

perform(5) :- !,
    delete_single_letter,
    interface.

perform(6) :- !,
   delete_all_letters,
    interface.


perform(7) :- !,
    % Exit
     writeln('**** End ****').


% invalid input case(additional case)
perform(_) :-
    writeln('Invalid choice , try again using 1-7 '),
    interface.






%***********1*************

display_letters :-
    letter(X),
    writeln(X),
    fail.
display_letters.



%************2************

add_letters:-
   
       writeln('Enter the letter you want to add: '),
       read(Newletter),
       assert(letter(Newletter)).


%************3************
add_letters_start:-
         
     writeln('Enter the letter you want to add to the top: '),
     read(Newlettera),
     asserta(letter(Newlettera)).   

%************4************
add_letters_end:-
     writeln('Enter the letter you want to add to the bottom : '),
     read(Newletterz),
     assertz(letter(Newletterz)).

%************5************
%second "delete_single_letter" will run only if the letter dosnt exist otherwise it will be skipped
delete_single_letter :-
    writeln('Enter the letter you want to delete: '),
    read(DelLet),
    retract(letter(DelLet)), !,
    writeln('Letter deleted.').

delete_single_letter :-
    writeln('Letter not found in the set.').


%************6************
delete_all_letters:-
          retractall(letter(_)).
