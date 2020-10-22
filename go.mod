module github.com/libp2p/go-libp2p-compression-examples

go 1.14

require (
	github.com/ipfs/go-bitswap v0.2.20
	github.com/ipfs/go-blockservice v0.1.3
	github.com/ipfs/go-cid v0.0.7
	github.com/ipfs/go-datastore v0.4.4
	github.com/ipfs/go-ipfs-blockstore v1.0.1
	github.com/ipfs/go-ipfs-chunker v0.0.5
	github.com/ipfs/go-ipfs-delay v0.0.1
	github.com/ipfs/go-ipfs-routing v0.1.0
	github.com/ipfs/go-ipld-format v0.2.0
	github.com/ipfs/go-merkledag v0.3.2
	github.com/ipfs/go-unixfs v0.2.4
	github.com/klauspost/compress v1.11.1 // indirect
	github.com/libp2p/go-libp2p v0.8.3
	github.com/libp2p/go-libp2p-cbrotli v0.0.0-00010101000000-000000000000 // indirect
	github.com/libp2p/go-libp2p-core v0.7.0
	github.com/libp2p/go-libp2p-gzip v0.0.0-00010101000000-000000000000
	github.com/multiformats/go-multiaddr v0.3.1
	github.com/multiformats/go-multihash v0.0.14
	github.com/pkg/errors v0.9.1
	golang.org/x/sync v0.0.0-20200317015054-43a5402ce75a
)

// Compression with go-libp2p-core 0.7
// replace github.com/libp2p/go-libp2p-core => github.com/adlrocha/go-libp2p-core bf5d45ca7e53c6c20d8f319f0f23c2fef93bf7f6
// Compression with go-libp2p-core 0.6
replace github.com/libp2p/go-libp2p-core => github.com/adlrocha/go-libp2p-core v0.6.2-0.20201008055055-b309947fc237

replace github.com/libp2p/go-libp2p => github.com/adlrocha/go-libp2p v0.11.1-0.20201009165647-9e32a3d1018e

replace github.com/libp2p/go-libp2p-gzip => github.com/adlrocha/go-libp2p-gzip v0.0.0-20201008055912-3c159e9de091

replace github.com/libp2p/go-conn-compression-multistream => github.com/adlrocha/go-conn-compression-multistream v0.0.0-20201008054958-988bc118b907

replace github.com/libp2p/go-libp2p-transport-upgrader => github.com/adlrocha/go-libp2p-transport-upgrader v0.3.1-0.20201009165416-df4b32d10a02

replace github.com/libp2p/go-libp2p-cbrotli => github.com/adlrocha/go-libp2p-cbrotli v0.0.0-20201022095630-f5f18e9677b1
