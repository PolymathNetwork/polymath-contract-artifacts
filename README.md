## @polymath-core-artifacts

Smart contract compilation artifacts for Polymath v2.1.0.

## Installation

```bash
yarn add polymath-core-artifacts
```

**Import**

```typescript
import * as artifacts from 'polymath-core-artifacts';
```

or

```javascript
var artifacts = require('polymath-core-artifacts');
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

### Build

To build this package run the following from root directory:

```bash
yarn build
```

### Clean

```bash
yarn clean
```

### Lint

```bash
yarn lint
```