# checkpoint3

## a. 
netID: xs106
## b. 
In checkpoint3, a 32 bits decoder is built using many AND gate. And a 5 bits input is added to control which line to output.
## c.
A writeport is added into the file. And enable wire is connected and a 5 bits write control input to a decoder to choose which register to write into. This is realized by connect the each decoder output with the enable wire using AND gate.
## d.
Readport is designed by connecting the decoder output,each register output, and read output using tristate buffer, when the output is not enabled, the tristate buffer will keep at high resistance state 'z'.
## e.
dffe_reg.v is a 32 bit dffe.
## f.
In the main regfile, it connect 32 registers with a writeport and two readport to realized the 32 32bits file register function.
## g.
testbanch file is also included.
