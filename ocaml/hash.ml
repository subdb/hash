let chunk_size = 64 * 1024
let hash path =
    let file = open_in_bin path
    and bytes = Bytes.create @@ chunk_size * 2 in
    really_input file bytes 0 chunk_size;
    seek_in file @@ (in_channel_length file) - chunk_size;
    really_input file bytes chunk_size chunk_size;
    Digest.to_hex @@ Digest.bytes bytes;;

let args = Array.sub Sys.argv 1 @@ (Array.length Sys.argv) - 1
and each arg = print_endline @@ hash arg in
Array.iter each args;;
