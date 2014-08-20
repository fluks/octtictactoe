function printSquares(squares, players)
% Print squares and indices.
    s = squares;

    columnIndices1 = mat2str(1:2:columns(squares));
    % Add 2 spaces after every number < 10.
    columnIndices1 = regexprep(columnIndices1, '(\D\d)\b', '$1  ');
    % Add 1 space after every number >= 10.
    columnIndices1 = regexprep(columnIndices1, '(\d\d)\b', '$1 ');
    columnIndices1 = regexprep(columnIndices1, '[\[\]]', '');

    columnIndices2 = mat2str(2:2:columns(squares));
    columnIndices2 = regexprep(columnIndices2, '(\D\d)\b', '$1  ');
    columnIndices2 = regexprep(columnIndices2, '(\d\d)\b', '$1 ');
    columnIndices2 = regexprep(columnIndices2, '[\[\]]', '');

    rowIndices = num2str((1:rows(s))');
    rowIndices(:, end + 1) = ' ';

    % Transform numerical matrix to characters.
    s = s';
    s(s == players.x) = players.chars(players.x);
    s(s == players.o) = players.chars(players.o);
    s(s == players.empty) = players.chars(players.empty);

    % Add padding.
    s = kron(s, [ 1; 0]);
    s(s == 0) = ' ';
    s(end, :) = "\n";

    s = [ rowIndices'; s ];

    spacing = blanks(length(num2str(rows(squares))));
    printf(' %s%s\n', spacing, columnIndices1);
    printf('%c', s);
    spacing(end) = [];
    printf('    %s%s\n', spacing, columnIndices2);
    fflush(stdout);
end
