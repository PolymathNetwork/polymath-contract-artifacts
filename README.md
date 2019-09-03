## @polymathnetwork/contract-artifacts

Smart contract compilation artifacts for Polymath v3.1.0

## Installation

```bash
yarn add @polymathnetwork/contract-artifacts
```

**Import**

```typescript
import * as artifacts from "@polymathnetwork/contract-artifacts";
```

or

```javascript
var artifacts = require("@polymathnetwork/contract-artifacts");
```

## Contributing

We welcome improvements and fixes from the wider community! To report bugs within this package, please create an issue in this repository.

### Install dependencies

If you don't have yarn workspaces enabled (Yarn < v1.0) - enable them:

```bash
yarn config set workspaces-experimental true
```

Then install dependencies

```bash
yarn install
```

### Zip artifacts

Python3.5 required

```bash
cd scripts
python3 abiReducer.py ../unzipArtifacts ../artifacts
```

### Build

To build this package run the following from root directory:

```bash
yarn build
```
