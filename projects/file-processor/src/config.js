const path = require("node:path");

/**
 * Default configuration for the file processor.
 * @type {{ inputFile: string, outputFile: string, processType: string }}
 */
const config = {
  inputFile: path.join(__dirname, "..", "input.txt"),
  outputFile: path.join(__dirname, "..", "output.txt"),
  processType: process.env.PROCESS_TYPE || "uppercase",
};

module.exports = config;
