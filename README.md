# Along313 Agent

A [Flue](https://flueframework.com) agent for scheduled Detroit carpooling. It helps drivers share open seats on trips they already plan to make and helps riders evaluate affordable route matches.

## Project structure

- `src/` contains the Flue transportation agent.
- `frontend/` contains the Carpool web application and deployment configuration.
- `pitch/` contains the Venture 313 presentation deck, corrected video pitch, screenshots, and video-rendering source.

## Setup

```sh
npm install
```

Then add your OpenAI API key to `.env` as `OPENAI_API_KEY`.

## Talk to your agent

```sh
npx flue run src/agents/along313.ts --message "I am driving from Grandmont to Detroit Metro Airport tomorrow at 7 AM and have three open seats."
```

Conversations are durable — pass `--id <id>` to continue one.

## Learn more

- [Flue docs](https://flueframework.com/docs/) — or `npx flue docs` from the terminal.
