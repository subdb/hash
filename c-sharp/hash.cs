/// <summary>
/// Returns hash for SubDB
/// </summary>
/// <param name="filePath">File Path</param>
/// <returns>MD5 string</returns>
string getHash(string filePath) {
	int readSize = 64 * 1024;
	byte[] bytes = new byte[2 * readSize];
	using (BinaryReader reader = new BinaryReader(new FileStream(filePath, FileMode.Open)))
	{
		byte[] firstBytes = new byte[readSize];
		byte[] lastBytes = new byte[readSize];
		reader.Read(firstBytes, 0, readSize);
		reader.BaseStream.Seek(-(readSize), SeekOrigin.End); //added the () for readSize, otherwise gives an IOException
		reader.Read(lastBytes, 0, readSize);
		Array.Copy(firstBytes, bytes, firstBytes.Length);
		Array.Copy(lastBytes, 0, bytes, firstBytes.Length, lastBytes.Length);
	}
	var md5 = System.Security.Cryptography.MD5.Create().ComputeHash(bytes);
	var sb = new StringBuilder();
	foreach (var b in md5)
		sb.Append(b.ToString("X2"));
	return sb.ToString();
}