/**
 * Author: Gautam Sawhney <http://pastie.org/9779419#6>
 * http://subdb.userecho.com/users/1334572-gautam-sawhney/topic/
 */

def get_hash(name)
    readsize = 64 * 1024
    File.open(name, 'rb') do |f|
        size = File.size?(name)
        data = f.read(readsize)
        f.seek(-readsize, IO::SEEK_END)
        data += f.read(readsize)
        return Digest::MD5.hexdigest(data)
    end
end
