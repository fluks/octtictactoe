function bool = isPossibleToWin(v, squares, empty, player)
% Check unrealistically positively is it possible to win, by filling
% all the squares only by one player's marks.
    bool = false;
    
    squares(squares == empty) = player;
    if win(v, squares == player)
        bool = true;
    end
end
