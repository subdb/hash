require "crypto/md5"

CHUNK_SIZE = 64 * 1024

def hash(name : String) : String
  File.open(name) do |f|
    buffer = Slice(UInt8).new(CHUNK_SIZE * 2)
    f.read(buffer[0, CHUNK_SIZE])
    f.seek(-CHUNK_SIZE, IO::Seek::End)
    f.read(buffer[CHUNK_SIZE, CHUNK_SIZE])
    Crypto::MD5.hex_digest(String.new(buffer))
  end
end

ARGV.each { |arg| puts hash arg }
