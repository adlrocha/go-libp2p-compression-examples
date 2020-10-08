module github.com/libp2p/go-libp2p-compression-examples

go 1.14

require (
	github.com/libp2p/go-libp2p v0.8.1
	github.com/libp2p/go-libp2p-core v0.7.0
	github.com/libp2p/go-libp2p-gzip v0.0.0-00010101000000-000000000000
	github.com/multiformats/go-multiaddr v0.3.1
)

// Compression with go-libp2p-core 0.7
// replace github.com/libp2p/go-libp2p-core => github.com/adlrocha/go-libp2p-core bf5d45ca7e53c6c20d8f319f0f23c2fef93bf7f6
// Compression with go-libp2p-core 0.6
replace github.com/libp2p/go-libp2p-core => github.com/adlrocha/go-libp2p-core v0.6.2-0.20201008055055-b309947fc237

replace github.com/libp2p/go-libp2p => github.com/adlrocha/go-libp2p v0.11.1-0.20201008063238-d1909d9adebc

replace github.com/libp2p/go-libp2p-gzip => github.com/adlrocha/go-libp2p-gzip v0.0.0-20201008055912-3c159e9de091

replace github.com/libp2p/go-conn-compression-multistream => github.com/adlrocha/go-conn-compression-multistream v0.0.0-20201008054958-988bc118b907

replace github.com/libp2p/go-libp2p-transport-upgrader => github.com/adlrocha/go-libp2p-transport-upgrader v0.3.1-0.20201007105011-1e846954f580
