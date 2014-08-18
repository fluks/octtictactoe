function bool = isPossibleToWin(v, squares, empty, player)
    bool = false;
    
    squares(squares == empty) = player;
    if win(v, squares == player)
        bool = true;
    end
end
