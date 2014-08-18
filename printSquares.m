function printSquares(squares, players)
    columnCoordinates = mat2str(1:rows(squares));
    % Remove square brackets.
    columnCoordinates(1) = '';
    columnCoordinates(length(columnCoordinates)) = '';
    printf('  %s\n', columnCoordinates);

    for r = 1:rows(squares)
        % Row coordinates.
        printf('%i ', r);
        for c = 1:columns(squares)
            printf('%c ', players.chars(squares(r, c)))
        end
        printf('\n');
    end
    fflush(stdout);
end
