clear; clc;

printf('Tictactoe\n');

players.x = 1;
players.o = 2;
players.empty = 3;
players.chars = 'xo_';
turn = [ 1, 2 ];

[ squares, nSequenceToWin ] = readSettings(players.empty);

printSquares(squares, players);

while true
    [ row, column ] = readMove(squares, players.chars(turn(1)), players.empty);
    squares(row, column) = turn(1);
    printSquares(squares, players);

    if win(ones(1, nSequenceToWin), squares == turn(1))
        printf('%c wins the game!\n', players.chars(turn(1)));
        break;
    end

    if length(find(squares == players.empty)) == 0
        printf('No more free squares left, it''s a tie.\n');
        break
    end

    if ~isPossibleToWin(ones(1, nSequenceToWin), squares, players.empty, ...
            turn(1))
        printf('Not possible to win anymore.\n');
        break
    end

    turn = flipdim(turn);
end
