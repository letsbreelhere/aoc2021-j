f =: > cutLF fread './data/4.txt'
plays =: ".{.f
boardVals =: ".;}.f
boards =: (((,&5 5)@(%&25)@#) $ ]) boardVals
win =: (+./@:(5= +/@:(,.|:)))"2

games =: +./\ (=&boards)"0 plays
gamesPerBoard =: 0 2 3 |: games
winPlayPerBoard =: (win gamesPerBoard) i."1] 1

winningBoard =: (i. (<./)) winPlayPerBoard
winPlay =: winningBoard { winPlayPerBoard
winMask =: winningBoard { winPlay { games
unplayed =: +/ |: +/ (-.winMask) * winningBoard{boards
echo unplayed * winPlay{plays

winningBoard =: (i. (>./)) winPlayPerBoard
winPlay =: winningBoard { winPlayPerBoard
winMask =: winningBoard { winPlay { games
unplayed =: +/ |: +/ (-.winMask) * winningBoard{boards
echo unplayed * winPlay{plays
exit''
