# go-libp2p-compression-examples
This repo includes a set of examples that wraps the use of compression in `go-libp2`. This compression layer lays between the security module and the raw transport. Consequently, if a node uses compression and wants to use a secure channel, the raw transport connection is upgraded to a compressed connection, which is subsequently converted in a secure transport over the compressed connection.

_Disclaimer: This is a proof of concept tested with TCP and UDP, for other transport protocols such as the QUIC transport things may break a bit_

## How was compression added to `go-libp2p`?
In order to add compression to lib2p the following changes over `libp2p` repos had to be made:
* In `go-libp2p-core` a `compression` interface was added along with a `none` compression transport to fallback to it if compression is not supported in a node.
* The `go-libp2p-transport-upgrader` had to be updated with a `setupCompression` function so nodes know how to upgrade their raw transport connection to a compressed connection.
* The `go-conn-compression-multistream` was created to allow nodes to be able to negotiate what compression algorithm to use.
* In `go-libp2p` a compression constructor with its corresponding options and configs were added to support compression in libp2p hosts. 
* Finally, a `go-libp2p-gzip` transport was created to illustrate the implementation and use of a compressed transport. 

## Where does the code live?
All the aforementioned repos don't live in libp2p yet, and they are all hosted as forks or newly created repo in my personal account (for now):
* `go-libp2p-core` (v0.6 fork): https://github.com/adlrocha/go-libp2p-core/tree/feat/compression-v0.6.1
* `go-libp2p-core` (v0.7 fork): https://github.com/adlrocha/go-libp2p-core/tree/feat/compression
* `go-libp2p`: https://github.com/adlrocha/go-libp2p/tree/feat/compression
* `go-libp2p-transport-upgrader`: https://github.com/adlrocha/go-libp2p-transport-upgrader/tree/feature/compression
* `go-conn-compression-multistream`: https://github.com/adlrocha/go-conn-compression-multistream
* `go-libp2p-gzip`: https://github.com/adlrocha/go-libp2p-gzip

## Why are the `go.mod` of all these repos full of replaces?
Libp2p is really modular, and thus a simple update may require changes in a bunch of repos. In order to avoid Go from fetching the latest upstream versions of the code (which doesn't include compression yet), and so you can test compression straight away, I chose to freeze the versions through replaces in my forked repos. Managing versions this way is a bit of a nightmare for developers but it makes it easy for users to test functionalities without having to worry about versioning, forks, branches, packages, etc.

## So how can I test compression in my own application?
You may have to add the whole `go.mod replace` paraphernalia to your libp2p application for this to work. Once you have that, adding compression is as simple as this:
```
opts := []libp2p.Option{
		libp2p.Compression(gzip.ID, gzip.New),
	}
```

Once again, this is a proof-of-concept to evaluate the benefits of compression within libp2p, it may achieve a more "productive" state in the future, but for now expect things to break or act weird.
