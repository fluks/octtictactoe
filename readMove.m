function [ row, column ] = readMove(squares, char, empty)
% Read a move from a player.
    while true
        printf('%c', char);
        fflush(stdout);
        s = input('''s turn. Move to index(e.g. 1 2): ', 's');
        [ row, _, column, count, err ] = sscanf(s, '%d%[ ,x.,:-]%d', 'C');
        if count ~= 3 || err ~= ''
            fprintf(stderr, 'Invalid input.\n');
            continue
        end
        if row > rows(squares) || row <= 0 || ...
           column > columns(squares) || column <= 0
            fprintf(stderr, 'Invalid index.\n');
            continue;
        else if squares(row, column) != empty
            fprintf(stderr, 'Square is not free.\n');
            continue;
        end
        break
    end
end
