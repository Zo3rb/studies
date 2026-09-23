const fs = require("node:fs");
const path = require("node:path");
const { Transform } = require("node:stream");
const { pipeline } = require("node:stream/promises");
const logger = require("./logger");

/** File processor for reading, transforming, and writing text files. */
class FileProcessor {
  /**
   * @param {{ inputFile: string, outputFile: string, processType: string }} config
   */
  constructor(config) {
    this.inputFile = config.inputFile;
    this.outputFile = config.outputFile;
    this.processType = config.processType;
  }

  /** Process the configured input file and resolve after the output is closed. */
  async processFile() {
    if (path.resolve(this.inputFile) === path.resolve(this.outputFile)) {
      throw new Error("Input and output files must be different");
    }

    const processor = new Transform({
      transform: (chunk, encoding, callback) => {
        try {
          const input = Buffer.isBuffer(chunk) ? chunk : Buffer.from(chunk, encoding);
          const result = this.processData(input);
          logger.logData(input.length);
          callback(null, result);
        } catch (error) {
          callback(error);
        }
      },
    });

    logger.logStart(this.inputFile);
    try {
      await pipeline(
        fs.createReadStream(this.inputFile, { encoding: "utf8" }),
        processor,
        fs.createWriteStream(this.outputFile)
      );
      logger.logEnd(this.outputFile);
    } catch (error) {
      logger.logError(error);
      throw error;
    }
  }

  /** @param {Buffer} buffer @returns {string} */
  processData(buffer) {
    const data = buffer.toString("utf8");
    switch (this.processType) {
      case "uppercase":
        return data.toUpperCase();
      case "lowercase":
        return data.toLowerCase();
      default:
        throw new Error(`Unknown process type: ${this.processType}`);
    }
  }
}

module.exports = FileProcessor;
