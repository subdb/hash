# Author: David Santiago <https://github.com/demanuel/dessubdb>
# Excerpt from the project dessubdb

# Calculates the file hash, as specified in the thesubdb site
sub getFileHash {
      my $filename = shift or die 'A filename is required!';
      my $filesize = -s $filename;
      die "The file is too small! Wrong file?!? " unless $filesize > BLOCK_SIZE*2;
      open (my $fh, "<", $filename) or die "Couldn't open file $filename: $!";
      binmode $fh;
      my $buffer;
      my $data;
      read $fh, $data, BLOCK_SIZE;
      $buffer = $data;
      seek $fh, -1*BLOCK_SIZE, 2;
      read $fh, $data, BLOCK_SIZE;
      $buffer .=$data;
      close $fh;
      say "Hash= ".md5_hex($buffer);
      md5_hex($buffer);
}

#Usage

print getFileHash($filename);
