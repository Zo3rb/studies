# Node.js File Processor

A small CommonJS exercise that streams a text file through an uppercase or lowercase transform and writes the result to `output.txt`. It demonstrates Node.js streams, `pipeline`, configuration, and logging.

## Run

Requires Node.js. From this directory:

```bash
npm start
```

The default input is `input.txt`, the output is `output.txt`, and the default operation is uppercase. Choose lowercase with:

```bash
PROCESS_TYPE=lowercase npm start
```

The input and output paths are defined in `src/config.js`. The input must exist, and the input and output must be different files.
