#!/bin/bash

GREEN="\033[32m"
RED="\033[31m"
NC="\033[0m"
BLUE="\033[34m"
YELLOW="\033[33m"

touch infile
chmod +rw infile
echo "To be, or not to be, that is the question:
Whether 'tis nobler in the mind to suffer
The slings and arrows of outrageous fortune,
Or to take arms against a sea of troubles
And by opposing end them. To die—to sleep,
No more; and by a sleep to say we end
The heart-ache and the thousand natural shocks
That flesh is heir to: 'tis a consummation
Devoutly to be wish'd. To die, to sleep;
To sleep, perchance to dream—ay, there's the rub:
For in that sleep of death what dreams may come,
When we have shuffled off this mortal coil,
Must give us pause—there's the respect
That makes calamity of so long life.
For who would bear the whips and scorns of time,
Th'oppressor's wrong, the proud man's contumely,
The pangs of dispriz'd love, the law's delay,
The insolence of office, and the spurns
That patient merit of th'unworthy takes,
When he himself might his quietus make
With a bare bodkin? Who would fardels bear,
To grunt and sweat under a weary life,
But that the dread of something after death,
The undiscovere'd country, from whose bourn
No traveller returns, puzzles the will,
And makes us rather bear those ills we have
Than fly to others that we know not of?
Thus conscience doth make cowards of us all,
And thus the native hue of resolution
Is sicklied o'er with the pale cast of thought,
And enterprises of great pith and moment
With this regard their currents turn awry
And lose the name of action." > infile

mkdir tests/
mkdir tests/check_outs
mkdir tests/exits

#commands
# /bin/cat
# /bin/ls
# /usr/bin/tail
# /usr/bin/head
# /usr/bin/wc
# /usr/bin/yes
# /usr/bin/grep

printf "\n${BLUE}Copy .sh file to folder with pipex bin${NC}\n"

printf "${YELLOW}Commands from subject:\n${NC}"

let "num=1"
printf "${BLUE}      1\n${NC}"
printf "./pipex infile \"ls -l\" \"wc -l\" tests/check_outs/file_pipex\n"
printf "< infile ls -l | wc -l > tests/check_outs/file_shell\n"
./pipex infile "ls -l" "wc -l" tests/check_outs/file_pipex${num}; echo $? > tests/exits/exit_pipex${num}
< infile ls -l | wc -l > tests/check_outs/file_shell${num}; echo $? > tests/exits/exit_shell${num}
DIFF=$(diff tests/check_outs/file_pipex${num} tests/check_outs/file_shell${num})
if ["$DIFF" == ""]
then
	printf "${GREEN}OK\n${NC}"
else
	printf "${RED}KO\n${NC}"
fi
DIFF=$(diff tests/exits/exit_pipex${num} tests/exits/exit_shell${num})
if ["$DIFF" == ""]
then
	printf "${GREEN}exit correct\n${NC}"
else
	printf "${RED}exit codes differ\n${NC}"
fi
sleep 0.3

let "num=2"
printf "${BLUE}      2\n${NC}"

printf "./pipex infile \"grep to\" \"wc -l\" tests/check_outs/file_pipex\n"
printf "< infile grep to | wc -l > tests/check_outs/file_shell\n"
./pipex infile "grep to" "wc -l" tests/check_outs/file_pipex${num}; echo $? > tests/exits/exit_pipex${num}
< infile grep to | wc -l > tests/check_outs/file_shell${num}; echo $? > tests/exits/exit_shell${num}
DIFF=$(diff tests/check_outs/file_pipex${num} tests/check_outs/file_shell${num})
if ["$DIFF" == ""]
then
	printf "${GREEN}OK\n${NC}"
else
	printf "${RED}KO\n${NC}"
fi
DIFF=$(diff tests/exits/exit_pipex${num} tests/exits/exit_shell${num})
if ["$DIFF" == ""]
then
	printf "${GREEN}exit correct\n${NC}"
else
	printf "${RED}exit codes differ\n${NC}"
fi
sleep 0.3

let "num=3"
printf "${YELLOW}\nRandom commands\n${NC}"

