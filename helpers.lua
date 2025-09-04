function imgToGrid(img, ncols, nrows)
    return anim8.newGrid(
        math.floor(img:getWidth() / ncols),
        math.floor(img:getHeight() / nrows),
        img:getWidth(),
        img:getHeight()
    )
end