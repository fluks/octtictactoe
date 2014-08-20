function printSquares(squares, players)
    s = squares;

    columnCoordinates1 = mat2str(1:2:columns(squares));
    % Add 2 spaces after every number < 10.
    columnCoordinates1 = regexprep(columnCoordinates1, '(\D\d)\b', '$1  ');
    % Add 1 space after every number >= 10.
    columnCoordinates1 = regexprep(columnCoordinates1, '(\d\d)\b', '$1 ');
    columnCoordinates1 = regexprep(columnCoordinates1, '[\[\]]', '')

    columnCoordinates2 = mat2str(2:2:columns(squares));
    columnCoordinates2 = regexprep(columnCoordinates2, '(\D\d)\b', '$1  ');
    columnCoordinates2 = regexprep(columnCoordinates2, '(\d\d)\b', '$1 ');
    columnCoordinates2 = regexprep(columnCoordinates2, '[\[\]]', '')

    rowCoordinates = num2str((1:rows(s))');
    rowCoordinates(:, end + 1) = ' ';

    % Transform numerical matrix to characters.
    s = s';
    s(s == players.x) = players.chars(players.x);
    s(s == players.o) = players.chars(players.o);
    s(s == players.empty) = players.chars(players.empty);

    % Add padding.
    s = kron(s, [ 1; 0]);
    s(s == 0) = ' ';
    s(end, :) = "\n";

    s = [ rowCoordinates'; s ];

    spacing = blanks(length(num2str(rows(squares))));
    printf(' %s%s\n', spacing, columnCoordinates1);
    printf('%c', s);
    spacing(end) = [];
    printf('    %s%s\n', spacing, columnCoordinates2);
    fflush(stdout);
end