printf "${BLUE}      3\n${NC}"
printf "./pipex infile \"grep hello\" \"cat\" tests/check_outs/file_pipex\n"
printf "< infile grep hello | cat > tests/check_outs/file_shell\n"
./pipex infile "grep hello" "cat" tests/check_outs/file_pipex${num}; echo $? > tests/exits/exit_pipex${num}
< infile grep hello | cat > tests/check_outs/file_shell${num}; echo $? > tests/exits/exit_shell${num}
DIFF=$(diff tests/check_outs/file_pipex${num} tests/check_outs/file_shell${num})
if ["$DIFF" == ""]
then
	printf "${GREEN}OK\n${NC}"
else
	printf "${RED}KO\n${NC}"
fi
DIFF=$(diff tests/exits/exit_pipex${num} tests/exits/exit_shell${num})
if ["$DIFF" == ""]
then
	printf "${GREEN}exit correct\n${NC}"
else
	printf "${RED}exit codes differ\n${NC}"
fi
sleep 0.3

let "num=4"
printf "${BLUE}      4\n${NC}"

printf "./pipex infile \"cat\" \"wc\" tests/check_outs/file_pipex\n"
printf "< infile cat | wc > tests/check_outs/file_shell\n"
./pipex infile "cat" "wc" tests/check_outs/file_pipex${num}; echo $? > tests/exits/exit_pipex${num}
< infile cat | wc > tests/check_outs/file_shell${num}; echo $? > tests/exits/exit_shell${num}
DIFF=$(diff tests/check_outs/file_pipex${num} tests/check_outs/file_shell${num})
if ["$DIFF" == ""]
then
	printf "${GREEN}OK\n${NC}"
else
	printf "${RED}KO\n${NC}"
fi
DIFF=$(diff tests/exits/exit_pipex${num} tests/exits/exit_shell${num})
if ["$DIFF" == ""]
then
	printf "${GREEN}exit correct\n${NC}"
else
	printf "${RED}exit codes differ\n${NC}"
fi
sleep 0.3

let "num=5"
printf "${BLUE}      5\n${NC}"

printf "./pipex infile \"cat\" \"tail -n5 -r\" tests/check_outs/file_pipex\n"
printf "< infile cat | tail -n5 -r > tests/check_outs/file_shell\n"
./pipex infile "cat" "tail -n5 -r" tests/check_outs/file_pipex${num}; echo $? > tests/exits/exit_pipex${num}
< infile cat | tail -n5 -r > tests/check_outs/file_shell${num}; echo $? > tests/exits/exit_shell${num}
DIFF=$(diff tests/check_outs/file_pipex${num} tests/check_outs/file_shell${num})
if ["$DIFF" == ""]
then
	printf "${GREEN}OK\n${NC}"
else
	printf "${RED}KO\n${NC}"
fi
DIFF=$(diff tests/exits/exit_pipex${num} tests/exits/exit_shell${num})
if ["$DIFF" == ""]
then
	printf "${GREEN}exit correct\n${NC}"
else
	printf "${RED}exit codes differ\n${NC}"
fi
sleep 0.3

let "num=6"
printf "\n${YELLOW}Invalid first command${NC}\n"

printf "${BLUE}      6\n${NC}"
printf "./pipex infile \"ca\" \"wc\" tests/check_outs/file_pipex\n"
printf "< infile ca | wc > tests/check_outs/file_shell\n"
./pipex infile "ca" "wc" tests/check_outs/file_pipex${num}; 2>&1 echo $? > tests/exits/exit_pipex${num}
< infile ca | wc > tests/check_outs/file_shell${num}; 2>&1 echo $? > tests/exits/exit_shell${num}
DIFF=$(diff tests/check_outs/file_pipex${num} tests/check_outs/file_shell${num})
if ["$DIFF" == ""]
then
	printf "${GREEN}OK\n${NC}"
else
	printf "${RED}KO\n${NC}"
fi
DIFF=$(diff tests/exits/exit_pipex${num} tests/exits/exit_shell${num})
if ["$DIFF" == ""]
then
	printf "${GREEN}exit correct\n${NC}"
else
	printf "${RED}exit codes differ\n${NC}"
