# Tawheed Storefront

A React, TypeScript, and Vite storefront interface. The source is organized into pages, reusable components, cart and theme contexts, Redux store code, and a small products API service.

## Setup

Requires Node.js and npm. From this directory:

```bash
npm install
npm run dev
```

The API client uses `VITE_API_URL` when set and otherwise requests `http://localhost:3001/api`. A compatible backend is needed for product requests. Create a local `.env` file if the backend runs elsewhere:

```env
VITE_API_URL=http://localhost:3001/api
```

Useful project commands:

```bash
npm run build
npm run lint
```

The build runs TypeScript project checks before creating the Vite bundle.
