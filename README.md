# AzureProxy

Tiny proxy for fetching Azure ASR/TTS tokens. Clients authenticate with a bearer token so that the Azure key is never exposed.

## Setup

Copy `.env.example` to `.env` and fill in the values:

```
AZURE_KEY=        # Azure Cognitive Services subscription key
AZURE_REGION=     # Azure region, e.g. northeurope
API_KEY=          # Bearer token clients must supply (see below)
SECRET_KEY_BASE=  # Phoenix secret — generate with: openssl rand -base64 64
```

## Running

```bash
docker compose up -d
```

The server listens on `localhost:4000` by default. Change `PORT` in `.env` to use a different port.

## API

### `GET /api/token`

Returns an Azure ASR/TTS token. Requires a bearer token in the `Authorization` header.

```bash
curl https://DOMAINNAME:4000/api/token \
  -H "Authorization: Bearer <your-api-key>"
```

Returns the token as plain text on success, or `401` if the key is missing or wrong.