fi
sleep 0.3

let "num=7"
printf "\n${YELLOW}Invalid second command\n${NC}"

printf "${BLUE}      7\n${NC}"
printf "./pipex infile \"cat\" \"invalid\" tests/check_outs/file_pipex\n"
printf "< infile cat | invalid > tests/check_outs/file_shell\n"
./pipex infile "cat" "invalid" tests/check_outs/file_pipex${num}; echo $? > tests/exits/exit_pipex${num}
< infile cat | invalid > tests/check_outs/file_shell${num}; echo $? > tests/exits/exit_shell${num}
DIFF=$(diff tests/check_outs/file_pipex${num} tests/check_outs/file_shell${num})
if ["$DIFF" == ""]
then
	printf "${GREEN}OK\n${NC}"
else
	printf "${RED}KO\n${NC}"
fi
DIFF=$(diff tests/exits/exit_pipex${num} tests/exits/exit_shell${num})
if ["$DIFF" == ""]
then
	printf "${GREEN}exit correct\n${NC}"
else
	printf "${RED}exit codes differ\n${NC}"
fi
sleep 0.3

let "num=8"
printf "${BLUE}      8\n${NC}"

printf "./pipex infile \"yes helloword\" \"head -10000\" tests/check_outs/file_pipex\n"
printf "< infile yes helloworld! | head -10000 > tests/check_outs/file_shell\n"
./pipex infile "yes helloworld!" "head -10000" tests/check_outs/file_pipex${num}; echo $? > tests/exits/exit_pipex${num}
< infile yes helloworld! | head -10000 > tests/check_outs/file_shell${num}; echo $? > tests/exits/exit_shell${num}
DIFF=$(diff tests/check_outs/file_pipex${num} tests/check_outs/file_shell${num})
if ["$DIFF" == ""]
then
	printf "${GREEN}OK\n${NC}"
else
	printf "${RED}KO\n${NC}"
fi
DIFF=$(diff tests/exits/exit_pipex${num} tests/exits/exit_shell${num})
if ["$DIFF" == ""]
then
	printf "${GREEN}exit correct\n${NC}"
else
	printf "${RED}exit codes differ\n${NC}"
fi
sleep 0.3

let "num=9"
printf "${YELLOW}Command with path${NC}\n"

printf "${BLUE}      9\n${NC}"
printf "./pipex infile \"//////////bin/////////cat\" \"/usr/bin/head -n10\" tests/check_outs/file_pipex\n"
printf "< infile //////////bin/////////cat | /usr/bin/head -n10 > tests/check_outs/file_shell\n"
./pipex infile "//////////bin/////////cat" "/usr/bin/head -n10" tests/check_outs/file_pipex${num}; echo $? > tests/exits/exit_pipex${num}
< infile //////////bin/////////cat | /usr/bin/head -n10 > tests/check_outs/file_shell${num}; echo $? > tests/exits/exit_shell${num}
DIFF=$(diff tests/check_outs/file_pipex${num} tests/check_outs/file_shell${num})
if ["$DIFF" == ""]
then
	printf "${GREEN}OK\n${NC}"
else
	printf "${RED}KO\n${NC}"
fi
DIFF=$(diff tests/exits/exit_pipex${num} tests/exits/exit_shell${num})
if ["$DIFF" == ""]
then
	printf "${GREEN}exit correct\n${NC}"
else
	printf "${RED}exit codes differ\n${NC}"
fi
sleep 0.3

let "num=10"
printf "\n${YELLOW}Invalid first path${NC}\n"

printf "${BLUE}      10\n${NC}"
printf "./pipex infile \"/usr/bin/tail/ -n10 -r\" \"/usr/bin/wc\" tests/check_outs/file_pipex\n"
printf "< infile /usr/bin/tail/ -n10 -r | /usr/bin/wc > tests/check_outs/file_shell\n"
./pipex infile "/usr/bin/tail/ -n10 -r" "/usr/bin/wc" tests/check_outs/file_pipex${num}; echo $? > tests/exits/exit_pipex${num}
< infile /usr/bin/tail/ -n10 -r | /usr/bin/wc > tests/check_outs/file_shell${num}; echo $? > tests/exits/exit_shell${num}
DIFF=$(diff tests/check_outs/file_pipex${num} tests/check_outs/file_shell${num})
if ["$DIFF" == ""]
then
	printf "${GREEN}OK\n${NC}"
