f =: > cutLF fread './data/4.txt'
plays =: ".{.f
boardVals =: ".;}.f
boards =: (((,&5 5)@(%&25)@#) $ ]) boardVals
win =: (+./@:(5= +/@:(,.|:)))"2

games =: +./\ (=&boards)"0 plays
gamesPerBoard =: 0 2 3 |: games
winningPlays =: (win gamesPerBoard) i."1] 1

winningBoard =: (i. (<./)) winningPlays
unplayed =: (-.(<@,~winningBoard) { winningPlays { games) * winningBoard { boards
echo (+/;unplayed) * winningBoard { winningPlays { plays

winningBoard =: (i. (>./)) winningPlays
unplayed =: (-.(<@,~winningBoard) { winningPlays { games) * winningBoard { boards
echo (+/;unplayed) * winningBoard { winningPlays { plays
exit''
