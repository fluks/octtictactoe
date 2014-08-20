function [ squares, nSequenceToWin ] = readSettings(empty)
% Get number of rows, columns and length of the sequence to win from user.
    MIN_ROW_AND_COLUMN = 3;

    while true
        s = input('Number of rows: ', 's');
        [ rows, count, err ] = sscanf(s, '%i', 'C');
        if count ~= 1 || err ~= ''
            fprintf(stderr, 'Invalid input.\n');
            continue
        end
        if rows < MIN_ROW_AND_COLUMN
            fprintf(stderr, 'Number of rows is too small.\n');
            continue;
        end
        break
    end

    while true
        s = input('Number of columns: ', 's');
        [ columns, count, err ] = sscanf(s, '%i', 'C');
        if count ~= 1 || err ~= ''
            fprintf(stderr, 'Invalid input.\n');
            continue
        end
        if columns < MIN_ROW_AND_COLUMN
            fprintf(stderr, 'Number of columns is too small.\n');
            continue;
        end
        break
    end

    while true
        s = input('Length of sequence to win: ', 's');
        [ nSequenceToWin, count, err ] = sscanf(s, '%i', 'C');
        if count ~= 1 || err ~= ''
            fprintf(stderr, 'Invalid input.\n');
            continue
        end
        if nSequenceToWin > min(rows, columns)
            fprintf(stderr, 'Sequence is too large.\n');
            continue;
        end
        break
    end

    squares = ones(rows, columns) * empty;
end