else
	printf "${RED}KO\n${NC}"
fi
DIFF=$(diff tests/exits/exit_pipex${num} tests/exits/exit_shell${num})
if ["$DIFF" == ""]
then
	printf "${GREEN}exit correct\n${NC}"
else
	printf "${RED}exit codes differ\n${NC}"
fi
sleep 0.3

printf "\n${YELLOW}Empty file\n${NC}"

touch empty.txt
echo "" > empty

let "num=11"
printf "${BLUE}      11\n${NC}"

printf "./pipex empty \"cat\" \"wc\" tests/check_outs/file_pipex\n"
printf "< empty cat | wc > tests/check_outs/file_shell\n"
./pipex empty "cat" "wc" tests/check_outs/file_pipex${num}; echo $? > tests/exits/exit_pipex${num}
< empty cat | wc > tests/check_outs/file_shell${num}; echo $? > tests/exits/exit_shell${num}
DIFF=$(diff tests/check_outs/file_pipex${num} tests/check_outs/file_shell${num})
if ["$DIFF" == ""]
then
	printf "${GREEN}OK\n${NC}"
else
	printf "${RED}KO\n${NC}"
fi
DIFF=$(diff tests/exits/exit_pipex${num} tests/exits/exit_shell${num})
if ["$DIFF" == ""]
then
	printf "${GREEN}exit correct\n${NC}"
else
	printf "${RED}exit codes differ\n${NC}"
fi
rm empty
sleep 0.3

let "num=12"
printf "${BLUE}      12\n${NC}"

printf "./pipex /dev/null \"wc\" \"grep 0\" tests/check_outs/file_pipex\n"
printf "< /dev/null wc | grep 0 > tests/check_outs/file_shell\n"
./pipex /dev/null "wc" "grep 0" tests/check_outs/file_pipex${num}; echo $? > tests/exits/exit_pipex${num}
< /dev/null wc | grep 0 > tests/check_outs/file_shell${num}; echo $? > tests/exits/exit_shell${num}
DIFF=$(diff tests/check_outs/file_pipex${num} tests/check_outs/file_shell${num})
if ["$DIFF" == ""]
then
	printf "${GREEN}OK\n${NC}"
else
	printf "${RED}KO\n${NC}"
fi
DIFF=$(diff tests/exits/exit_pipex${num} tests/exits/exit_shell${num})
if ["$DIFF" == ""]
then
	printf "${GREEN}exit correct\n${NC}"
else
	printf "${RED}exit codes differ\n${NC}"
fi
sleep 0.3

let "num=13"
printf "${BLUE}      13\n${NC}"

printf "./pipex infile \"cat\" \"cat -e\" tests/check_outs/file_pipex\n"
printf "< infile cat | cat -e > tests/check_outs/file_shell\n"
./pipex infile "cat" "cat -e" tests/check_outs/file_pipex${num}; echo $? > tests/exits/exit_pipex${num}
< infile cat | cat -e > tests/check_outs/file_shell${num}; echo $? > tests/exits/exit_shell${num}
DIFF=$(diff tests/check_outs/file_pipex${num} tests/check_outs/file_shell${num})
if ["$DIFF" == ""]
then
	printf "${GREEN}OK\n${NC}"
else
	printf "${RED}KO\n${NC}"
fi
DIFF=$(diff tests/exits/exit_pipex${num} tests/exits/exit_shell${num})
if ["$DIFF" == ""]
then
	printf "${GREEN}exit correct\n${NC}"
else
	printf "${RED}exit codes differ\n${NC}"
fi
sleep 0.3

let "num=14"
printf "${BLUE}      14\n${NC}"

