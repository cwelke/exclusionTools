exclusionTools
==============
Use these tools to make data cards to run exclusions.

1. Make sure root is set up correctly. (NEED TO FIX THIS IN THE CODE)
2. Edit makeMultiBinDataCards.sh and add a line for each data card. (NEED TO ADD A SEPARATE SCRIPT FOR SCANS)
3. Edit do.sh and add the datacards run from the previous step. (AGAIN, NEED TO ADD A SEPARATE SCRIPT)
4. Edit do_getExpectedLimit.sh in same way as previous step.
5. Run everything in this order.
6. Output should be stored in a text file in the limitLogs directory. The summary tells you the results for all the datacards in one place.
