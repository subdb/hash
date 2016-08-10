package main

import (
	"crypto/md5"
	"encoding/hex"
	"io"
	"log"
	"os"
)

const chunkSize = 64 * 1024

func Hash(path string) (string, error) {
	hash := md5.New()

	file, err := os.Open(path)
	if err != nil {
		return "", err
	}
	defer file.Close()

	if _, err := io.CopyN(hash, file, chunkSize); err != nil {
		return "", err
	}
	if _, err := file.Seek(-chunkSize, os.SEEK_END); err != nil {
		return "", err
	}
	if _, err := io.CopyN(hash, file, chunkSize); err != nil {
		return "", err
	}

	return hex.EncodeToString(hash.Sum(nil)), nil
}

func main() {
	log.SetFlags(0)
	for _, arg := range os.Args[1:] {
		hash, err := Hash(arg)
		if err != nil {
			log.Fatalln(err)
		}
		println(hash)
	}
}