printf "./pipex infile \"grep The \" \"tr a-z A-Z\" tests/check_outs/file_pipex\n"
printf "< infile grep 'The ' | tr a-z A-Z > tests/check_outs/file_shell\n"
./pipex infile "grep The " "tr a-z A-Z" tests/check_outs/file_pipex${num}; echo $? > tests/exits/exit_pipex${num}
< infile grep 'The ' | tr a-z A-Z > tests/check_outs/file_shell${num}; echo $? > tests/exits/exit_shell${num}
DIFF=$(diff tests/check_outs/file_pipex${num} tests/check_outs/file_shell${num})
if ["$DIFF" == ""]
then
	printf "${GREEN}OK\n${NC}"
else
	printf "${RED}KO\n${NC}"
fi
DIFF=$(diff tests/exits/exit_pipex${num} tests/exits/exit_shell${num})
if ["$DIFF" == ""]
then
	printf "${GREEN}exit correct\n${NC}"
else
	printf "${RED}exit codes differ\n${NC}"
fi
sleep 0.3

let "num=15"
printf "${BLUE}      15\n${NC}"

printf "./pipex infile \"less \" \"tr -d abc\" tests/check_outs/file_pipex\n"
printf "< infile less | tr -d abc > tests/check_outs/file_shell\n"
./pipex infile "less" "tr -d abc" tests/check_outs/file_pipex${num}; echo $? > tests/exits/exit_pipex${num}
< infile less | tr -d abc > tests/check_outs/file_shell${num}; echo $? > tests/exits/exit_shell${num}
DIFF=$(diff tests/check_outs/file_pipex${num} tests/check_outs/file_shell${num})
if ["$DIFF" == ""]
then
	printf "${GREEN}OK\n${NC}"
else
	printf "${RED}KO\n${NC}"
fi
DIFF=$(diff tests/exits/exit_pipex${num} tests/exits/exit_shell${num})
if ["$DIFF" == ""]
then
	printf "${GREEN}exit correct\n${NC}"
else
	printf "${RED}exit codes differ\n${NC}"
fi
sleep 0.3

printf "${YELLOW}\nFirst file doesn't exist\n${NC}"

let "num=16"
printf "${BLUE}      16\n${NC}"

printf "./pipex nofile \"wc \" \"tr -d abc\" tests/check_outs/file_pipex\n"
printf "< nofile wc | tr -d abc > tests/check_outs/file_shell\n"
./pipex nofile "wc" "tr -d abc" tests/check_outs/file_pipex${num}; echo $? > tests/exits/exit_pipex${num}
< nofile wc | tr -d abc > tests/check_outs/file_shell${num}; echo $? > tests/exits/exit_shell${num}
DIFF=$(diff tests/check_outs/file_pipex${num} tests/check_outs/file_shell${num})
if ["$DIFF" == ""]
then
	printf "${GREEN}OK\n${NC}"
else
	printf "${RED}KO\n${NC}"
fi
DIFF=$(diff tests/exits/exit_pipex${num} tests/exits/exit_shell${num})
if ["$DIFF" == ""]
then
	printf "${GREEN}exit correct\n${NC}"
else
	printf "${RED}exit codes differ\n${NC}"
fi
sleep 0.3

printf "${YELLOW}\nSecond file doesn't exist\n${NC}"

let "num=17"
printf "${BLUE}      17\n${NC}"

printf "./pipex infile \"pwd \" \"wc\" /dev/null/\n"
printf "< infile pwd | wc > /dev/null/\n"
./pipex infile "pwd" "wc" /dev/null/; echo $? > tests/exits/exit_pipex${num}
< infile pwd | wc > /dev/null/; echo $? > tests/exits/exit_shell${num}
touch tests/check_outs/file_pipex${num}
touch tests/check_outs/file_shell${num}
DIFF=$(diff tests/check_outs/file_pipex${num} tests/check_outs/file_shell${num})
if ["$DIFF" == ""]
then
	printf "${GREEN}OK\n${NC}"
else
	printf "${RED}KO\n${NC}"
fi
DIFF=$(diff tests/exits/exit_pipex${num} tests/exits/exit_shell${num})
if ["$DIFF" == ""]
then
	printf "${GREEN}exit correct\n${NC}"
else
	printf "${RED}exit codes differ\n${NC}"
fi
sleep 0.3

printf "${YELLOW}\nBoth files aren't valid\n${NC}"

