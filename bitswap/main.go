package main

import (
	"context"
	"flag"
	"fmt"
	"time"

	"github.com/libp2p/go-libp2p"
	cbrotli "github.com/libp2p/go-libp2p-cbrotli"
	none "github.com/libp2p/go-libp2p-core/compression/none"
	"github.com/libp2p/go-libp2p-core/host"
	"github.com/libp2p/go-libp2p-core/metrics"
	gzip "github.com/libp2p/go-libp2p-gzip"
	"github.com/libp2p/go-libp2p/config"
)

func startRun(compression string, iterations int, size int) *metrics.BandwidthCounter {
	ctx := context.Background()
	var h1, h2 host.Host
	var err error
	reporter := metrics.NewBandwidthCounter()

	var compOpt config.Option

	switch compression {
	case "gzip":
		compOpt = libp2p.Compression(gzip.ID, gzip.New)
	case "cbrotli":
		libp2p.Compression(cbrotli.ID, cbrotli.New)
	default:
		libp2p.Compression(none.ID, none.New)
	}

	fmt.Println("[*] Starting libp2p compressed with", compression)
	h1, err = libp2p.New(ctx, compOpt, libp2p.BandwidthReporter(reporter))
	if err != nil {
		panic(err)
	}
	h2, err = libp2p.New(ctx, compOpt)
	if err != nil {
		panic(err)
	}
	defer h1.Close()
	defer h2.Close()

	// Create new blockstores for
	bstore1, err := CreateBlockstore(ctx, 1000)
	if err != nil {
		panic(err)
	}
	bsnode1, err := CreateBitswapNode(ctx, h1, bstore1)
	if err != nil {
		panic(err)
	}
	bstore2, err := CreateBlockstore(ctx, 1000)
	if err != nil {
		panic(err)
	}
	bsnode2, err := CreateBitswapNode(ctx, h2, bstore2)
	if err != nil {
		panic(err)
	}

	// Wait for a while until the hosts are reaedy.
	time.Sleep(3 * time.Second)

	err = DialOtherPeer(ctx, h1, *host.InfoFromHost(h2))
	if err != nil {
		panic(err)
	}
	fmt.Println("[*] Nodes dialed successfully")
	fmt.Printf("[*] Running the %d runs\n", iterations)

	var totalTime float64

	for i := 0; i < iterations; i++ {
		tmpFile := RandReader(size)
		ipldNode, err := bsnode1.Add(ctx, tmpFile)
		if err != nil {
			panic(err)
		}
		start := time.Now()
		err = bsnode2.FetchGraph(ctx, ipldNode.Cid())
		if err != nil {
			panic(err)
		}
		totalTime += time.Since(start).Seconds()
	}

	fmt.Printf("[*] Average time to fetch: %f s\n", totalTime)

	return reporter
}
func main() {
	compression := flag.String("compression", "gzip", "Select a compression algorithm")
	iterations := flag.Int("iterations", 100, "number of iterations for the random file exchange")
	size := flag.Int("size", 1234567, "size of the random file")
	flag.Parse()

	_ = startRun(*compression, *iterations, *size)

	// reporter := startRun(*compressed, *iterations, *size)
	// fmt.Println(float64(reporter.GetBandwidthTotals().TotalOut))
	// fmt.Println(reporter.GetBandwidthTotals().TotalIn)
}
