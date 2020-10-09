# Bitswap exchange with libp2p.
In this example we will showcase a Bitswap random file exchange using a compressed and an uncompressed
transport in libp2p. To run the example:
* First build the code
```
$ go build
```
* And the run the example compressed:
```
$ ./bitswap --size 1234567 --iterations 100
[*] Starting libp2p nodes with compression
[*] Nodes dialed successfully
[*] Running the 100 runs
[*] Average time to fetch: 0.138843 s
```
* Or uncompressed:
```
$ ./bitswap --size 1234567 --iterations 100 --nocompression
[*] Starting libp2p nodes without compression
[*] Nodes dialed successfully
[*] Running the 100 runs
[*] Average time to fetch: 0.062846 s
```

And play with it as much as you want! I did so already :)