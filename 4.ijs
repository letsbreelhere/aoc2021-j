f =: > cutLF fread './data/4.txt'
plays =: ".{.f
boardVals =: ".;}.f
boards =: (((,&5 5)@(%&25)@#) $ ]) boardVals
win =: (+./@:(5= +/@:(,.|:)))"2

NB. All plays of the bingo game, for all boards
games =: +./\ (=&boards)"0 plays

winPlay =: (+/ |: win games) i. 1
winMask =: {. (#~ win) winPlay { games
winningBoard =: (win winPlay { games) i. 1
unplayed =: +/ |: +/ (-.winMask) * winningBoard{boards

echo unplayed * winPlay{plays
exit''