let "num=18"
printf "${BLUE}      18\n${NC}"

printf "./pipex nofile \"pwd \" \"wc\" /dev/null/\n"
printf "< nofile pwd | wc > /dev/null/\n"
./pipex nofile "pwd" "wc" dev/null/; echo $? > tests/exits/exit_pipex${num}
< nofile pwd | wc > dev/null/; echo $? > tests/exits/exit_shell${num}
touch tests/check_outs/file_pipex${num}
touch tests/check_outs/file_shell${num}
DIFF=$(diff tests/check_outs/file_pipex${num} tests/check_outs/file_shell${num})
if ["$DIFF" == ""]
then
	printf "${GREEN}OK\n${NC}"
else
	printf "${RED}KO\n${NC}"
fi
DIFF=$(diff tests/exits/exit_pipex${num} tests/exits/exit_shell${num})
if ["$DIFF" == ""]
then
	printf "${GREEN}exit correct\n${NC}"
else
	printf "${RED}exit codes differ\n${NC}"
fi
sleep 0.3

let "num=19"
printf "${BLUE}      19\n${NC}"

printf "./pipex infile  \"ls -l\" \"head -n3\" outfile\n"
printf "< infile ls -l | head -n3 > outfile\n"
< infile ls -l | head -n3 > tests/check_outs/file_shell${num}; echo $? > tests/exits/exit_shell${num}
./pipex infile "ls -l" "head -n3" tests/check_outs/file_pipex${num}; echo $? > tests/exits/exit_pipex${num}
DIFF=$(diff tests/check_outs/file_pipex${num} tests/check_outs/file_shell${num})
if ["$DIFF" == ""]
then
	printf "${GREEN}OK\n${NC}"
else
	printf "${RED}KO\n${NC}"
fi
DIFF=$(diff tests/exits/exit_pipex${num} tests/exits/exit_shell${num})
if ["$DIFF" == ""]
then
	printf "${GREEN}exit correct\n${NC}"
else
	printf "${RED}exit codes differ\n${NC}"
fi
sleep 0.3

let "num=20"
printf "${BLUE}      20\n${NC}"

printf "./pipex infile \"\" \"notex\" outfile\n"
printf "< infile "" | notex > outfile\n"
./pipex infile "" "notex" tests/check_outs/file_pipex${num}; echo $? > tests/exits/exit_pipex${num}
< infile "" | notex > tests/check_outs/file_shell${num}; echo $? > tests/exits/exit_shell${num}
DIFF=$(diff tests/check_outs/file_pipex${num} tests/check_outs/file_shell${num})
if ["$DIFF" == ""]
then
	printf "${GREEN}OK\n${NC}"
else
	printf "${RED}KO\n${NC}"
fi
DIFF=$(diff tests/exits/exit_pipex${num} tests/exits/exit_shell${num})
if ["$DIFF" == ""]
then
	printf "${GREEN}exit correct\n${NC}"
else
	printf "${RED}exit codes differ\n${NC}"
fi
sleep 0.3

printf "${YELLOW}\nFile permissions rights\n${NC}"

let "num=21"
printf "${BLUE}      21\n${NC}"

chmod -rw infile

printf "./pipex infile \"cat\" \"grep a\" outfile\n"
printf "< infile cat | grep a > outfile\n"
./pipex infile "cat" "grep a" tests/check_outs/file_pipex${num}; echo $? > tests/exits/exit_pipex${num}
< infile cat | grep a > tests/check_outs/file_shell${num}; echo $? > tests/exits/exit_shell${num}
DIFF=$(diff tests/check_outs/file_pipex${num} tests/check_outs/file_shell${num})
if ["$DIFF" == ""]
then
	printf "${GREEN}OK\n${NC}"
else
	printf "${RED}KO\n${NC}"
fi
DIFF=$(diff tests/exits/exit_pipex${num} tests/exits/exit_shell${num})
if ["$DIFF" == ""]
then
	printf "${GREEN}exit correct\n${NC}"
else
	printf "${RED}exit codes differ\n${NC}"
fi
chmod +rw infile
sleep 0.3

# rm -rf tests/
# rm infile
