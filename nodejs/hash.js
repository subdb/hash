// this hash version requires the When library for dealing with async events

var W = require("when");
var nodefn = require("when/node/function");
var fs = require("fs");
var crypto = require("crypto");

var CHUNK_SIZE = 64 * 1024;

module.exports = function(path) {
  var buffer = new Buffer(CHUNK_SIZE * 2);

  return nodefn.call(fs.stat, path).then(function(stat) {
    var fileSize = stat.size;

    return nodefn.call(fs.open, path, "r").then(function(fd) {
      var reads = [0, fileSize - CHUNK_SIZE].map(function(offset, index) {
        return nodefn.call(fs.read, fd, buffer, CHUNK_SIZE * index, CHUNK_SIZE, offset);
      });

      return W.all(reads).then(function() {
        var md5sum = crypto.createHash("md5");
        md5sum.update(buffer);

        return md5sum.digest("hex");
      });
    });
  });
};
