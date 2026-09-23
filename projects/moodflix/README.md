# Moodflix

A React and Vite movie browser exercise. It searches and discovers movies through TMDB and uses Appwrite to record search counts and display trending searches.

## Setup

Requires Node.js and npm. From this directory, install dependencies and start Vite:

```bash
npm install
npm run dev
```

Create a `.env.local` file with the following Vite variables, then provide values from your TMDB and Appwrite projects:

```env
VITE_TMDB_API_KEY=
VITE_APPWRITE_PROJECT_ID=
VITE_APPWRITE_DATABASE_ID=
VITE_APPWRITE_COLLECTION_ID=
```

The Appwrite collection is expected to support `searchTerm`, `count`, `movie_id`, and `poster_url` fields. `npm run build` creates a production bundle; `npm run lint` runs ESLint.
