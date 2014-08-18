function [ row, column ] = readMove(squares, char, empty)
    while true
        printf('%c', char);
        fflush(stdout);
        s = input('''s turn. Move to index(e.g. 1,2): ', 's');
        [ row, column, count, err ] = sscanf(s, '%d,%d', 'C');
        if count ~= 2 || err ~= ''
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