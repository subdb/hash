The hash function is one of the main parts of the SubDB ecosystem. You need to know the hash of the video file, either to download or upload subtitles.
Our hash is composed by taking the first and the last 64kb of the video file, putting all together and generating a md5 of the resulting data (128kb).

This repository contain implementation samples of the SubDB hash function on multiple languages.

# Testing

To make sure that your hash function is returning the correct hash for a video, here we have two sample files you can use to compare:

[Showtime Dexter Promo][2] sample for SubDB: ffd8d4aa68033dc03d1c8ef373b9028c  
[FX Justified Trailer][3] sample for SubDB: edc1981d6459c6111fe36205b4aff6c2 

# Contributing

Want to contribute? Great! Just follow these simple steps:

1. Fork it.
2. Create a branch (`git checkout -b my_hash_code`)
3. Commit your changes (`git commit -am "Add hash sample written on my favorite language"`)
4. Push to the branch (`git push origin my_hash_code`)
5. Open a [Pull Request][1]
6. Enjoy a refreshing Coke Zero and wait

[1]: http://github.com/subdb/hash/pulls
[2]: http://thesubdb.com/api/samples/dexter.mp4
[3]: http://thesubdb.com/api/samples/justified.mp4
