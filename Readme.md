<div align="center" max-width="auto" max-height="auto">
	<img src="imgs/21_42_logos.png" max-height="250" alight="center">
</div>

# 💈 pipex

## Content

[Summary](https://github.com/D-Dashka/pipex#summary)

[Description](https://github.com/D-Dashka/pipex#Description)

[Error management](https://github.com/D-Dashka/pipex#error-management)

[Tester](https://github.com/D-Dashka/pipex#tester)

## Summary

This project will let you discover in detail a UNIX mechanism that you already know by using it in your program.

The main goal is to mimic behavior of the bash command <code>pipe [|]</code>

## Description

Your program will be executed as follows:

<code>./pipex file1 cmd1 cmd2 file2</code>

It must take 4 arguments:

• ***file1*** and ***file2*** are file names.

• ***cmd1*** and ***cmd2*** are shell commands with their parameters.

It must behave exactly the same as the shell command below:

<code>$> <code file1 cmd1 | cmd2 > file2</code>

### Example

	./pipex infile "ls -l" "wc -l" outfile
<br>

	< infile ls -l | wc -l > outfile

`<` - is used to **redirect output**

`>` - is used to **redirect input**

`./pipex` - program

`infile` - file to read text from

`“ls -l”` - first command that will process text from infile

`“wc -l”` - second command that will process output from first command

`outfile` - file to write the result of the second command

## Error management

Errors I tried to pay attention on:

• check leaks using valgrind

	valgrind --track-origins=yes --trace-children=yes --leak-check=full ./pipex [args]

• outfile is empty

• infile is empty
    
<code>If infile is empty and second command ***`wc`*** → `0`</code>
    
• command is written with path
    
    ./pipex infile "///////usr/bin/grep hello" "wc -l" file2

• command is not a directory

• program exit codes
    
    echo &?
    
• Error file openning

&nbsp;&nbsp;&nbsp;&nbsp;◦ if first file doesn't exist

&nbsp;&nbsp;&nbsp;&nbsp;◦ if first file doesn't have rights on read

• Commands errors
    
&nbsp;&nbsp;&nbsp;&nbsp;◦ Empty command

	./pipex infile "" "     " outfile
    
&nbsp;&nbsp;&nbsp;&nbsp;◦ First comand not found

	./pipex infile "cats" "wc -l" outfile
    
&nbsp;&nbsp;&nbsp;&nbsp;◦ Second command not found

	./pipex infile "cat" "what" outfile
    
&nbsp;&nbsp;&nbsp;&nbsp;◦ Both command not found

	./pipex infile "cats" "meow" outfile
    
• Several commands at once

	./pipex nofile "ca" " " /dev/null/; echo $?

## Tester

I made a simple tester for pipex project called test_pipex.sh
		
It test only mandatory part.

### How it works

It compares using <code>diff</code> outputs from pipex program and from bash command pipe <code>|</code> by creating output files. 
Also it checks exit codes of pipex program and of bash command also sending it to output files (using echo $?) and comparing with diff.

***How to run***

In directory with pipex program run:

	bash test_pipex.sh

***Outputs***

You can see outputs of your program in <code>tests/check_outs/file_shell</code> and of bash command pipe <code>|</code> in <code>tests/check_outs/file_pipex</code> files.

## Disclaimer

This tester is not highly professional or super complicated bash script code. It is just a number of different arguments for pipex program comparing with bash command pipe <code>|</code>.

You can use it to check outputs of your program but not as an absolute reference for defence or for making your code relevant. 

I am sure there are a lot of things to modify and to improve in this tester. I am open to new ideas 💡

