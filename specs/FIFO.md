# First-In First-Out


A simple FIFO with an internal counter to keep track of number of elements

wr_en full nfull
  0     0    1 -- write not enabled and not full, can write but not enabled
  0     1    0 -- write not enabled and FIFO full, cannot write, data ignored
  1     0    1 -- write enable and not full, write occurs
  1     1    0 -- write enable and full, data ignored (least recently used can be replaced cache style)


## Behavour
Basic functioning of the FIFO is okay, but when capacity is overflown beyond FIFO == full,  the issue is that the counter overflows to zero. And then, in the next cycle, it says that the counter zero, that the FIFO is empty, because the data has Rolled over. I don't know how to solve this in a relaible way. 

  writing to FIFO only when not full, is not sufficient since if rd_en is asserted, counter is decreased.

SOLVED: Needed to add condition in counter to not modify state when FIFO is full or FIFO is empty

One more thing seen in the logs, which were printed out, is that? It does not. The the FIFO does not state that it has been overflown. So, it might also be an issue with the test bench. 

More investigation is needed into this. 