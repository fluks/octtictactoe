function bool = win(v, M)
% Find a sequence of same elements in a matrix, horizontally, vertically or
% diagonally.
% Parameters: v Vector of same elements, e.g. [ 1, 1, 1 ], to search for.
%             M Matrix to search v from.
% Returns:    True if sequence found, false otherwise.
    if ~isvector(v)
        error('v is not a vector');
    end

    % v needs to be column vector.
    if rows(v) > 1
        v = v';
    end

    Mv = M == v(1);
    % Search for vertical sequence.
    Mvt = Mv';
    % Search for diagonal sequences.
    Md1 = spdiags(Mv)';
    Md2 = spdiags(flipdim(Mv))';

    vStr = num2str(v, '%d');

    if !isempty(find(!cellfun(@isempty, strfind(cellstr(num2str(Mv, '%d')), vStr)))) || ...
       !isempty(find(!cellfun(@isempty, strfind(cellstr(num2str(Mvt, '%d')), vStr)))) || ...
       !isempty(find(!cellfun(@isempty, strfind(cellstr(num2str(Md1, '%d')), vStr)))) || ...
       !isempty(find(!cellfun(@isempty, strfind(cellstr(num2str(Md2, '%d')), vStr))))
        bool = true;
        return;
    end

    bool = false;
end
